//
//  HomeInteractor.swift
//  Comos
//
//  Created by Rodrigo Cerqueira Reis on 17/12/25.
//

import Foundation
class HomeInteractor: HomeInteractorInput {
    
    // MARK: - Properties
    weak var presenter: HomeInteractorOutput?
    
    // MARK: - HomeInteractorInput
    func fetchApodData() {
        guard let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY") else {
            return
        }
        
        Task {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                
                let decoder = JSONDecoder()
                let entity = try decoder.decode(ApodEntity.self, from: data)
                
                presenter?.didRetrieveApodSuccess(entity)
                
            } catch {
                presenter?.didRetrieveApodError(error)
            }
        }
    }
}
