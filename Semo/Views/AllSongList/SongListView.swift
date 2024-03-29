//
//  SongListView.swift
//  Semo
//
//  Created by 유정인 on 2022/07/16.
//

import SwiftUI

struct SongListView: View {
    @Binding var songList: [Song]
    @Binding var refreshView: Bool
    @Binding var songEditButtonTapped: Bool
    
    // MARK: - BODY
    var body: some View {
        VStack {
            // MARK: - 전체 노래 리스트 상단 바
            HStack {
                // TODO: - 데이터 크기로 값 받아오기
                Text("총 \(songList.count)곡")
                    .font(.subheadline)
                    .foregroundColor(.grayScale2)
                    .fontWeight(.medium)
                Spacer()
                SongEditButtonView(buttonName: "목록 편집", buttonWidth: 80) {
                    self.songEditButtonTapped.toggle()
                }
            }
            // FIXME: - trailing을 추가하지 않으면 목록 편집 버튼이 오른쪽으로 치우침
            .padding(EdgeInsets(top: 15, leading: 20, bottom: 15, trailing: 30))            
            // MARK: - 노래 리스트 생성 및 스크롤 추가
            ScrollView {
                Divider()
                    .background(Color.grayScale6)
                    .frame(width: UIScreen.getWidth(350))
                ForEach(songList) {
                    SongListCellView(songEditButtonTapped: $songEditButtonTapped, refreshView: $refreshView, song: $0)
                    Divider()
                        .background(Color.grayScale6)
                        .frame(width: UIScreen.getWidth(350))
                }
                .padding(.top, 10)
                Spacer()
            }
        }
        .padding(.top, 80)
        .onChange(of: songEditButtonTapped, perform: { _ in
            songList = CoreDataManager.shared.fetchSongList() ?? []
            print("노래 편집")
        })
        .onChange(of: refreshView, perform: { _ in
            songList = CoreDataManager.shared.fetchSongList() ?? []
            print("노래 리프레쉬")
        })
        .onAppear{
            self.refreshView.toggle()
            self.songList = CoreDataManager.shared.fetchSongList() ?? []
        }
        .onDisappear {
            self.songEditButtonTapped = false
        }
    }
}
