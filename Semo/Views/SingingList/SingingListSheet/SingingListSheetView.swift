//
//  SingingListSheetView.swift
//  Semo
//
//  Created by Terry Koo on 2022/08/09.
//

import SwiftUI
// TODO: 커스텀 sheet로 바꿔줘야 함
struct SingingListSheetView: View {
    @State var newSingingListTitle: String = ""
    @State private var singingListToggle: [Bool] = Array(repeating: false, count: 20)
    var body: some View {
        ZStack {
            Color.grayScale5.ignoresSafeArea()
            VStack{
                // TODO: newSingingListTitle지워지면 포커싱 풀리게
                TextFieldView(text: $newSingingListTitle, placeholder: "새로운 리스트를 바로 추가해보세요.")
                    .padding(.horizontal, 20)
                ScrollView{
                    SingingListToggleView(toggleArray: $singingListToggle, newSingingListTitle: $newSingingListTitle)
                }
                Button(action: {
                    print("button")
                }, label: {
                    FinalConfirmButtonView(buttonName: newSingingListTitle.isEmpty ? "확인" : "리스트 추가하기")
                })
            }
            .padding(EdgeInsets(top: 40, leading: 0, bottom: 37, trailing: 0))
        }
    }
}

struct SingingListSheetView_Previews: PreviewProvider {
    static var previews: some View {
        SingingListSheetView()
    }
}
