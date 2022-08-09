//
//  SingingListDetailCellView.swift
//  Semo
//
//  Created by 유정인 on 2022/07/17.
//

import SwiftUI

struct SingingListDetailCellView: View {
    // MARK: - BODY
    var body: some View {
        VStack {
            // MARK: - 전체 노래 리스트 상단 바
            HStack {
                // TODO: - 데이터 크기로 값 받아오기
                Text("노래 목록 (20)")
                    .font(.subheadline)
                    .foregroundColor(.grayScale2)
                    .fontWeight(.medium)
                
                Spacer()
            }
            .padding(EdgeInsets(top: 15, leading: 20, bottom: 15, trailing: 0))
            // MARK: - 노래 리스트 생성 및 스크롤 추가
            ScrollView {
                Divider()
                    .background(Color.grayScale6)
                    .frame(width: 350)                
                ForEach(0..<20) { _ in
                    // TODO: coreData에서 가져온 데이터 넣어주기
//                    SongListCellView()
                    Divider()
                        .background(Color.grayScale6)
                        .frame(width: 350)
                }
                .padding(.top, 10)
                AddSongButtonView()
                Spacer()
            }
        }
        .padding(.top, 110)
    }
}

struct SingingListDetailCellView_Previews: PreviewProvider {
    static var previews: some View {
        SingingListDetailCellView()
    }
}
