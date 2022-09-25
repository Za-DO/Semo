//
//  SingingListDetailView.swift
//  Semo
//
//  Created by 유정인 on 2022/07/17.
//

import SwiftUI

struct SingingListDetailView: View {
    @State var isPopToRoot: Bool = false
    @Binding var editButtonTap: Bool
    var singingList: SingingList

    // MARK: - BODY
    var body: some View {
        ZStack {
            Image("backgroundImage")
                .edgesIgnoringSafeArea(.vertical)
            VStack {
                Rectangle()
                    .edgesIgnoringSafeArea(.all)
                    .frame(height: UIScreen.main.bounds.height * 0.12)
                    .foregroundColor(.grayScale6)
                    .opacity(0.4)
                Spacer()
            }
            SingingListDetailCellView(isPopToRoot: $isPopToRoot, editButtonTap: $editButtonTap, singingList: singingList)
        }
        // TODO: - navigationtitle 폰트 크기, 굵기 수정(커스텀으로만 가능)
        .navigationBarTitle(singingList.title ?? "제목 없음")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                EditButtonView(buttonName: "편집", buttonWidth: 50){}
                    .padding(.trailing, 20)
            }
        }
    }
}

//struct SingingListDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        SingingListDetailView()
//    }
//}
