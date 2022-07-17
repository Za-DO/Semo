//
//  SingingList+CoreDataProperties.swift
//  Semo
//
//  Created by Terry Koo on 2022/07/17.
//
//

import Foundation
import CoreData


extension SingingList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SingingList> {
        return NSFetchRequest<SingingList>(entityName: "SingingList")
    }

    @NSManaged public var count: Int64
    @NSManaged public var title: String?
    @NSManaged public var id: UUID?
    @NSManaged public var timestamp: Date?
    @NSManaged public var singingListToSong: NSSet?

    public var songArray: [Song] {
        let set = singingListToSong as? Set<Song> ?? []
        return set.sorted {
            $0.timestamp! < $1.timestamp!
        }
    }
}

// MARK: Generated accessors for singingListToSong
extension SingingList {

    @objc(addSingingListToSongObject:)
    @NSManaged public func addToSingingListToSong(_ value: Song)

    @objc(removeSingingListToSongObject:)
    @NSManaged public func removeFromSingingListToSong(_ value: Song)

    @objc(addSingingListToSong:)
    @NSManaged public func addToSingingListToSong(_ values: NSSet)

    @objc(removeSingingListToSong:)
    @NSManaged public func removeFromSingingListToSong(_ values: NSSet)

}

extension SingingList : Identifiable {

}
