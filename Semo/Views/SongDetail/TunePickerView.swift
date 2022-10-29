//
//  TuneView.swift
//  Semo
//
//  Created by 조은비 on 2022/07/17.
//

import SwiftUI
import SwiftUIWheelPicker

/// 노래 키를 선택해주는 Picker 입니다.
/// - genderIndexBase: 처음 표기되는 성별의 초기 값으로 **State String 변수**를 받습니다.
/// - genderItems: 성별 Picker에 표시되는 모든 값들로 **String 배열**을 받습니다.
/// - tuneIndexBase: 처음 표기되는 키 조절값의 초기 값으로 **State Int 변수**를 받습니다.
/// - tunerItems: 키 조절값 Picker에 표시되는 모든 값들로 **String 배열**을 받습니다.
struct TunePickerView: View {
    @Binding var genderIndexBase: String
    var genderItems: [String]
    
    @Binding var tuneIndexBase: Int
    var tuneItems: [String]

    init(genderIndexBase: Binding<String>, genderItems: [String], tuneIndexBase: Binding<Int>, tuneItems: [String]){
        self._genderIndexBase = genderIndexBase
        self.genderItems = genderItems
        self._tuneIndexBase = tuneIndexBase
        self.tuneItems = tuneItems
    }
    
    var body: some View {
        VStack {
            
            // MARK: - 남/여/혼성 세그먼트
            
            HStack {
                ContentsTitleView(titleName: "키")
                Spacer()
            }
            Picker("pick gender", selection: $genderIndexBase) {
                ForEach(genderItems, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(EdgeInsets(top: UIScreen.getHeight(24), leading: UIScreen.getWidth(24), bottom: UIScreen.getHeight(48), trailing: UIScreen.getWidth(24)))
            
            // MARK: - 키 조절값 설정 Picker
            
            ZStack {
                Circle()
                    .foregroundColor(.mainPurpleColor)
                    .opacity(0.5)
                    .frame(width: UIScreen.getWidth(64), height: UIScreen.getHeight(64), alignment: .center)
                    .shadow(color: .mainPurpleColor, radius: UIScreen.getWidth(10), x: 0, y: 0)
                SwiftUIWheelPicker($tuneIndexBase, items: tuneItems) { value in
                    GeometryReader { reader in
                        Text("\(value)")
                            .frame(width: reader.size.width, height: reader.size.height,
                                   alignment: .center)
                            .font(.system(size: 24 * Font.setSize(), weight: .semibold))
                    }
                }
                .scrollAlpha(0.1)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.getHeight(30), alignment: .center)
                .padding(.horizontal, -UIScreen.getHeight(20))
            }
        }
    }
}

//struct TunePickerView_Previews: PreviewProvider {
//    static var previews: some View {
//        TunePickerView().preferredColorScheme(.dark)
//    }
//}
