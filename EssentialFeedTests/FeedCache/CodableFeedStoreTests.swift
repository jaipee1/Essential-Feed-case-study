//
//  Untitled.swift
//  EssentialFeed
//
//  Created by Jai Prakash Yadav on 30/12/25.
//

import EssentialFeed
import XCTest

class CodableFeedStore {
    func retrieve(completion: @escaping FeedStore.RetrievalCompletion) {
        completion(.empty)
    }
}

class CodableFeedStoreTests: XCTestCase {
    func test_retrieve_deliversEmptyOnEmptyCache() {
        let sut = CodableFeedStore()

        let exp = expectation(description: "wait for retrieval to complete")
        sut.retrieve { result in
            switch result {
            case .empty:
                break
            default:
                XCTFail("Expected empty result, got \(result) instead.")
            }
            exp.fulfill()
        }

        wait(for: [exp], timeout: 1.0)
    }

    func test_retrieve_hasNoSideEffectOnEmptyCache() {
        let sut = CodableFeedStore()

        let exp = expectation(description: "wait for retrieval to complete")
        sut.retrieve { firstResult in
            sut.retrieve { secondResult in
                switch (firstResult, secondResult) {
                case (.empty, .empty):
                    break
                default:
                    XCTFail(
                        """
                        Expected retrieving twice from empty cache to deliver same empty result, 
                        got \(firstResult) and \(secondResult)instead.
                        """
                    )
                }
                exp.fulfill()
            }
        }

        wait(for: [exp], timeout: 1.0)
    }
}
