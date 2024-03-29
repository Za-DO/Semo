//
//  SingingListView.swift
//  Semo
//
//  Created by 유정인 on 2022/07/16.
//

import SwiftUI

struct SingingListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \SingingList.timestamp, ascending: true)], animation: .default) private var singingList: FetchedResults<SingingList>
    @Binding var songList: [Song]
    @Binding var refreshView: Bool
    @Binding var songEditButtonTapped: Bool
    @Binding var listEditButtonTapped: Bool
    
    // MARK: - BODY
    var body: some View {
        VStack {
            HStack {
                // TODO: - 리스트 개수 나타내도록 코드 수정하기
                Text("리스트 \(singingList.count)개")
                    .font(.subheadline)
                    .foregroundColor(.grayScale2)
                    .fontWeight(.medium)
                Spacer()
                SongEditButtonView(buttonName: "리스트 편집", buttonWidth: 93) {
                    self.listEditButtonTapped.toggle()
                }
            }
            .padding(EdgeInsets(top: 15, leading: 20, bottom: 15, trailing: 30))            
            // MARK: - 싱잉리스트 생성 및 스크롤 추가
            ScrollView {
                Divider()
                    .background(Color.grayScale6)
                    .frame(width: UIScreen.getWidth(350))
                ForEach(singingList) {
                    SingingListCellView(songList: $songList, songEditButtonTapped: $songEditButtonTapped, listEditButtonTapped: $listEditButtonTapped, singingList: $0)
                    Divider()
                        .background(Color.grayScale6)
                        .frame(width: UIScreen.getWidth(350))
                }
                .padding(.top, 10)
            }
            Spacer()
        }
        .padding(.top, 80)
        .onChange(of: refreshView, perform: { _ in
            print("싱잉리스트 리프레쉬")
        })
        .onAppear {
            self.refreshView.toggle()
            self.songList = CoreDataManager.shared.fetchSongList() ?? []
        }
        .onDisappear {
            self.listEditButtonTapped = false
        }
    }
}
