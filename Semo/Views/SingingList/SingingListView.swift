//
//  SingingListView.swift
//  Semo
//
//  Created by 유정인 on 2022/07/16.
//

import SwiftUI

struct SingingListView: View {
    var body: some View {
        ZStack {
            Image("backgroundImage")
                .ignoresSafeArea()
            // Custom List
            VStack {
                // 목록 편집바
                HStack {
                    // 데이터 크기로 값 받아오기
                    Text("리스트 3개")
                        .font(.subheadline)
                        .foregroundColor(.grayscale2)
                        .fontWeight(.medium)
                    Spacer()
                    EditButtonView(buttonName: "리스트 편집", buttonWidth: 93)
                }
                .padding(EdgeInsets(top: 15, leading: 20, bottom: 15, trailing: 30))
                
                Divider()
                    .background(Color.grayscale6)
                    .frame(width: 350)
                // ForEach문에 data 받아와야됨
                ForEach(0..<3) { _ in
                    SingingListCellView()
                    
                    Divider()
                        .background(Color.grayscale6)
                        .frame(width: 350)
                }
                .padding(.top, 10)
                Spacer()
            }
            .padding(.top, 32)
        }
    }
}

struct SingingListView_Previews: PreviewProvider {
    static var previews: some View {
        SingingListView()
            .environment(\.colorScheme, .dark)
    }
}
