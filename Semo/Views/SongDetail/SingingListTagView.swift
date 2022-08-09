//
//  SingingListTagView.swift
//  Semo
//
//  Created by 조은비 on 2022/07/17.
//

import SwiftUI

struct SingingListTagView: View {
    var body: some View {
        VStack {
            HStack {
                ContentsTitleView(titleName: "싱잉리스트")
                Spacer()
                EditButtonView(buttonName: "추가하기", buttonWidth: 80){}
                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 34))
            }
            
            // TODO: - 싱잉리스트 데이터 받아오기
            ForEach(0..<10) { _ in
                HStack {
                    Button {
                        print("싱잉리스트 태그 삭제하기")
                    } label: {
                        Image(systemName: "minus.circle.fill")
                            .foregroundColor(.grayScale4)
                            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 10))
                    }
                    HStack {
                        Text("싱잉리스트")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.white)
                    }
                    Spacer()
                }
                .padding(.top, 20)
            }
        }
    }
}

struct SingingListTagView_Previews: PreviewProvider {
    static var previews: some View {
        SingingListTagView().preferredColorScheme(.dark)
    }
}
