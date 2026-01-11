//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Jai Prakash Yadav on 21/12/25.
//

import Foundation

public protocol FeedLoader {
    typealias Result = Swift.Result<[FeedImage], Error>
    func load(completion: @escaping (Result) -> Void)
}

