//
//  SingingListCellView.swift
//  Semo
//
//  Created by 유정인 on 2022/07/16.
//

import SwiftUI

struct SingingListCellView: View {
    @Binding var refresh: Int
    @Binding var songEditButtonTap: Bool
    @Binding var listEditButtonTap: Bool
    
    var singingList: SingingList
    
    // MARK: - BODY
    var body: some View {
        Button {
        } label: {
            HStack {
                if listEditButtonTap == true {
                    DeleteSingingListButtonView(listEditButtonTap: $listEditButtonTap, singingList: singingList)
                        .padding(.trailing, 8)
                        .transition(.move(edge: .leading))
                    // TODO: - animation(_:value:)로 변경
//                        .animation(.easeInOut)
                        .animation(.easeInOut, value: listEditButtonTap)
                }
                NavigationLink(destination: SingingListDetailView(songEditButtonTap: $songEditButtonTap, singingList: singingList)) {
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
                    .animation(.easeInOut, value: listEditButtonTap)
                    Spacer()
                    // MARK: - Tune 정보 표시
                    Image(systemName: "chevron.right")
                        .scaledToFit()
                        .foregroundColor(.grayScale1)
                }
                .disabled(listEditButtonTap)
            }
            .padding(.horizontal, 20)
        }
    }
}

//struct SingingListCellView_Preview: PreviewProvider {
//    static var previews: some View {
//        SingingListCellView()
//    }
//}
