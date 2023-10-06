//
//  NewsAppUITests.swift
//  NewsAppUITests
//
//  Created by narfk on 06/10/2023.
//

import XCTest

final class NewsAppUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Attendez que la liste des articles soit visible à l'écran.
        let expectation = XCTestExpectation(description: "Attendez que la liste des articles soit chargée")
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    expectation.fulfill()
                }
                wait(for: [expectation], timeout: 5)

        let collectionViewsQuery = app.collectionViews
        XCTAssertTrue(collectionViewsQuery.count > 0)

        collectionViewsQuery/*@START_MENU_TOKEN@*/.buttons["iPhone 15 / 15 Pro : quel est le meilleur moment pour acheter ?"]/*[[".cells.buttons[\"iPhone 15 \/ 15 Pro : quel est le meilleur moment pour acheter ?\"]",".buttons[\"iPhone 15 \/ 15 Pro : quel est le meilleur moment pour acheter ?\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let newsButton = app.navigationBars["Détails de la News"].buttons["News"]
        newsButton.tap()
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
