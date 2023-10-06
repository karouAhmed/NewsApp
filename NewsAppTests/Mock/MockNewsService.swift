//
//  MockNewsService.swift
//  NewsAppTests
//
//  Created by narfk on 06/10/2023.
//
@testable import NewsApp
import Foundation
class MockNewsService: ArticlesServiceProtocol {
    var shouldReturnError = false

    func getArticles(page: Int, completion: @escaping (Result<ArticleResponse, Error>) -> Void) {
        if shouldReturnError {
            completion(.failure(MockError.mockError))
        } else {
            // Return a mock response here
            let mockResponse = ArticleResponse(totalResults: 10, articles: [Article.dummyData])
            completion(.success(mockResponse))
        }
    }
}
// Protocole d'erreur simulée pour les tests unitaires
enum MockError: Error {
    case mockError
}
