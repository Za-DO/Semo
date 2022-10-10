//
//  SingingListDetailView.swift
//  Semo
//
//  Created by 유정인 on 2022/07/17.
//

import SwiftUI

struct SingingListDetailView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @GestureState private var dragOffset = CGSize.zero
    @State var isSingingListTitleEditing: Bool = false
    @State private var showSaveAlert: Bool = false
    @State var singingListViewFetch: Bool = false
    @State var changedSingingListTitle: String = ""
    @Binding var songList: [Song]
    @Binding var listDetailEditButtonTapped: Bool
    
    var singingList: SingingList
    
    @State var singingListTitle: String {
        willSet {
            singingListTitle = singingList.title ?? "제목없음"
        }
    }

    // MARK: - BODY
    var body: some View {
        GeometryReader { _ in
            ZStack {
                Image("backgroundImage")
                    .ignoresSafeArea(.all)
                Rectangle()
                    .edgesIgnoringSafeArea(.all)
                    .frame(height: UIScreen.main.bounds.height * 0.16)
                    .foregroundColor(listDetailEditButtonTapped == true ? .grayScale7 : .grayScale6)
                    .opacity(listDetailEditButtonTapped == true ? 1 : 0.4)
                    .padding(.bottom, 650)
                TextField("", text: $singingListTitle, onEditingChanged: { changed in
                    self.isSingingListTitleEditing = changed
                })
                .font(.system(size: 28, weight: .semibold))
                .foregroundColor(.white)
                .placeholder(when: singingListTitle.isEmpty) {
                    Text(singingList.title ?? "제목없음")
                        .font(.system(size: 28, weight: .semibold))
                        .foregroundColor(.grayScale2)
                }
                .disabled(!listDetailEditButtonTapped)
                .underlineTextField(isEditing: isSingingListTitleEditing, isFull: !singingListTitle.isEmpty, inset: 55, active: listDetailEditButtonTapped)
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 600, trailing: 10))
                VStack {
                    // MARK: - 전체 노래 리스트 상단 바
                    HStack {
                        Text("노래 목록 (\(singingList.count))")
                            .font(.subheadline)
                            .foregroundColor(.grayScale2)
                            .fontWeight(.medium)
                        Spacer()
                    }
                    .padding(EdgeInsets(top: 15, leading: 20, bottom: 15, trailing: 0))
                    // MARK: - 노래 리스트 생성 및 스크롤 추가
                    ScrollView {
                        Divider()
                            .background(Color.grayScale6)
                            .frame(width: 350)
                        ForEach(singingList.songArray) {
                            SingingListDetailCellView(singingListViewFetch: $singingListViewFetch, listDetailEditButtonTapped: $listDetailEditButtonTapped, singingList: singingList, song: $0)
                            Divider()
                                .background(Color.grayScale6)
                                .frame(width: 350)
                        }
                        .padding(.top, 10)
                        // TODO: - 이후 업데이트에서 새 노래 추가가 아닌 기존 노래 추가로 기능 변경
        //                AddSongButtonView()
                        Spacer()
                    }
                }
                .padding(.top, 175)
            }
            .ignoresSafeArea(.all)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                SongEditButtonView(buttonName: listDetailEditButtonTapped == true ? "완료" : "편집", buttonWidth: 50) {
                    self.listDetailEditButtonTapped.toggle()
                    CoreDataManager.shared.updateSingingListTitle(title: singingListTitle, singingList: singingList)
                }
                .padding(.trailing, 20)
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                if listDetailEditButtonTapped == false {
                    CustomBackButton(buttonName: "") {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                    .navigationBarBackButtonHidden(true)
                } else {
                    Button {
                        // TODO: - 뷰 리프레시 필요
                        self.listDetailEditButtonTapped.toggle()
                        print("리스트 편집 그만하기")
                    } label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.white)
                    }
                    .navigationBarBackButtonHidden(true)
                }
            }
        }
        .gesture(DragGesture().updating($dragOffset) { (value, state, transaction) in
            if (value.startLocation.x < 30 && value.translation.width > 100) {
                // TODO: - 변경된 값이 있는 경우 swipeback alert 띄우기
                self.presentationMode.wrappedValue.dismiss()
            }
        })
        .onDisappear {
            self.listDetailEditButtonTapped = false
        }
        .onChange(of: singingListViewFetch, perform: { _ in
            songList = CoreDataManager.shared.fetchSongList() ?? []
            print("싱잉리스트 리프레쉬")
        })
        .onAppear{
            self.singingListViewFetch.toggle()
        }
    }
}
