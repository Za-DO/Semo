//
//  CoreDataManager.swift
//  Semo
//
//  Created by Terry Koo on 2022/09/14.
//

import Foundation
import CoreData

class CoreDataManager {
    static let shared: CoreDataManager = CoreDataManager()
    let viewContext = CoreDataInitManager.shared.context
    
    private init() {}
    
    func saveNewSong(songTitle: String, songSinger: String) {
        let newSong: Song = Song(context: self.viewContext)
        newSong.timestamp = Date()
        newSong.id = UUID()
        newSong.title = songTitle
        newSong.singer = songSinger
        do {
            try viewContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func saveNewSingingList(singingListTitle: String) {
        let newSingingList: SingingList = SingingList(context: self.viewContext)
        newSingingList.timestamp = Date()
        newSingingList.id = UUID()
        newSingingList.title = singingListTitle
        newSingingList.count = 0
        do {
            try viewContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}
