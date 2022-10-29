//
//  LevelView.swift
//  Semo
//
//  Created by 조은비 on 2022/07/17.
//

import SwiftUI
import SwiftUIWheelPicker

/// 노래 숙련도를 선택해주는 WheelPicker 입니다.
/// - levelIndexBase: 제일 처음 표기되는 초기 값으로 **State 변수**를 받습니다.
/// - levelItems: Picker에 표시되는 모든 값들로 **String 배열**을 받습니다.
struct LevelPickerView: View {
    @Binding var levelIndexBase: Int
    var levelItems: [String]
    
    init(levelIndexBase: Binding<Int>, levelItems: [String]){
        self._levelIndexBase = levelIndexBase
        self.levelItems = levelItems
    }
    
    var body: some View {
        VStack {
            HStack {
                ContentsTitleView(titleName: "숙련도")
                Spacer()
            }
            
            ZStack {
                Circle()
                    .foregroundColor(.mainPurpleColor)
                    .opacity(0.5)
                    .frame(width: 64, height: 64, alignment: .center)
                    .shadow(color: .mainPurpleColor, radius: 10, x: 0, y: 0)
                SwiftUIWheelPicker($levelIndexBase, items: levelItems) { value in
                    GeometryReader { reader in
                        Text("\(value)")
                            .frame(width: reader.size.width, height: reader.size.height,
                                   alignment: .center)
                            .font(.system(size: 24 * Font.setSize(), weight: .semibold))
                    }
                }
                .scrollAlpha(0.1)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.getHeight(30), alignment: .center)
            }
        }
    }
}

