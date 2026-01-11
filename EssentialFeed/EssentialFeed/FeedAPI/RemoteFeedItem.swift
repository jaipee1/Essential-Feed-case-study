//
//  RemoteFeedItem.swift
//  EssentialFeed
//
//  Created by Jai Prakash Yadav on 26/12/25.
//

import Foundation

struct RemoteFeedItem: Decodable {
    let id: UUID
    let description: String?
    let location: String?
    let image: URL
}
