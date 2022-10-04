//
//  AddMoreInfoView.swift
//  Semo
//
//  Created by 조은비 on 2022/07/19.
//

import SwiftUI

struct AddMoreInfoView: View {
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Song.timestamp, ascending: true)], animation: .default) private var song: FetchedResults<Song>
    
    @State var levelPickerIndex: Int = 1
    var levelPickerItems: [String] = ["하", "중", "상"]
    
    var genderItems = ["여키", "남키", "혼성"]
    @State var genderIndex = "남키"
    
    @State var tunePickerIndex: Int = 6
    @State var tunePickerItems: [String] = ["-6", "-5", "-4", "-3", "-2", "-1",
                                            "+0", "+1", "+2", "+3", "+4", "+5", "+6"]
    
    @State var songList: [Song] = CoreDataManager.shared.fetchSongList() ?? []
    @Binding var isPopToRoot: Bool
    
    var songTitle: String
    var songSinger: String
    
    var body: some View {
        ZStack {
            Color.backgroundBlack.ignoresSafeArea()
            LinearGradient(gradient: Gradient(colors: [Color.grayScale6, Color.backgroundBlack]), startPoint: .top, endPoint: UnitPoint(x: 0.5, y: 0.3))
            .edgesIgnoringSafeArea(.all)
            
            // MARK: - 추가 정보 입력란
            
            VStack(alignment: .center) {
                Text("노래방에서 필요한 정보를 \n입력하세요.")
                    .lineSpacing(10)
                    .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                    .foregroundColor(.white)
                    .font(.system(size: 24, weight: .semibold))
                    .padding(EdgeInsets(top: 14, leading: 20, bottom: 0, trailing: 0))
                
                LevelPickerView(levelIndexBase: $levelPickerIndex, levelItems: levelPickerItems)
                    .padding(.top, 60)
                
                TunePickerView(genderIndexBase: $genderIndex, genderItems: genderItems, tuneIndexBase: $tunePickerIndex, tuneItems: tunePickerItems)
                
                Spacer()
                
                // MARK: - 확인버튼
                
                NavigationLink(destination: AddSingingListTagView(isPopToRoot: $isPopToRoot, songTitle: songTitle, songSinger: songSinger, gender: genderIndex, level: levelPickerItems[levelPickerIndex], tune: tunePickerItems[tunePickerIndex])) {
                    ConfirmButtonView(buttonName: "확인", buttonColor: Color.mainPurpleColor, textColor: .white)
                }
                .isDetailLink(false)
                .navigationTitle("")
                
                // MARK: - 건너뛰기 버튼
                
                Button(action: {
                    // 루트로 회귀
                    self.isPopToRoot = false
                    
                    // 노래 추가
                    CoreDataManager.shared.saveNewSong(songTitle: songTitle, songSinger: songSinger)
                }, label: {
                    Text("건너뛰기")
                        .foregroundColor(.grayScale1)
                        .font(.system(size: 16, weight: .semibold))
                        .padding(EdgeInsets(top: 28, leading: 0, bottom: 60, trailing: 0))
                })
            }
        }
        .navigationBarTitle("", displayMode: .inline)
    }
}
