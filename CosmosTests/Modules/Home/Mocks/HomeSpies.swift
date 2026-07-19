//
//  HomeSpies.swift
//  CosmosTests
//
//  Created by Rodrigo Cerqueira Reis on 02/01/26.
//

import Foundation
import XCTest
@testable import Cosmos

// MARK: - View Spy
class HomeViewSpy: HomeViewInput {
    
    var showLoadingCalled = false
    var hideLoadingCalled = false
    var showDataCalled = false
    var showErrorCalled = false
    
    var passedEntity: ApodEntity?
    var passedErrorMessage: String?
    
    func showLoading() {
        showLoadingCalled = true
    }
    
    func hideLoading() {
        hideLoadingCalled = true
    }
    
    func showData(_ entity: ApodEntity) {
        showDataCalled = true
        passedEntity = entity
    }
    
    func showError(_ message: String) {
        showErrorCalled = true
        passedErrorMessage = message
    }
}

// MARK: - Interactor Spy
class HomeInteractorSpy: HomeInteractorInput {
    
    weak var presenter: HomeInteractorOutput?
    var fetchApodDataCalled = false
    
    func fetchApodData() {
        fetchApodDataCalled = true
    }
    
    // Simula retorno de sucesso da API
    func simulateSuccess(with entity: ApodEntity) {
        presenter?.didRetrieveApodSuccess(entity)
    }
    
    // Simula retorno de erro da API
    func simulateError(with error: Error) {
        presenter?.didRetrieveApodError(error)
    }
}

// MARK: - Router Spy
class HomeRouterSpy: HomeRouterInput {
    
    var showAlertCalled = false
    var routeToDetailCalled = false
    var passedTitle: String?
    var passedMessage: String?
    var passedEntity: ApodEntity?
    var passedImage: UIImage?

    func showAlert(title: String, message: String) {
        showAlertCalled = true
        passedTitle = title
        passedMessage = message
    }

    func routeToDetail(with entity: ApodEntity, image: UIImage?) {
        routeToDetailCalled = true
        passedEntity = entity
        passedImage = image
    }
}
