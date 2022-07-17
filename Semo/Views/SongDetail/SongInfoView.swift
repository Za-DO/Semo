//
//  SongInfoView.swift
//  Semo
//
//  Created by 조은비 on 2022/07/17.
//

import SwiftUI

struct SongInfoView: View {
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 70)
            Text("노래 제목입니다")
                .font(.system(size: 24, weight: .semibold))
                .foregroundColor(.white)
            Text("노래 가수입니다")
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(.grayScale2)
                .padding(.top, 2)
                .padding(.bottom, 20)
        }
    }
}

struct SongInfoView_Previews: PreviewProvider {
    static var previews: some View {
        SongInfoView().preferredColorScheme(.dark)
    }
}
