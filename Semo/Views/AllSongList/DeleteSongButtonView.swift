//
//  DeleteSongButtonView.swift
//  Semo
//
//  Created by 유정인 on 2022/09/14.
//

import SwiftUI

struct DeleteSongButtonView: View {
    @State var showDeleteAlert: Bool = false
    @State var songList: [Song] = CoreDataManager.shared.fetchSongList() ?? []
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
                CoreDataManager.shared.deleteSong(song: song)
                songEditButtonTap = false
            }
        }
    }
}
