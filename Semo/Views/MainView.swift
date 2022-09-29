//
//  MainView.swift
//  Semo
//
//  Created by 유정인 on 2022/07/17.
//

import SwiftUI

struct MainView: View {
    @State var currentTab: Int = 0
    @State var songEditButtonTapped: Bool = false
    @State var listEditButtonTapped: Bool = false
    @State var songList: [Song] = CoreDataManager.shared.fetchSongList() ?? []
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                Image("backgroundImage")
                    .ignoresSafeArea()
                
                // MARK: - 상단 탭바
                TabView(selection: self.$currentTab) {
                    SongListView(refresh: $currentTab, songEditButtonTap: $songEditButtonTapped).tag(0)
                    SingingListView(refresh: $currentTab, songEditButtonTapped: $songEditButtonTapped, listEditButtonTapped: $listEditButtonTapped).tag(1)
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .edgesIgnoringSafeArea(.all)
                .navigationBarTitle("", displayMode: .inline)
                
                TabBarView(currentTab: self.$currentTab)
                    .padding(.top, 60)
            }
            .navigationBarHidden(true)
        }
        .accentColor(.mainPurpleColor)
        .onAppear {
            songList = CoreDataManager.shared.fetchSongList() ?? []
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
