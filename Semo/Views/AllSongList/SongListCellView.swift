//
//  SongListCellView.swift
//  Semo
//
//  Created by 유정인 on 2022/07/16.
//

import SwiftUI

struct SongListCellView: View {
    // MARK: - BODY
    var body: some View {
        // TODO: - 리스트 각 셀 데이터 반환 액션 추가
        Button {

        } label: {
            HStack {
                // MARK: - 노래 정보 표시
                VStack(alignment: .leading, spacing: 10) {
                    Text("노래 제목")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.grayScale1)
                    Text("가수 이름")
                        .font(.system(size: 15, weight: .medium))
                        .foregroundColor(.grayScale2)
                }
                Spacer()
                // MARK: - Tune 정보 표시
                Capsule()
                    .frame(width: 62, height: 32)
                    .foregroundColor(.grayScale7)
                    .overlay(
                        Text("\(Text("여").foregroundColor(.womanColor)) +3")
                            .foregroundColor(.grayScale1)
                    )
            }
            .padding(.horizontal, 20)
        }
    }
}
