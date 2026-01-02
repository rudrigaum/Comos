//
//  HomeViewController.swift
//  Comos
//
//  Created by Rodrigo Cerqueira Reis on 02/01/26.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    var presenter: HomeViewOutput?

    var customView: HomeView? {
        return view as? HomeView
    }
    
    // MARK: - Lifecycle
    override func loadView() {
        view = HomeView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Cosmos"
        view.backgroundColor = .systemBackground
        
        setupNavigation()
        presenter?.viewDidLoad()
    }
    
    // MARK: - Private Methods
    private func setupNavigation() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .refresh,
            target: self,
            action: #selector(didTapRefresh)
        )
    }
    
    @objc private func didTapRefresh() {
        presenter?.didTapRefresh()
    }
}

// MARK: - HomeViewInput (Protocol Implementation)
extension HomeViewController: HomeViewInput {
    
    func showLoading() {
        customView?.isLoading(true)
    }
    
    func hideLoading() {
        customView?.isLoading(false)
    }
    
    func showData(_ entity: ApodEntity) {
        customView?.titleLabel.text = entity.title
        customView?.dateLabel.text = entity.date
        customView?.descriptionLabel.text = entity.explanation
        
        if let url = URL(string: entity.url) {
            downloadImage(from: url)
        }
    }
    
    func showError(_ message: String) {
        let alert = UIAlertController(title: "Ops!", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

// MARK: - Image Helper (Temporary)
extension HomeViewController {
    private func downloadImage(from url: URL) {
        Task {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                guard let image = UIImage(data: data) else { return }
                
                await MainActor.run {
                    self.customView?.imageView.image = image
                }
            } catch {
                print("Failed to download image: \(error)")
            }
        }
    }
}
