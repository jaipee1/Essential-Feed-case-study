//
//  ManagedFeedImage.swift
//  EssentialFeed
//
//  Created by Jai Prakash Yadav on 07/01/26.
//

import CoreData

@objc(ManagedFeedImage)
internal class ManagedFeedImage: NSManagedObject {
    @NSManaged var id: UUID
    @NSManaged var imageDescription: String?
    @NSManaged var location: String?
    @NSManaged var url: URL
    @NSManaged var cache: ManagedCache

    var local: LocalFeedImage {
        LocalFeedImage(id: id, description: imageDescription, location: location, url: url)
    }

    static func images(from localFeed: [LocalFeedImage], in context: NSManagedObjectContext) -> NSOrderedSet {
        NSOrderedSet(
            array: localFeed.map({ local in
                let managedFeedImage = ManagedFeedImage(context: context)
                managedFeedImage.id = local.id
                managedFeedImage.imageDescription = local.description
                managedFeedImage.location = local.location
                managedFeedImage.url = local.url
                return managedFeedImage
            })
        )
    }
}
