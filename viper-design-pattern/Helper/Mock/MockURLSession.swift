//
//  MockURLSession.swift
//  viper-design-pattern
//
//  Created by Barış Dilekçi on 10.11.2024.
//

import Foundation

class MockURLSession: URLSessionProtocol {
    var data: Data?
    var error: Error?

    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return MockURLSessionDataTask {
            completionHandler(self.data, nil, self.error)
        }
    }
}

class MockURLSessionDataTask: URLSessionDataTask {
    private let closure: () -> Void
    init(closure: @escaping () -> Void) {
        self.closure = closure
    }

    override func resume() {
        closure()
    }
}
