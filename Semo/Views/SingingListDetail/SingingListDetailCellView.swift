//
//  SingingListDetailCellView.swift
//  Semo
//
//  Created by 유정인 on 2022/07/17.
//

import SwiftUI

struct SingingListDetailCellView: View {
    @Binding var refreshView: Bool
    @Binding var songEditButtonTap: Bool
    
    var singingList: SingingList
    
    // MARK: - BODY
    var body: some View {
        VStack {
            // MARK: - 전체 노래 리스트 상단 바
            HStack {
                // TODO: - 데이터 크기로 값 받아오기
                Text("노래 목록 (\(singingList.count))")
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
                ForEach(singingList.songArray) {
                    SongListCellView(songEditButtonTap: $songEditButtonTap, refreshView: $refreshView, song: $0)
                    Divider()
                        .background(Color.grayScale6)
                        .frame(width: 350)
                }
                .padding(.top, 10)
                // TODO: - 이후 업데이트에서 새 노래 추가가 아닌 기존 노래 추가로 기능 변경
//                AddSongButtonView()
                Spacer()

            }
        }
        .padding(.top, 110)
    }
}
