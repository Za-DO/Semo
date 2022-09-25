//
//  MainView.swift
//  Semo
//
//  Created by 유정인 on 2022/07/17.
//

import SwiftUI

struct MainView: View {
    @State private var showSingingListModal: Bool = false
    @State var currentTab: Int = 0
    @State var editButtonTap: Bool = false
    @State var isPopToRoot: Bool = false
    @State var songList: [Song] = CoreDataManager.shared.fetchSongList() ?? []
    
    @Namespace var namespace
    
    var tabBarOptions: [String] = ["전체 노래", "싱잉리스트"]
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                Image("backgroundImage")
                    .ignoresSafeArea()
                
                // MARK: - 상단 탭바
                TabView(selection: self.$currentTab) {
                    SongListView(songList: $songList, refresh: $currentTab, editButtonTapped: $editButtonTap).tag(0)
                        
                    SingingListView(refresh: $currentTab, editButtonTap: $editButtonTap).tag(1)
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .edgesIgnoringSafeArea(.all)
                
                HStack {
                    // MARK: - 탭바 생성
                    HStack {
                        ForEach(Array(zip(self.tabBarOptions.indices,
                                          self.tabBarOptions)),
                                id: \.0,
                                content: { index, name in
                            TabBarItemView(tabBarItemName: name,
                                           currentTab: self.$currentTab,
                                           namespace: namespace.self,
                                           tab: index)
                        })
                    }
                    Spacer()
                    // MARK: - 탭바 우측 노래 리스트 추가 버튼
                    if tabBarOptions[currentTab] == "전체 노래" {
                        NavigationLink(destination: AddSongView(isPopToRoot: $isPopToRoot), isActive: self.$isPopToRoot) {
                            Image("Songlistbuttonimage")
                        }
                        .isDetailLink(false)
                    } else {
                        Button {
                            self.showSingingListModal = true
                        } label: {
                            Image(tabBarOptions[currentTab] == "전체 노래" ? "Songlistbuttonimage" : "Singinglistbuttonimage")
                        }
                        .sheet(isPresented: $showSingingListModal) {
                            SingingListModalView()
                        }
                    }
                }
                .padding(.top, 60)
                .padding(EdgeInsets(top: 60, leading: 10, bottom: 0, trailing: 24))
                // FIXME: - background 생략시 탭바가 아래로 밀리는 현상 발생
                .background(.clear)
                .frame(height: 32)
//                TabBarView(currentTab: self.$currentTab)
//                    .padding(.top, 60)
            }
            .navigationTitle("메인뷰")
            .navigationBarHidden(true)
        }
        .accentColor(.mainPurpleColor)
        .onAppear{
            songList = CoreDataManager.shared.fetchSongList() ?? []
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
