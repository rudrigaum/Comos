//
//  DetailPresenter.swift
//  Comos
//
//  Created by Rodrigo Cerqueira Reis on 26/01/26.
//

import Foundation
import UIKit

class DetailPresenter: DetailViewOutput {
    
    // MARK: - VIPER Properties
    weak var view: DetailViewInput?
    var interactor: DetailInteractorInput?
    var router: DetailRouterInput?
    
    // MARK: - Data
    var entity: ApodEntity?
    var image: UIImage?
    
    // MARK: - DetailViewOutput
    func viewDidLoad() {
        guard let entity = entity else { return }
        
        view?.displayTitle(entity.title)
        view?.displayDate(entity.date)
        view?.displayExplanation(entity.explanation)
        view?.displayImage(image)
    }
}
