//
//  FeedCacheTestHelpers.swift
//  EssentialFeed
//
//  Created by Jai Prakash Yadav on 29/12/25.
//

import Foundation
import EssentialFeed

func uniqueImage() -> FeedImage {
    FeedImage(id: UUID(), description: "any Description", location: "any location", url: anyURL())
}

func uniqueImageFeed() -> (models: [FeedImage], local: [LocalFeedImage]) {
    let items = [uniqueImage(), uniqueImage()]
    let localItems = items.map { LocalFeedImage(id: $0.id, description: $0.description, location: $0.location, url: $0.url)}
    return (items, localItems)
}

extension Date {
    func minusFeedCacheMaxAge() -> Date {
        adding(days: -7)
    }

    func adding(days: Int) -> Date {
        Calendar(identifier: .gregorian).date(byAdding: .day, value: days, to: self)!
    }
    func adding(seconds: TimeInterval) -> Date {
        self + seconds
    }
}
