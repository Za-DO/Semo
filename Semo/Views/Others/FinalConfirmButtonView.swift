//
//   FinalConfirmButtonView.swift
//  Semo
//
//  Created by Terry Koo on 2022/08/09.
//

import SwiftUI

struct FinalConfirmButtonView: View {
    var buttonName: String
    init(buttonName: String) {
        self.buttonName = buttonName
    }
    var body: some View {
        Text(buttonName)
            .font(.system(size: 16, weight: .semibold))
            .foregroundColor(.white)
            .padding()
            .frame(width: UIScreen.main.bounds.size.width, height: 48)
            .background(Color.mainPurpleColor)
    }
}

struct FinalConfirmButtonView_Previews: PreviewProvider {
    static var previews: some View {
        FinalConfirmButtonView(buttonName: "확인")
    }
}
