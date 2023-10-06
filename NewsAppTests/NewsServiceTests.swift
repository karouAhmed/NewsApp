//
//  NewsServiceTests.swift
//  NewsAppTests
//
//  Created by narfk on 06/10/2023.
//

import XCTest
@testable import NewsApp

final class NewsServiceTests: XCTestCase {
    var newsService: ArticlesService!

    override func setUp() {
        super.setUp()
        newsService = ArticlesService()
    }

    func testGetNewsSuccess() {
        let expectation = XCTestExpectation(description: "Fetch news successfully")

        newsService.getArticles(page: 1) { result in
            switch result {
            case .success(let response):
                XCTAssertNotNil(response)
                XCTAssertGreaterThan(response.articles.count, 0)
                expectation.fulfill()
            case .failure:
                XCTFail("Expected successful response")
            }
        }

        wait(for: [expectation], timeout: 5)
    }
}
