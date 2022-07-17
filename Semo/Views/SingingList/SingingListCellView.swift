//
//  SingingListCellView.swift
//  Semo
//
//  Created by 유정인 on 2022/07/16.
//

import SwiftUI

struct SingingListCellView: View {
    // MARK: - BODY
    var body: some View {
        // TODO: - 리스트 각 셀 데이터 반환 액션 추가
        Button {
            
        } label: {
            HStack {
                // MARK: - 노래 정보 표시
                VStack(alignment: .leading, spacing: 10) {
                    Text("빠른 싱잉리스트")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.grayScale1)
                    Text("총 7곡")
                        .font(.system(size: 15, weight: .medium))
                        .foregroundColor(.grayScale2)
                }
                Spacer()
                // MARK: - Tune 정보 표시
                Image(systemName: "chevron.right")
                    .scaledToFit()
                    .foregroundColor(.grayScale1)
            }
            .padding(.horizontal, 20)
        }

    }
}
