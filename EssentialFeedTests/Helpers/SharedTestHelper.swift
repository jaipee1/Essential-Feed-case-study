//
//  SharedTestHelper.swift
//  EssentialFeed
//
//  Created by Jai Prakash Yadav on 29/12/25.
//

import Foundation

func anyNSError() -> NSError {
    NSError(domain: "any", code: 0)
}

func anyURL() -> URL {
    URL(string: "https://any-url.com")!
}
