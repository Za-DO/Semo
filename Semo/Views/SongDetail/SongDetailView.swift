//
//  SongDetailView.swift
//  Semo
//
//  Created by 조은비 on 2022/07/17.
//

import SwiftUI

struct SongDetailView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \SingingList.timestamp, ascending: true)], animation: .default) private var singingList: FetchedResults<SingingList>
    @GestureState private var dragOffset = CGSize.zero
    @State var refresh: Bool = false
    @State private var refreshingID = UUID()
    @State private var isChanged = false
    @State private var showDeleteAlert: Bool = false
    @State private var showSaveAlert: Bool = false
    @State private var isPresented = false // 싱잉리스트 추가 sheet
    
    var song: Song
    var levelPickerItems: [String] = ["하", "중", "상"]
    var genderItems = ["여키", "남키", "혼성"]
    var tunePickerItems: [String] = ["-6", "-5", "-4", "-3", "-2", "-1",
                                     "+0", "+1", "+2", "+3", "+4", "+5", "+6"]
    
    @State var genderIndex: String
    @State var levelPickerIndex: Int
    @State var tunePickerIndex: Int
    
    // MARK: - BODY
    
    var body: some View {
        ZStack(alignment: .top) {
            Image("backgroundImage")
                .ignoresSafeArea()
            
            Rectangle()
                .foregroundColor(.grayScale6)
                .opacity(0.4)
                .frame(height: 220)
                .ignoresSafeArea()
            
            // MARK: - 디테일뷰 컨텐츠
            
            VStack {
                SongInfoView(song: song)
                    .padding(.bottom, 46)
                
                ScrollView {
                    LevelPickerView(levelIndexBase: $levelPickerIndex, levelItems: levelPickerItems)
                        .onChange(of: levelPickerIndex, perform: { _ in
                            if levelPickerItems[levelPickerIndex] != song.level {
                                isChanged = true
                            }
                            print("changed")
                        })
                    
                    TunePickerView(genderIndexBase: $genderIndex, genderItems: genderItems, tuneIndexBase: $tunePickerIndex, tuneItems: tunePickerItems)
                    // TODO: Padding 세부 간격 조절 필요
                        .padding(.bottom, 42)
                        .onChange(of: genderIndex, perform: { _ in
                            if genderIndex != song.gender {
                                isChanged = true
                            }
                            print("changed")
                        })
                        .onChange(of: tunePickerIndex, perform: { _ in
                            if tunePickerItems[tunePickerIndex] != song.tune {
                                isChanged = true
                            }
                            print("changed")
                        })
                    
                    HStack {
                        ContentsTitleView(titleName: "싱잉리스트")
                        Spacer()
                        SongEditButtonView(buttonName: "추가하기", buttonWidth: 80){
                            isPresented.toggle()
                        }
                        .padding(EdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 34))
                        .onChange(of: song.singingListArray, perform: { _ in
                            isChanged = true
                            print("changed")
                        })
                    }
                    
                    ForEach(song.singingListArray) {
                        singingListTag(singingList: $0)
                    }
                    .id(refreshingID)
                    
                    // MARK: - 노래 삭제하기 버튼
                    Button(action: {
                        print("노래 삭제하기")
                        self.showDeleteAlert = true
                    }, label: {
                        ConfirmButtonView(buttonName: "노래 삭제하기", buttonColor: Color.grayScale7.opacity(0.2), textColor: .red)
                            .padding(.top, 30)
                    })
                    .alert("이 노래를 삭제하시겠습니까?", isPresented: $showDeleteAlert) {
                        Button("취소", role: .cancel) {}
                        Button("삭제", role: .destructive) {
                            CoreDataManager.shared.deleteSong(song: song)
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    }
                }
                
                // MARK: - 상단 네비게이션 바 저장 버튼
                
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        SongEditButtonView(buttonName: "저장", buttonWidth: 50) {
                            // 노래 데이터 변경사항 코어데이터에 저장하는 코드
                            CoreDataManager.shared.updateSongAdditionalInformation(song: song, gender: genderIndex, level: levelPickerItems[levelPickerIndex], tune: tunePickerItems[tunePickerIndex])
                            print("기록 저장하기")
                            isChanged = false
                        }
                        .padding(.trailing, 20)
                        .opacity(isChanged == true ? 1 : 0.2)
                        .disabled(!isChanged)
                    }
                }
                .padding(.bottom, 100)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        if !isChanged {
                            CustomBackButton(buttonName: "") {
                                self.presentationMode.wrappedValue.dismiss()
                            }
                        } else {
                            CustomBackButton(buttonName: "") {
                                self.showSaveAlert = true
                            }
                            .alert("변경사항을 저장하시겠습니까?", isPresented: $showSaveAlert) {
                                Button("아니요", role: .cancel) {
                                    self.presentationMode.wrappedValue.dismiss()
                                }
                                Button("저장", role: .none) {
                                    // 노래 데이터 변경사항 코어데이터에 저장하는 코드
                                    CoreDataManager.shared.updateSongAdditionalInformation(song: song, gender: genderIndex, level: levelPickerItems[levelPickerIndex], tune: tunePickerItems[tunePickerIndex])
                                    self.presentationMode.wrappedValue.dismiss()
                                }
                            }
                        }
                    }
                }
            }
        }
        .sheet(isPresented: $isPresented) {
            SingingListSheetView(refresh: $refresh, isPresent: $isPresented, song: song)
        }
        .onChange(of: isPresented, perform: { _ in
            refresh.toggle()
        })
        .onDisappear(perform: {
            print("alert")
            if isChanged == true {
                showSaveAlert = true
            }
        })
        .navigationBarBackButtonHidden(true)
        .gesture(DragGesture().updating($dragOffset) { (value, state, transaction) in
            if (value.startLocation.x < 30 && value.translation.width > 100 && isChanged == false) {
                if isChanged {
                    self.showSaveAlert = true
                }
                self.presentationMode.wrappedValue.dismiss()
            }
        })
    }
    
    // MARK: - singingListTagView
    @ViewBuilder
    func singingListTag(singingList: SingingList) -> some View {
        HStack {
            Button {
                song.removeFromSongToSingingList(singingList)
                do {
                    try viewContext.save()
                    self.refreshingID = UUID()
                } catch {
                    print(error.localizedDescription)
                }
                print("\(singingList.title ?? "제목 없음") 싱잉리스트 태그 삭제하기2")
            } label: {
                Image(systemName: "minus.circle.fill")
                    .foregroundColor(.grayScale4)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 10))
            }
            HStack {
                Text(singingList.title ?? "제목 없음")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.white)
            }
            Spacer()
        }
        .padding(.top, 20)
    }
}
