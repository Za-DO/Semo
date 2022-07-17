//
//  SongListCellView.swift
//  Semo
//
//  Created by 유정인 on 2022/07/16.
//

import SwiftUI

struct SongListCellView: View {
    var body: some View {
        // 노래 제목, 가수 이름, 키 정보는 따로 받아서 넘겨줘야할듯        
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("노래 제목")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.white)
                Text("가수 이름")
                    .font(.system(size: 15, weight: .medium))
                    .foregroundColor(.grayscale2)
            }
            
            Spacer()
            
            Capsule()
                .frame(width: 62, height: 32)
                .foregroundColor(.grayscale7)
                .overlay(
                    Text("\(Text("여").foregroundColor(.womancolor)) +3")
                        .foregroundColor(.white)
                )
        }
        .padding(.horizontal, 20)
    }
}

struct SongListCellView_Previews: PreviewProvider {
    static var previews: some View {
        SongListCellView()
    }
}
