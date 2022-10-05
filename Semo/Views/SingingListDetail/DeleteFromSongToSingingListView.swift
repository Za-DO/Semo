//
//  DeleteFromSongToSingingListView.swift
//  Semo
//
//  Created by 유정인 on 2022/10/05.
//

import SwiftUI

struct DeleteFromSongToSingingListView: View {
//    @State var showDeleteAlert: Bool = false
    @State var songList: [Song] = CoreDataManager.shared.fetchSongList() ?? []
    @Binding var songEditButtonTapped: Bool
    
    var song: Song
    var singingList: SingingList
    
    var body: some View {
        Button {
            song.removeFromSongToSingingList(singingList)
            self.songEditButtonTapped = false
//            self.showDeleteAlert = true
            print("노래 리스트에서 삭제")
        } label: {
            Image(systemName: "minus.circle.fill")
                .foregroundColor(.grayScale3)
        }
//        .alert("이 노래를 리스트에서 삭제하시겠습니까?", isPresented: $showDeleteAlert) {
//            Button("취소", role: .cancel) {}
//            Button("삭제", role: .destructive) {
//                song.removeFromSongToSingingList(singingList)
//                self.songEditButtonTapped = false
//            }
//        }
    }
}
