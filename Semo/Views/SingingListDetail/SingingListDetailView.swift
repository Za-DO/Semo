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
    @Binding var listEditButtonTapped: Bool
    @Binding var songEditButtonTapped: Bool
    
    var singingList: SingingList
    
    @State var singingListTitle: String {
        willSet {
            singingListTitle = singingList.title ?? "제목없음"
        }
    }

    // MARK: - BODY
    var body: some View {
        ZStack {
            Image("backgroundImage")
                .edgesIgnoringSafeArea(.vertical)
            Rectangle()
                .edgesIgnoringSafeArea(.all)
                .frame(height: UIScreen.main.bounds.height * 0.16)
                .foregroundColor(songEditButtonTapped == true ? .grayScale7 : .grayScale6)
                .opacity(songEditButtonTapped == true ? 1 : 0.4)
                .padding(.bottom, 700)
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
            .disabled(!songEditButtonTapped)
            .underlineTextField(isEditing: isSingingListTitleEditing, isFull: !singingListTitle.isEmpty, inset: 55, active: songEditButtonTapped)
            .padding(.horizontal, 10)
            .padding(.bottom, 650)
            SingingListDetailCellView(songEditButtonTap: $songEditButtonTapped, singingList: singingList)
                .padding(.top, 35)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                SongEditButtonView(buttonName: songEditButtonTapped == true ? "완료" : "편집", buttonWidth: 50) {
                    self.songEditButtonTapped.toggle()
                }
                .padding(.trailing, 20)
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                if songEditButtonTapped == false {
                    CustomBackButton(buttonName: "") {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                    .navigationBarBackButtonHidden(true)
                } else {
                    Button {
                        self.showSaveAlert = true
                        print("리스트 편집 그만하기")
                    } label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.white)
                    }
                    .navigationBarBackButtonHidden(true)
                    .alert("변경사항을 저장하시겠습니까?", isPresented: $showSaveAlert) {
                        Button("아니요", role: .cancel) {
                            self.presentationMode.wrappedValue.dismiss()
                        }
                        Button("저장", role: .none) {
                            // TODO: - 리스트 데이터 변경사항 코어데이터에 저장하는 코드
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    }
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
            self.songEditButtonTapped = false
        }
    }
}
