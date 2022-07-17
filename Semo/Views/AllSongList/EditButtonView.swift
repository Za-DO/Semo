//
//  EditButtonView.swift
//  Semo
//
//  Created by 유정인 on 2022/07/16.
//

import SwiftUI

struct EditButtonView: View {
    @State var buttonName: String
    @State var buttonWidth: CGFloat
    
    var body: some View {
        Button {
            print("\(buttonName) 가능")
        } label: {
            Text(buttonName)
                .font(.system(size: 15, weight: .medium))
                .foregroundColor(.white)
                // overlay 2개 겹치는 것 이외에 좋은 방법이 없을까
                .overlay(
                    // RoundedRectangle에 stroke를 추가하고 싶다면 맨 위에 넣기
                    RoundedRectangle(cornerRadius: UIScreen.main.bounds.height)
                        .stroke(Color.white, lineWidth: 1)
                        .frame(width: buttonWidth, height: 32)
                        .opacity(0.2)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: UIScreen.main.bounds.height)
                        .frame(width: buttonWidth, height: 32)
                        .foregroundColor(.white)
                        .opacity(0.1)
                )
        }
//        .buttonStyle(.bordered)
//        .buttonBorderShape(.capsule)
    }
}
