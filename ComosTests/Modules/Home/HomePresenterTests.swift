//
//  HomePresenterTests.swift
//  ComosTests
//
//  Created by Rodrigo Cerqueira Reis on 02/01/26.
//

import Foundation
import XCTest
@testable import Comos

@MainActor
class HomePresenterTests: XCTestCase {

    var sut: HomePresenter!
    var viewSpy: HomeViewSpy!
    var interactorSpy: HomeInteractorSpy!
    var routerSpy: HomeRouterSpy!
    
    // MARK: - Setup
    override func setUp() {
        super.setUp()
        
        viewSpy = HomeViewSpy()
        interactorSpy = HomeInteractorSpy()
        routerSpy = HomeRouterSpy()
        sut = HomePresenter()
        
        sut.view = viewSpy
        sut.interactor = interactorSpy
        sut.router = routerSpy
        interactorSpy.presenter = sut
    }
    
    override func tearDown() {
        viewSpy = nil
        interactorSpy = nil
        routerSpy = nil
        sut = nil
        super.tearDown()
    }
    
    // MARK: - Tests
    
    func test_viewDidLoad_shouldFetchDataAndShowLoading() {
        sut.viewDidLoad()
        
        XCTAssertTrue(viewSpy.showLoadingCalled, "A View deveria mostrar o loading")
        XCTAssertTrue(interactorSpy.fetchApodDataCalled, "O Interactor deveria buscar dados")
    }
    
    func test_didRetrieveApodSuccess_shouldFormatAndDisplayData() {
        let mockEntity = ApodEntity(
            title: "Test Title",
            explanation: "Test Description",
            date: "2023-10-01",
            url: "http://test.com/image.png",
            mediaType: "image"
        )
        
        let expectation = XCTestExpectation(description: "Wait for main thread update")
        
        sut.didRetrieveApodSuccess(mockEntity)
        
        DispatchQueue.main.async {
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
        
        XCTAssertTrue(viewSpy.hideLoadingCalled, "O Loading deveria ser ocultado")
        
        XCTAssertTrue(viewSpy.showDataCalled, "A View deveria exibir os dados")
        XCTAssertEqual(viewSpy.passedEntity?.title, "Test Title", "O título passado para a view está incorreto")
    }
}
