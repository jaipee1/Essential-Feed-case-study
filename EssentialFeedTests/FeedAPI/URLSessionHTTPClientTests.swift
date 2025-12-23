//
//  URLSessionHTTPClientTests.swift
//  EssentialFeed
//
//  Created by Jai Prakash Yadav on 23/12/25.
//

import XCTest

class URLSessionHTTPClient {
    private let session: URLSession

    init(session: URLSession) {
        self.session = session
    }

    func get(from url: URL) {
        session.dataTask(with: url) { _, _, _ in

        }.resume()
    }
}

class URLSessionHTTPClientTests: XCTestCase {
    func test_getFromURL_resumesDataTaskWithURL() {
        let url = URL(string: "http://a-url.com")!
        let session = URLSessionSpy()
        let task = URLSessionDataTaskSpy()
        session.stub(url: url, task: task)

        let sut = URLSessionHTTPClient(session: session)
        sut.get(from: url)
        XCTAssertEqual(task.resumedCallCount, 1)
    }

    // MARK: Helpers
    private class URLSessionSpy: URLSession, @unchecked Sendable {
        private var stubs = [URL: URLSessionDataTask]()

        func stub(url: URL, task: URLSessionDataTask) {
            stubs[url] = task
        }

        override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
            return stubs[url] ?? FakeURLSessionDataTask()
        }
    }

    private class FakeURLSessionDataTask: URLSessionDataTask, @unchecked Sendable {
        override func resume() {
        }
    }
    private class URLSessionDataTaskSpy: URLSessionDataTask, @unchecked Sendable {
        var resumedCallCount = 0

        override func resume() {
            resumedCallCount += 1
        }
    }
}
