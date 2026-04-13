//
//  DetailContract.swift
//  Comos
//
//  Created by Rodrigo Cerqueira Reis on 26/01/26.
//

import Foundation
import UIKit

// MARK: - View
protocol DetailViewInput: AnyObject {
    func displayTitle(_ title: String)
    func displayDate(_ date: String)
    func displayExplanation(_ text: String)
    func displayImage(_ image: UIImage?)
}

// MARK: - Presenter
protocol DetailViewOutput: AnyObject {
    func viewDidLoad()
}

// MARK: - Interactor
protocol DetailInteractorInput: AnyObject {
}

// MARK: - Router
protocol DetailRouterInput: AnyObject {
}
