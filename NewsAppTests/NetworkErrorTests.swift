//
//  NetworkErrorTests.swift
//  NewsAppTests
//
//  Created by narfk on 06/10/2023.
//

import XCTest
@testable import NewsApp

final class NetworkErrorTests: XCTestCase {

    func testBadURLErrorDescription() {
           let error = NetworkError.badURL
           XCTAssertEqual(error.errorDescription, "URL invalide")
       }

       func testDecodingErrorDescription() {
           let error = NetworkError.decodingError
           XCTAssertEqual(error.errorDescription, "Échec du décodage de l'objet depuis le service API")
       }

       func testErrorCodeDescription() {
           let code = 404
           let error = NetworkError.errorCode(code)
           XCTAssertEqual(error.errorDescription, "\(code) - Code d'erreur de l'API")
       }

       func testUnknownErrorDescription() {
           let error = NetworkError.unknown
           XCTAssertEqual(error.errorDescription, "Erreur inconnue")
       }
}
