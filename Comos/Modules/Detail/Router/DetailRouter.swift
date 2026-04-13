//
//  DetailRouter.swift
//  Comos
//
//  Created by Rodrigo Cerqueira Reis on 13/04/26.
//

import Foundation
import UIKit

class DetailRouter: DetailRouterInput {

    // MARK: - Properties
    weak var viewController: UIViewController?

    // MARK: - Module Assembly

    static func createModule(with entity: ApodEntity, image: UIImage?) -> UIViewController {
        let view = DetailViewController()
        let interactor = DetailInteractor()
        let presenter = DetailPresenter()
        let router = DetailRouter()

        presenter.entity = entity
        presenter.image = image

        view.presenter = presenter

        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router

        router.viewController = view

        return view
    }
}
