//
//  SingingListCellView.swift
//  Semo
//
//  Created by 유정인 on 2022/07/16.
//

import SwiftUI

struct SingingListCellView: View {
    @Binding var refreshView: Bool
    @Binding var songEditButtonTapped: Bool
    @Binding var listEditButtonTapped: Bool
    
    var singingList: SingingList
    
    // MARK: - BODY
    var body: some View {
        Button {
        } label: {
            HStack {
                if listEditButtonTapped == true {
                    DeleteSingingListButtonView(listEditButtonTapped: $listEditButtonTapped, singingList: singingList)
                        .padding(.trailing, 8)
                        .transition(.move(edge: .leading))
                    // TODO: - animation(_:value:)로 변경
                        .animation(.easeInOut)
                }
                NavigationLink(destination: SingingListDetailView(refreshView: $refreshView, listEditButtonTapped: $listEditButtonTapped, songEditButtonTapped: $songEditButtonTapped, singingList: singingList, singingListTitle: singingList.title ?? "제목없음")) {
                    // MARK: - 노래 정보 표시
                    VStack(alignment: .leading, spacing: 10) {
                        Text(singingList.title ?? "제목없음")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.grayScale1)
                        Text("총 \(singingList.count)곡")
                            .font(.system(size: 15, weight: .medium))
                            .foregroundColor(.grayScale2)
                    }
                    .transition(.slide)
                    .animation(.easeInOut)
                    Spacer()
                    // MARK: - Tune 정보 표시
                    Image(systemName: "chevron.right")
                        .scaledToFit()
                        .foregroundColor(.grayScale1)
                }
                .disabled(listEditButtonTapped)
            }
            .padding(.horizontal, 20)
        }
    }
}
