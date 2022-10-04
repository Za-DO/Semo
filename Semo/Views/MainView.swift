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
    @State var songEditButtonTapped: Bool = false
    @State var listEditButtonTapped: Bool = false
    @State var isPopToRoot: Bool = false
    @State var songList: [Song] = CoreDataManager.shared.fetchSongList() ?? []
    // 온보딩 로딩 트리거
    @State var loading: Bool = true
    
    @Namespace var namespace
    
    var tabBarOptions: [String] = ["전체 노래", "싱잉리스트"]
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            NavigationView {
                ZStack(alignment: .top) {
                    Image("backgroundImage")
                        .ignoresSafeArea()
                    
                    // MARK: - 상단 TabBar
                    // -------------------------------------------
                    
                    TabView(selection: self.$currentTab) {
                        SongListView(songList: $songList, refresh: $currentTab, songEditButtonTap: $songEditButtonTapped).tag(0)
                        SingingListView(refresh: $currentTab, songEditButtonTapped: $songEditButtonTapped, listEditButtonTapped: $listEditButtonTapped).tag(1)
                    }
                    .tabViewStyle(.page(indexDisplayMode: .never))
                    .edgesIgnoringSafeArea(.all)
                    .navigationBarTitle("", displayMode: .inline)
                    
                    
                    // MARK: 커스텀된 TabBar 메뉴 버튼
                    
                    HStack {
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
                        
                        // MARK: 우측 상단 노래 및 리스트 추가 버튼
                        
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
                    .padding(EdgeInsets(top: 120, leading: 10, bottom: 0, trailing: 24))
                    // FIXME: - background 생략시 탭바가 아래로 밀리는 현상 발생
                    .background(.clear)
                    .frame(height: 32)
                    
                    // -------------------------------------------
                    
                }
                .navigationBarHidden(true)
            }
            .accentColor(.mainPurpleColor)
            .onAppear {
                songList = CoreDataManager.shared.fetchSongList() ?? []
                DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                    loading.toggle()
                })
            }
            // MARK: - 온보딩 페이지
//            if loading {
//                OnBoardingView()
//            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
