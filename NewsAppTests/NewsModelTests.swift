//
//  NewsModelTests.swift
//  NewsAppTests
//
//  Created by narfk on 06/10/2023.
//

import XCTest
@testable import NewsApp

final class NewsModelTests: XCTestCase {

    func testArticleEquality() {
           let article1 = Article.dummyData
           let article2 = Article.dummyData

           XCTAssertEqual(article1, article2, "Les articles devraient être égaux")
       }

       func testArticleIdIsNotNil() {
           let article = Article.dummyData

           XCTAssertNotNil(article.id, "L'ID de l'article ne devrait pas être nul")
       }
    func testArticleHasValidURL() {
          let article = Article.dummyData

          XCTAssertTrue(URL(string: article.url) != nil, "L'URL de l'article devrait être valide")
      }

      func testArticleHasValidImageURL() {
          let article = Article.dummyData

          XCTAssertTrue(URL(string: article.urlToImage) != nil, "L'URL de l'image de l'article devrait être valide")
      }

      func testArticlePublishedAtIsFormattedCorrectly() {
          let article = Article.dummyData
          let dateFormatter = DateFormatter()
          dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
          let formattedDate = dateFormatter.date(from: article.publishedAt)

          XCTAssertNotNil(formattedDate, "La date de publication de l'article devrait être formatée correctement")
      }

      func testArticleHasContent() {
          let article = Article.dummyData

          XCTAssertFalse(article.content.isEmpty, "Le contenu de l'article ne devrait pas être vide")
      }

}
