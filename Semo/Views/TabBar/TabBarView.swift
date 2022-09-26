//
//  TabBarView.swift
//  Semo
//
//  Created by 유정인 on 2022/07/17.
//

import SwiftUI

struct TabBarView: View {
    @State var showSingingListModal: Bool = false
    @Binding var currentTab: Int
    @Namespace var namespace
    
    var tabBarOptions: [String] = ["전체 노래", "싱잉리스트"]
    
    // MARK: - BODY
    var body: some View {
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
                NavigationLink(destination: AddSongView()) {
                    Image("Songlistbuttonimage")
                }
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
        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 24))
        // FIXME: - background 생략시 탭바가 아래로 밀리는 현상 발생
        .background(.clear)
        .frame(height: 32)
    }
}
