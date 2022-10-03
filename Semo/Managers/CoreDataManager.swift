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
    
    // MARK: - 새로운 노래 저장 (기본 정보만 저장)
    func saveNewSong(songTitle: String, songSinger: String) {
        do {
            let fetchRequest = NSFetchRequest<Song>(entityName: "Song")
            fetchRequest.predicate = NSPredicate(format: "title == %@ && singer == %@", songTitle, songSinger)
            let fetchedResults = try viewContext.fetch(fetchRequest)
            // 중복 검사
            guard (fetchedResults.first) != nil  else {
                let newSong: Song = Song(context: self.viewContext)
                newSong.timestamp = Date()
                newSong.id = UUID()
                newSong.title = songTitle
                newSong.singer = songSinger
                // 추가 정보
                newSong.gender = "남키"
                newSong.level = "중"
                newSong.tune = "0"
                try viewContext.save()
                print("title : \(songTitle), singer : \(songSinger) 저장 완료")
                return
            }
            print("[중복 노래] title : \(songTitle), singer : \(songSinger) 저장 불가")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    // MARK: - 새로운 노래 저장 (기본 정보 + 추가 정보 저장)
    func saveNewSong(songTitle: String, songSinger: String, gender: String, level: String, tune: String) {
        do {
            let fetchRequest = NSFetchRequest<Song>(entityName: "Song")
            fetchRequest.predicate = NSPredicate(format: "title == %@ && singer == %@", songTitle, songSinger)
            let fetchedResults = try viewContext.fetch(fetchRequest)
            // 중복 검사
            guard (fetchedResults.first) != nil  else {
                let newSong: Song = Song(context: self.viewContext)
                newSong.timestamp = Date()
                newSong.id = UUID()
                newSong.title = songTitle
                newSong.singer = songSinger
                // 추가 정보
                newSong.gender = gender
                newSong.level = level
                newSong.tune = tune
                try viewContext.save()
                print("title : \(songTitle), singer : \(songSinger), gender : \(gender), level : \(level), tune : \(tune) 저장 완료")
                return
            }
            print("[중복 노래] title : \(songTitle), singer : \(songSinger) 저장 불가")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    // MARK: - Song 추가 정보 변경
    func updateSongAdditionalInformation(song: Song, gender: String, level: String, tune: String) {
        do {
            // 추가 정보
            song.gender = gender
            song.level = level
            song.tune = tune
            try viewContext.save()
            print("gender : \(gender), level : \(level), tune : \(tune) 저장 완료")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    // MARK: - 새로운 싱잉리스트 생성
    func saveNewSingingList(singingListTitle: String) {
        do {
            let fetchRequest = NSFetchRequest<SingingList>(entityName: "SingingList")
            fetchRequest.predicate = NSPredicate(format: "title == %@", singingListTitle)
            let fetchedResults = try viewContext.fetch(fetchRequest)
            // 중복 검사
            guard (fetchedResults.first?.title) != nil else {
                let newSingingList: SingingList = SingingList(context: self.viewContext)
                newSingingList.timestamp = Date()
                newSingingList.id = UUID()
                newSingingList.title = singingListTitle
                newSingingList.count = 0
                try viewContext.save()
                print("title : \(singingListTitle) 싱잉리스트 생성 완료")
                return
            }
            print("[중복 싱잉리스트] title : \(singingListTitle) 싱잉리스트 생성 불가")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    // MARK: - 노래 목록 가져오기
    func fetchSongList() -> [Song]? {
        let fetchRequest = NSFetchRequest<Song>(entityName: "Song")
        do {
            let fetchedResults = try viewContext.fetch(fetchRequest)
            return fetchedResults
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    // MARK: - Song 삭제
    func deleteSong(song: Song) {
        do {
            viewContext.delete(song)
            try viewContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    // MARK: - SingingList 삭제
    func deleteSingingList(singingList: SingingList) {
        do {
            viewContext.delete(singingList)
            try viewContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    // MARK: - SingingList title 변경
    func updateSingingListTitle(title: String, singingList: SingingList) {
        singingList.title = title
        do {
            try viewContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}
