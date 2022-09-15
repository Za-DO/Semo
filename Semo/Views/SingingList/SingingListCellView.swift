//
//  SingingListCellView.swift
//  Semo
//
//  Created by 유정인 on 2022/07/16.
//

import SwiftUI

struct SingingListCellView: View {
    @Binding var refresh: Int
    @Binding var editButtonTap: Bool
    var singingList: SingingList
    // MARK: - BODY
    var body: some View {
        // TODO: - 리스트 각 셀 데이터 반환 액션 추가
        Button {            
        } label: {
            // TODO: - destination 수정하기
            NavigationLink(destination: SingingListDetailView(editButtonTap: $editButtonTap, singingList: singingList)) {
                HStack {
                    // MARK: - 노래 정보 표시
                    VStack(alignment: .leading, spacing: 10) {
                        Text(singingList.title ?? "제목없음")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.grayScale1)
                        Text("총 \(singingList.count)곡")
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
}

//struct SingingListCellView_Preview: PreviewProvider {
//    static var previews: some View {
//        SingingListCellView()
//    }
//}
