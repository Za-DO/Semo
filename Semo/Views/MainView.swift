//
//  MainView.swift
//  Semo
//
//  Created by 유정인 on 2022/07/17.
//

import SwiftUI

struct MainView: View {
    @State var currentTab: Int = 0
    
    var body: some View {
        ZStack(alignment: .top) {
            Image("backgroundImage")
                .ignoresSafeArea()
            TabView(selection: self.$currentTab) {
                SongListView().tag(0)
                SingingListView().tag(1)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .edgesIgnoringSafeArea(.all)
            
            TabBarView(currentTab: self.$currentTab)
                .padding(.top, 60)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
