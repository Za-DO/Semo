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
                Text("싱잉리스트")
                    .font(.system(size: 15, weight: .medium))
                    .foregroundColor(.grayScale2)
                    .padding([.top, .leading], 20)
                Spacer()
                EditButtonView(buttonName: "추가하기", buttonWidth: 80)
                    .padding(.top, 16)
                    .padding(.trailing, 34)
            }
            // TODO: - 싱잉리스트 데이터 받아오기
            ForEach(0..<10) { _ in
                HStack {
                    Button {
                        print("싱잉리스트 태그 삭제하기")
                    } label: {
                        Image(systemName: "minus.circle.fill")
                            .foregroundColor(.grayScale4)
                            .padding(.trailing, 10)
                            .padding(.leading, 20)
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
