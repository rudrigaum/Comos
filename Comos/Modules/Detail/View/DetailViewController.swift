//
//  DetailViewController.swift
//  Comos
//
//  Created by Rodrigo Cerqueira Reis on 13/04/26.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {

    // MARK: - Properties
    var presenter: DetailViewOutput?
    var customView: DetailView? {
        return view as? DetailView
    }

    // MARK: - Lifecycle
    override func loadView() {
        view = DetailView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        presenter?.viewDidLoad()
    }
}

// MARK: - DetailViewInput (Protocol Implementation)
extension DetailViewController: DetailViewInput {

    func displayTitle(_ title: String) {
        customView?.titleLabel.text = title
    }

    func displayDate(_ date: String) {
        customView?.dateLabel.text = date
    }

    func displayExplanation(_ text: String) {
        customView?.explanationLabel.text = text
    }

    func displayImage(_ image: UIImage?) {
        customView?.imageView.image = image
    }
}
