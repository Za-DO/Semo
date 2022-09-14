//
//   FinalConfirmButtonView.swift
//  Semo
//
//  Created by Terry Koo on 2022/08/09.
//

import SwiftUI

struct FinalConfirmButtonView: View {
    var buttonName: String
    var buttonColor: Color
    var textColor: Color
    init(buttonName: String, buttonColor: Color, textColor: Color) {
        self.buttonName = buttonName
        self.buttonColor = buttonColor
        self.textColor = textColor
    }
    var body: some View {
        Text(buttonName)
            .font(.system(size: 16, weight: .semibold))
            .foregroundColor(textColor)
            .padding()
            .frame(width: UIScreen.main.bounds.size.width, height: 48)
            .background(buttonColor)
    }
}

struct FinalConfirmButtonView_Previews: PreviewProvider {
    static var previews: some View {
        FinalConfirmButtonView(buttonName: "확인", buttonColor: Color.mainPurpleColor, textColor: .white)
    }
}
