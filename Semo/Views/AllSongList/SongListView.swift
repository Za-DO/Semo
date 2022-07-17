//
//  SongListView.swift
//  Semo
//
//  Created by 유정인 on 2022/07/16.
//

import SwiftUI

struct SongListView: View {    
    var body: some View {
        // Custom List
        VStack {
            // 목록 편집바
            HStack {
                // 데이터 크기로 값 받아오기
                Text("총 5곡")
                    .font(.subheadline)
                    .foregroundColor(.grayscale2)
                    .fontWeight(.medium)
                Spacer()
                EditButtonView(buttonName: "목록 편집", buttonWidth: 80)
            }
            .padding(EdgeInsets(top: 15, leading: 20, bottom: 15, trailing: 30))
            // stroke 안에 있는 text 기준으로 맞춰져서
            // trailing을 추가하지 않으면 목록 편집 버튼이 오른쪽으로 쏠림
            ScrollView {
                Divider()
                    .background(Color.grayscale6)
                    .frame(width: 350)
                // ForEach문에 data 받아와야됨
                ForEach(0..<10) { _ in
                    SongListCellView()
                    Divider()
                        .background(Color.grayscale6)
                        .frame(width: 350)
                }
                .padding(.top, 10)
                Spacer()
            }
        }
        .padding(.top, 80)
    }
}

struct SongListView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environment(\.colorScheme, .dark)
    }
}
