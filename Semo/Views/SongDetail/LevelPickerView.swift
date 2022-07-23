//
//  LevelView.swift
//  Semo
//
//  Created by 조은비 on 2022/07/17.
//

import SwiftUI
import SwiftUIWheelPicker

struct LevelPickerView: View {
    @State var indexBasic: Int = 1
    @State var items: [String] = ["상", "중", "하"]
    var body: some View {
        VStack {
            HStack {
                ContentsTitleView(titleName: "숙련도")
                Spacer()
            }
            
            // TODO: - pickerView 가져오기
            // pickerView가 들어갈 부분

            SwiftUIWheelPicker($indexBasic, items: $items) { value in
                GeometryReader { reader in
                    Text("\(value)")
                        .frame(width: reader.size.width, height: reader.size.height,
                               alignment: .center)
                        .font(.system(size: 50))
                }
            }
            .scrollAlpha(0.2)
            .frame(width: UIScreen.main.bounds.width, height: 70, alignment: .center)
            .padding(.horizontal, -20)
            
            
            Spacer()
                .frame(height: 102)
        }
    }
}

struct LevelPickerView_Previews: PreviewProvider {
    static var previews: some View {
        LevelPickerView().preferredColorScheme(.dark)
    }
}
