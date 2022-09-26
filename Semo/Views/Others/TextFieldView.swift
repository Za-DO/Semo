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
                text = text.trimmingCharacters(in: .whitespacesAndNewlines)
            })
            .placeholder(when: text.isEmpty) {
                Text("\(placeholder)")
                    .foregroundColor(Color.grayScale2)
                    .font(.system(size: 20, weight: .semibold))
                    .fontWeight(.semibold)
            }
            .foregroundColor(.white)
        }
        .underlineTextField(isEditing: isEditing, isFull: !text.isEmpty)
    }
}

/// 미리보기 테스트용 텍스트 필드 코드입니다.
struct SingListTitleTextFieldView: View {
    @State var singingListTitle = ""
    @State var isSingingListTitleEditing = false
    var body: some View {
        HStack {
            TextField("", text: $singingListTitle, onEditingChanged: { changed in
                self.isSingingListTitleEditing = changed
            })
            .placeholder(when: singingListTitle.isEmpty) {
                Text("새로운 리스트를 바로 추가해보세요.").foregroundColor(Color.grayScale2)
            }
            .foregroundColor(.white)
        }
        .underlineTextField(isEditing: isSingingListTitleEditing, isFull: !singingListTitle.isEmpty)
    }
}

struct CustomTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        SingListTitleTextFieldView()
    }
}
