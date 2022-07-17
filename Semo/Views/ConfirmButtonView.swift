//
//  ConfirmButtonView.swift
//  SingSangSong
//
//  Created by Kyubo Shim on 2022/07/17.
//

import SwiftUI

/// 확인 및 완료 버튼을 위한 라벨 서브뷰 입니다.
/// - String 형식의 라벨 이름만 생성자로 넣어서 쓰시면 됩니다.
struct ConfirmButtonView: View {
    var buttonName: String
    init(buttonName: String) {
        self.buttonName = buttonName
    }
    var body: some View {
        Text(buttonName)
            .font(.system(size: 16, weight: .semibold))
            .foregroundColor(.white)
            .padding()
            .frame(width: 350, height: 48)
            .background(Color.mainpurplecolor)
            .cornerRadius(16)
    }
}

struct ConfirmButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmButtonView(buttonName: "확인")
    }
}
