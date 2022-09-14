//
//  CoreDataManager.swift
//  Semo
//
//  Created by Terry Koo on 2022/07/16.
//

import Foundation
import CoreData

class CoreDataInitManager {
    // 싱글턴
    static let shared = CoreDataInitManager()
    
    private init() {}
    
    lazy var context = persistentContainer.viewContext
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Semo")
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("[Unresolved error] \(error), \(error.userInfo)")
            }
        }
        print("[Container loaded]")
        return container
    }()
}
