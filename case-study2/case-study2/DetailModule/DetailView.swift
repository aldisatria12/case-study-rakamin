//
//  HomeView.swift
//  testing-promo
//
//  Created by Aldi Mahotma on 04/11/23.
//

import Foundation
import UIKit

protocol DetailViewProtocol {
    var presenter: DetailPresenterProtocol? {get set}
    
    func update(with apiDetail:PublicAPI)
    func update(with error:String)
}

class DetailViewController: UIViewController, DetailViewProtocol {
    
    private let stackView: UIStackView = UIStackView()
    private let nameLabel: UILabel = UILabel()
    private let usernameLabel: UILabel = UILabel()
    private let emailLabel: UILabel = UILabel()
    private let phoneLabel: UILabel = UILabel()
    private let websiteLabel: UILabel = UILabel()
    
    var presenter: DetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        presenter?.viewDidLoad()
    }
    
    func update(with apiDetail: PublicAPI) {
        nameLabel.textColor = .black
        nameLabel.text = "Name: \(apiDetail.name)"
        usernameLabel.textColor = .black
        usernameLabel.text = "Username: \(apiDetail.username)"
        emailLabel.textColor = .black
        emailLabel.text = "Email: \(apiDetail.email)"
        phoneLabel.textColor = .black
        phoneLabel.text = "Phone: \(apiDetail.phone)"
        websiteLabel.textColor = .black
        websiteLabel.text = "Website: \(apiDetail.website)"
    }
    
    func update(with error: String) {
        nameLabel.textColor = .black
        nameLabel.text = error
    }
}

extension DetailViewController {
    func style() {
        view.backgroundColor = .white
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "Dummy"
        nameLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        usernameLabel.text = "Dummy"
        usernameLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        
        phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneLabel.text = "Dummy"
        phoneLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        
        websiteLabel.translatesAutoresizingMaskIntoConstraints = false
        websiteLabel.text = "Dummy"
        websiteLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.text = "Dummy"
        emailLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        
    }
    
    func layout() {
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(usernameLabel)
        stackView.addArrangedSubview(emailLabel)
        stackView.addArrangedSubview(phoneLabel)
        stackView.addArrangedSubview(websiteLabel)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
}
