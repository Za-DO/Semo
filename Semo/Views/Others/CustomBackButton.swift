//
//  CustomBackButton.swift
//  Semo
//
//  Created by 조은비 on 2022/09/19.
//

import SwiftUI

struct CustomBackButton: View {
    var buttonName: String
    var buttonAction: () -> Void
    
    init(buttonName: String, buttonAction: @escaping () -> Void) {
        self.buttonName = buttonName
        self.buttonAction = buttonAction
    }
    
    var body: some View {
        Button(action: {
            buttonAction()
        }, label: {
            HStack {
                Image(systemName: "chevron.backward")
                    .foregroundColor(.mainPurpleColor)
                    .font(.system(size: 18, weight: .semibold))
                Text("\(buttonName)")
                    .foregroundColor(.white)
            }
        })
    }
}
