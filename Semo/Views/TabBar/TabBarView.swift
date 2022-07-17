//
//  TabBarView.swift
//  Semo
//
//  Created by 유정인 on 2022/07/17.
//

import SwiftUI

struct TabBarView: View {
    @Binding var currentTab: Int
    @Namespace var namespace
    
    var tabBarOptions: [String] = ["전체 노래", "싱잉리스트"]
    
    var body: some View {
        HStack {
            HStack {
                ForEach(Array(zip(self.tabBarOptions.indices,
                                  self.tabBarOptions)),
                        id: \.0,
                        content: {
                    index, name in
                    TabBarItemView(tabBarItemName: name,
                                   currentTab: self.$currentTab,
                                   namespace: namespace.self,
                                   tab: index)
                })
            }
            Spacer()
            Button {
                print("노래 추가")
            } label: {
                Image("Songlistbuttonimage")
            }
        }
        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 24))
        .background(.clear) // background 없으면 tabbar가 아래로 밀림
        .frame(height: 32)
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
