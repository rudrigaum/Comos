//
//  HomePresenter.swift
//  Comos
//
//  Created by Rodrigo Cerqueira Reis on 17/12/25.
//

import Foundation

class HomePresenter: HomeViewOutput, HomeInteractorOutput {
    
    // MARK: - Properties
    weak var view: HomeViewInput?
    var interactor: HomeInteractorInput?
    var router: HomeRouterInput?
    
    // MARK: - HomeViewOutput
    func viewDidLoad() {
        view?.showLoading()
        interactor?.fetchApodData()
    }
    
    func didTapRefresh() {
        view?.showLoading()
        interactor?.fetchApodData()
    }
    
    // MARK: - HomeInteractorOutput
    func didRetrieveApodSuccess(_ entity: ApodEntity) {
        DispatchQueue.main.async { [weak self] in
            self?.view?.hideLoading()
            self?.view?.showData(entity)
        }
    }
    
    func didRetrieveApodError(_ error: Error) {
        DispatchQueue.main.async { [weak self] in
            self?.view?.hideLoading()
            self?.view?.showError(error.localizedDescription)
        }
    }
}
