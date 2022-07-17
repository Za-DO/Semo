//
//  SingingListCellView.swift
//  Semo
//
//  Created by 유정인 on 2022/07/16.
//

import SwiftUI

struct SingingListCellView: View {
    var body: some View {
        // 노래 제목, 가수 이름, 키 정보는 따로 받아서 넘겨줘야할듯
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("빠른 싱잉리스트")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.white)
                Text("총 7곡")
                    .font(.system(size: 15, weight: .medium))
                    .foregroundColor(.grayscale2)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .scaledToFit()
                .foregroundColor(.white)
        }
        .padding(.horizontal, 20)
    }
}

struct SingingListCellView_Previews: PreviewProvider {
    static var previews: some View {
        SingingListCellView()
    }
}
