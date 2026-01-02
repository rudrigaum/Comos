//
//  HomeRouter.swift
//  Comos
//
//  Created by Rodrigo Cerqueira Reis on 02/01/26.
//

import Foundation
import UIKit

class HomeRouter: HomeRouterInput {
    
    // MARK: - Properties
    weak var viewController: UIViewController?
    
    // MARK: - Module Assembly
    static func createModule() -> UIViewController {
        let view = HomeViewController()
        let interactor = HomeInteractor()
        let presenter = HomePresenter()
        let router = HomeRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        router.viewController = view
        
        return view
    }
    
    // MARK: - HomeRouterInput
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        DispatchQueue.main.async { [weak self] in
            self?.viewController?.present(alert, animated: true)
        }
    }
}
