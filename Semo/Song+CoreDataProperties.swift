//
//  Song+CoreDataProperties.swift
//  Semo
//
//  Created by Terry Koo on 2022/07/17.
//
//

import Foundation
import CoreData


extension Song {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Song> {
        return NSFetchRequest<Song>(entityName: "Song")
    }

    @NSManaged public var gender: String?
    @NSManaged public var level: String?
    @NSManaged public var singer: String?
    @NSManaged public var title: String?
    @NSManaged public var tune: String?
    @NSManaged public var id: UUID?
    @NSManaged public var timestamp: Date?
    @NSManaged public var songToSingingList: NSSet?
    
    public var singingListArray: [SingingList] {
        let set = songToSingingList as? Set<SingingList> ?? []
        return set.sorted {
            $0.timestamp! < $1.timestamp!
        }
    }

}

// MARK: Generated accessors for songToSingingList
extension Song {

    @objc(addSongToSingingListObject:)
    @NSManaged public func addToSongToSingingList(_ value: SingingList)

    @objc(removeSongToSingingListObject:)
    @NSManaged public func removeFromSongToSingingList(_ value: SingingList)

    @objc(addSongToSingingList:)
    @NSManaged public func addToSongToSingingList(_ values: NSSet)

    @objc(removeSongToSingingList:)
    @NSManaged public func removeFromSongToSingingList(_ values: NSSet)

}

extension Song : Identifiable {

}
