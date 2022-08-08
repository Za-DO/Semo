//
//  SingingListSheetView.swift
//  Semo
//
//  Created by Terry Koo on 2022/08/09.
//

import SwiftUI
// TODO: 커스텀 sheet로 바꿔줘야 함
struct SingingListSheetView: View {
    @State var newLSingingListTitle: String = ""
    var body: some View {
        ZStack {
            Color.grayScale5.ignoresSafeArea()
            VStack{
                TextFieldView(text: $newLSingingListTitle, placeholder: "새로운 리스트를 바로 추가해보세요.")
                    .padding(.horizontal, 20)
                ScrollView{
                    SingingListToggleView()
                }
                Button(action: {
                    print("button")
                }, label: {
                    FinalConfirmButtonView(buttonName: "확인")
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
