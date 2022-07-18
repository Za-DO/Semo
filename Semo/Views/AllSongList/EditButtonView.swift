//
//  EditButtonView.swift
//  Semo
//
//  Created by 유정인 on 2022/07/16.
//

import SwiftUI

struct EditButtonView: View {
    var buttonName: String
    var buttonWidth: CGFloat
    
    // MARK: - BODY
    var body: some View {
        // MARK: - 목록, 리스트 편집 버튼
        Button {
            print("\(buttonName) 가능")
        } label: {
            Text(buttonName)
                .font(.system(size: 15, weight: .medium))
                .foregroundColor(.grayScale1)
                // TODO: - overlay를 2번 사용하지 않고 구현
                .overlay(
                    // RoundedRectangle에 stroke를 추가할 땐 맨 위에 넣기
                    RoundedRectangle(cornerRadius: UIScreen.main.bounds.height)
                        .stroke(Color.grayScale1, lineWidth: 1)
                        .frame(width: buttonWidth, height: 32)
                        .opacity(0.2)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: UIScreen.main.bounds.height)
                        .frame(width: buttonWidth, height: 32)
                        .foregroundColor(.grayScale1)
                        .opacity(0.1)
                )
        }
    }
}
