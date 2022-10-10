//
//  DeleteFromSongToSingingListView.swift
//  Semo
//
//  Created by 유정인 on 2022/10/05.
//

import SwiftUI

struct DeleteFromSongToSingingListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Binding var songEditButtonTapped: Bool
    
    var song: Song
    var singingList: SingingList
    
    var body: some View {
        Button {
            song.removeFromSongToSingingList(singingList)
            do {
                try viewContext.save()
            } catch {
                print(error.localizedDescription)
            }
            self.songEditButtonTapped = false
            print("노래 리스트에서 삭제")
        } label: {
            Image(systemName: "minus.circle.fill")
                .foregroundColor(.grayScale3)
        }
    }
}
