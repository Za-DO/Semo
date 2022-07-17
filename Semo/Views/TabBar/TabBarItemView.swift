//
//  TabBarItemView.swift
//  Semo
//
//  Created by 유정인 on 2022/07/17.
//

import SwiftUI

struct TabBarItemView: View {
    @State var tabBarItemName: String
    @Binding var currentTab: Int
    
    let namespace: Namespace.ID
    var tab: Int

    // MARK: - BODY
    var body: some View {
        Button {
            self.currentTab = tab
        } label: {
            // MARK: - 탭바 형태, 애니메이션
            VStack {
                Spacer()
                Text(tabBarItemName)
                if currentTab == tab {
                    Color.mainPurpleColor
                        .frame(width: 24, height: 4)
                        .matchedGeometryEffect(id: "underline",
                                               in: namespace,
                                               properties: .frame)
                } else {
                    Color.clear.frame(height: 4)
                }
            }
            .frame(width: 100) //탭 크기
            .animation(.spring(), value: self.currentTab)
        }
        .font(.system(size: 20, weight: .semibold))
        .foregroundColor(.grayScale1)
    }
}
