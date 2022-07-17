//
//  SingingListView.swift
//  Semo
//
//  Created by 유정인 on 2022/07/16.
//

import SwiftUI

struct SingingListView: View {
    // MARK: - BODY
    var body: some View {
        VStack {
            HStack {
                // TODO: - 리스트 개수 나타내도록 코드 수정하기
                Text("리스트 3개")
                    .font(.subheadline)
                    .foregroundColor(.grayScale2)
                    .fontWeight(.medium)
                Spacer()
                EditButtonView(buttonName: "리스트 편집", buttonWidth: 93)
            }
            .padding(EdgeInsets(top: 15, leading: 20, bottom: 15, trailing: 30))
            
            // MARK: - 싱잉리스트 생성 및 스크롤 추가
            ScrollView {
                Divider()
                    .background(Color.grayScale6)
                    .frame(width: 350)
                ForEach(0..<15) { _ in
                    SingingListCellView()                    
                    Divider()
                        .background(Color.grayScale6)
                        .frame(width: 350)
                }
                .padding(.top, 10)
            }
            Spacer()
        }
        .padding(.top, 80)
    }
}
