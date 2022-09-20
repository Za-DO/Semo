//
//  DeleteSongButtonView.swift
//  Semo
//
//  Created by 유정인 on 2022/09/14.
//

import SwiftUI

struct DeleteSongButtonView: View {
    @State var showDeleteAlert: Bool = false
    @Binding var songEditButtonTap: Bool
    
    var song: Song
    
    var body: some View {
        Button {
            self.showDeleteAlert = true
            print("노래 삭제")
        } label: {
            Image(systemName: "minus.circle.fill")
                .foregroundColor(.grayScale3)
        }
        .alert("이 노래를 삭제하시겠습니까?", isPresented: $showDeleteAlert) {
            Button("취소", role: .cancel) {}
            Button("삭제", role: .destructive) {
                // TODO: - 노래 데이터 삭제 코드
                CoreDataManager.shared.deleteSong(song: song)
                songEditButtonTap = false
            }
        }
    }
}

//struct DeleteSongButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        DeleteSongButtonView()
//    }
//}
