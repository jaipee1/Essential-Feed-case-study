//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Jai Prakash Yadav on 21/12/25.
//

import Foundation

public enum LoadFeedResult {
    case success([FeedImage])
    case failure(Error)
}

public protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
