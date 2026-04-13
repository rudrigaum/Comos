//
//  HomePresenter.swift
//  Comos
//
//  Created by Rodrigo Cerqueira Reis on 17/12/25.
//

import Foundation
import UIKit

class HomePresenter: HomeViewOutput, HomeInteractorOutput {

    // MARK: - Properties
    weak var view: HomeViewInput?
    var interactor: HomeInteractorInput?
    var router: HomeRouterInput?
    private var currentEntity: ApodEntity?

    // MARK: - HomeViewOutput
    func viewDidLoad() {
        view?.showLoading()
        interactor?.fetchApodData()
    }

    func didTapRefresh() {
        view?.showLoading()
        interactor?.fetchApodData()
    }

    func didTapImage(with currentImage: UIImage?) {
        guard let entity = currentEntity else { return }
        router?.routeToDetail(with: entity, image: currentImage)
    }

    // MARK: - HomeInteractorOutput
    func didRetrieveApodSuccess(_ entity: ApodEntity) {
        self.currentEntity = entity

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
