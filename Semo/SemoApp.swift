//
//  SemoApp.swift
//  Semo
//
//  Created by 유정인 on 2022/07/16.
//

import SwiftUI

@main
struct SemoApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.colorScheme, .dark)
        }
    }
}
