//
//  SwiftUIAppTests.swift
//  SwiftUIAppTests
//
//  Created by Danutha Fernando on 2024-02-28.
//

import XCTest
@testable import SwiftUIApp

final class SwiftUIAppTests: XCTestCase {

    private (set) var viewModel: NewsViewModel!
    private (set) var mockService: MockService!
    override func setUp() {
        super.setUp()
        mockService = MockService()
        viewModel = NewsViewModel(service: mockService)
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testVm() async {
        await viewModel.fetchNewsData()
        XCTAssertFalse(viewModel.isLoading)
        XCTAssertNotNil(viewModel.newsData)
        XCTAssertNil(viewModel.errorMessage)
        XCTAssertEqual(viewModel.newsData.count, 1)
        XCTAssertTrue(viewModel.newsData.first?.title == "some title")
    }
}
