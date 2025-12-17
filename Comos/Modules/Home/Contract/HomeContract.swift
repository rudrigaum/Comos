//
//  HomeContract.swift
//  Comos
//
//  Created by Rodrigo Cerqueira Reis on 17/12/25.
//

import Foundation
import UIKit

// MARK: - View
protocol HomeViewInput: AnyObject {
    func showLoading()
    func hideLoading()
    func showData(_ entity: ApodEntity)
    func showError(_ message: String)
}

// MARK: - Presenter

protocol HomeViewOutput: AnyObject {
    func viewDidLoad()
    func didTapRefresh()
}

protocol HomeInteractorOutput: AnyObject {
    func didRetrieveApodSuccess(_ entity: ApodEntity)
    func didRetrieveApodError(_ error: Error)
}

// MARK: - Interactor
protocol HomeInteractorInput: AnyObject {
    func fetchApodData()
}

// MARK: - Router
protocol HomeRouterInput: AnyObject {
    func showAlert(title: String, message: String)
}
