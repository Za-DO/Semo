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
        let coreDataInitManager: CoreDataInitManager = CoreDataInitManager.shared
        WindowGroup {
//            OnBoardingView()
            MainView()
                .environment(\.colorScheme, .dark)
                .environment(\.managedObjectContext, coreDataInitManager.context)
        }
    }
}
