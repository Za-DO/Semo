//
//  SongInfoView.swift
//  Semo
//
//  Created by 조은비 on 2022/07/17.
//

import SwiftUI

struct SongInfoView: View {
    var song: Song
    
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 70)
            Text(song.title ?? "제목 없음")
                .font(.system(size: 24, weight: .semibold))
                .foregroundColor(.white)
            Text(song.singer ?? "가수 없음")
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(.grayScale2)
                .padding(EdgeInsets(top: 2, leading: 0, bottom: 0, trailing: 0))
        }
        .multilineTextAlignment(.center)
    }
}

//struct SongInfoView_Previews: PreviewProvider {
//    static var previews: some View {
//        SongInfoView().preferredColorScheme(.dark)
//    }
//}
