//
//  CustomTextFieldView.swift
//  SingSangSong
//
//  Created by Kyubo Shim on 2022/07/17.
//

import SwiftUI

/// 커스텀 된 텍스트 필드
/// - 입력 전 일때 __옅은 회색__, 입력 중 일때 __보라색__, 입력 완료 시 __짙은 회색__ 으로 변화합니다.
struct TextFieldView: View {
    @Binding var text: String
    var placeholder: String
    @State var isEditing = false
    
    init(text: Binding<String>, placeholder: String){
        self._text = text
        self.placeholder = placeholder
    }
    
    var body: some View {
       
        HStack {
            TextField("", text: $text, onEditingChanged: { changed in
                self.isEditing = changed
            })
            .placeholder(when: text.isEmpty) {
                Text("\(placeholder)")
                    .foregroundColor(Color.grayscale2)
                    .font(.system(size: 20, weight: .semibold))
                    .fontWeight(.semibold)
            }
            .foregroundColor(.white)
        }
        .underlineTextField(isEditing: isEditing, isFull: !text.isEmpty)
    }
}
