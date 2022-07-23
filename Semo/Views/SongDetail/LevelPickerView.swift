//
//  LevelView.swift
//  Semo
//
//  Created by 조은비 on 2022/07/17.
//

import SwiftUI
import SwiftUIWheelPicker

struct LevelPickerView: View {
    var levels = ["하", "중", "상"]
    @State var level = "중"
    
    var body: some View {
        VStack {
            HStack {
                ContentsTitleView(titleName: "숙련도")
                Spacer()
            }
            
            // TODO: - pickerView 가져오기
            // pickerView가 들어갈 부분

            ZStack {
                Circle()
                    .foregroundColor(.mainPurpleColor)
                    .opacity(0.5)
                    .frame(width: 64, height: 64, alignment: .center)
                    .shadow(color: .mainPurpleColor, radius: 10, x: 0, y: 0)
                SwiftUIWheelPicker($indexBasic, items: $items) { value in
                    GeometryReader { reader in
                        Text("\(value)")
                            .frame(width: reader.size.width, height: reader.size.height,
                                   alignment: .center)
                            .font(.system(size: 24, weight: .semibold))
                    }
                }
                .scrollAlpha(0.1)
                .frame(width: UIScreen.main.bounds.width, height: 30, alignment: .center)
            .padding(.horizontal, -20)
            }
        }
    }
}

struct LevelPickerView_Previews: PreviewProvider {
    static var previews: some View {
        LevelPickerView().preferredColorScheme(.dark)
    }
}
