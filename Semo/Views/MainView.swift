//
//  MainView.swift
//  Semo
//
//  Created by 유정인 on 2022/07/17.
//

import SwiftUI

struct MainView: View {
    @State var currentTab: Int = 0
    @State var editButtonTap: Bool = false
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                // For view refresh
                if currentTab == -1 {
                    Text("\(currentTab)")
                }
                Image("backgroundImage")
                    .ignoresSafeArea()
                
                // MARK: - 상단 탭바
                TabView(selection: self.$currentTab) {
                    SongListView(refresh: $currentTab, editButtonTapped: $editButtonTap).tag(0)
                    SingingListView(refresh: $currentTab, editButtonTap: $editButtonTap).tag(1)
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .edgesIgnoringSafeArea(.all)
                
                TabBarView(currentTab: self.$currentTab)
                    .padding(.top, 60)
            }
            .navigationTitle("메인뷰")
            .navigationBarHidden(true)
        }
        .accentColor(.mainPurpleColor)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
