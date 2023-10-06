//
//  NewsViewModelTests.swift
//  NewsAppTests
//
//  Created by narfk on 06/10/2023.
//

import XCTest
@testable import NewsApp

final class NewsViewModelTests: XCTestCase {
    var viewModel: ArticlesViewModel!
    var mockNewsService: MockNewsService!

    override func setUp() {
        super.setUp()
        mockNewsService = MockNewsService()
        viewModel = ArticlesViewModel(newsService: mockNewsService)
    }

    func testFetchArticlesSuccess() {
        let expectation = XCTestExpectation(description: "Fetch articles successfully")

        viewModel.fetchArticles()

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            XCTAssertGreaterThan(self.viewModel.articles.count, 0)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 5)
    }

    func testFetchArticlesFailure() {
        let expectation = XCTestExpectation(description: "Fetch articles with failure")
        mockNewsService.shouldReturnError = true

        viewModel.fetchArticles()

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            XCTAssertTrue(self.viewModel.showErrorAlert)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 5)
    }
}

