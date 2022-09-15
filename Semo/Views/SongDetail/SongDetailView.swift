//
//  SongDetailView.swift
//  Semo
//
//  Created by 조은비 on 2022/07/17.
//

import SwiftUI

struct SongDetailView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \SingingList.timestamp, ascending: true)], animation: .default) private var singingList: FetchedResults<SingingList>
    @State var refresh: Bool = false
    @State private var isChanged = false
    var song: Song
    
    // 싱잉리스트 추가 sheet
    @State private var isPresented = false
    @State var levelPickerIndex: Int = 1
    var levelPickerItems: [String] = ["하", "중", "상"]
    
    var genderItems = ["여성", "혼성", "남성"]
    @State var genderIndex = "혼성"
    
    @State var tunePickerIndex: Int = 6
    var tunePickerItems: [String] = ["-6", "-5", "-4", "-3", "-2", "-1",
                                     "0", "+1", "+2", "+3", "+4", "+5", "+6"]
    
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
                    .padding(.bottom, 52)
                
                ScrollView {
                    LevelPickerView(levelIndexBase: $levelPickerIndex, levelItems: levelPickerItems)
                        .onChange(of: levelPickerIndex, perform: { _ in
                            isChanged = true
                            print("changed")
                        })
                    
                    TunePickerView(genderIndexBase: $genderIndex, genderItems: genderItems, tuneIndexBase: $tunePickerIndex, tuneItems: tunePickerItems)
                        // TODO: Padding 세부 간격 조절 필요
                        .padding(.bottom, 42)
                        .onChange(of: genderIndex, perform: { _ in
                            isChanged = true
                            print("changed")
                        })
                        .onChange(of: tunePickerIndex, perform: { _ in
                            isChanged = true
                            print("changed")
                        })
                
                    HStack {
                        ContentsTitleView(titleName: "싱잉리스트")
                        Spacer()
                        EditButtonView(buttonName: "추가하기", buttonWidth: 80){
                            isPresented.toggle()
                        }
                            .padding(EdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 34))
                            .onChange(of: song.singingListArray, perform: { _ in
                                isChanged = true
                                print("changed")
                            })
                    }
                    
                    ForEach(song.singingListArray) {
                        singingListTag(title: $0.title ?? "제목 없음")
                    }
                    
                    Button(action: {
                        print("노래 삭제하기")
                    }, label: {
                        ConfirmButtonView(buttonName: "노래 삭제하기", buttonColor: Color.grayScale7, textColor: .red)
                    })
                    .padding(.top, 30)
                    .onChange(of: song.singingListArray, perform: { _ in
                        isChanged = true
                        print("changed")
                    })
                }
                
                // MARK: - 상단 네비게이션 바 삭제 버튼
                
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button{
                            print("기록 저장하기")
                        } label: {
                            EditButtonView(buttonName: "저장", buttonWidth: 50){}
                                .padding(.trailing, 20)
                                .opacity(0.2)
                        }
                    }
                }
                .padding(.bottom, 100)
            }
        }
        .sheet(isPresented: $isPresented) {
            SingingListSheetView(refresh: $refresh, isPresent: $isPresented, song: song)
        }
    }
    
    @ViewBuilder
    func singingListTag(title: String) -> some View {
        HStack {
            Button {
                print("싱잉리스트 태그 삭제하기")
            } label: {
                Image(systemName: "minus.circle.fill")
                    .foregroundColor(.grayScale4)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 10))
            }
            HStack {
                Text(title)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.white)
            }
            Spacer()
        }
        .padding(.top, 20)
    }
}

//struct SongDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        SongDetailView().preferredColorScheme(.dark)
//    }
//}
