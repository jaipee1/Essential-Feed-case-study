//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Jai Prakash Yadav on 21/12/25.
//

import Foundation

public typealias LoadFeedResult = Result<[FeedImage], Error>

public protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
