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
    
    var genderItems = ["여성", "혼성", "남성"]
    @State var genderIndex = "혼성"
    
    @State var tunePickerIndex:Int = 6
    @State var tunePickerItems: [String] = ["-6", "-5", "-4", "-3", "-2", "-1",
                                            "0", "1", "2", "3", "4", "5", "6"]
    
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
                
                // TODO: - 데이터 저장하고 다음 단계로 넘어가기
                NavigationLink(destination: AddSingingListTagView(songTitle: songTitle, songSinger: songSinger)) {
                    ConfirmButtonView(buttonName: "확인")
                }
                .navigationTitle("")
                Button(action: {
                    // 네비게이션 빠져 나오게
                    NavigationUtil.popToRootView()
                    // 노래 추가 로직
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

//struct AddMoreInfoView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddMoreInfoView().preferredColorScheme(.dark)
//    }
//}
