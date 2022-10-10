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
    @State var listDetailEditButtonTapped: Bool = false
    @State var mainFetch: Bool = false
    @State var isPopToRoot: Bool = false
    @State var songList: [Song] = CoreDataManager.shared.fetchSongList() ?? []
    @State var singingListArray: [SingingList] = CoreDataManager.shared.fetchSingingListArray() ?? []
    
    @Namespace var namespace
    
    var tabBarOptions: [String] = ["전체 노래", "싱잉리스트"]
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                Image("backgroundImage")
                    .ignoresSafeArea()
                
                // MARK: - 상단 TabBar
                // -------------------------------------------
                
                TabView(selection: self.$currentTab) {
                    SongListView(songList: $songList, refreshView: $mainFetch, songEditButtonTapped: $songEditButtonTapped).tag(0)
                    SingingListView(songList: $songList, refreshView: $mainFetch, songEditButtonTapped: $songEditButtonTapped, listEditButtonTapped: $listEditButtonTapped).tag(1)
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
                            SingingListModalView(singingListArray: $singingListArray, refreshView: $mainFetch, listEditButtonTapped: $listEditButtonTapped)
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
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
