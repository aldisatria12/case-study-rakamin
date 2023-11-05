//
//  HomepageView.swift
//  case-study3
//
//  Created by Aldi Mahotma on 05/11/23.
//

import Foundation
import UIKit

protocol HomepageViewProtocol {
    var presenter: HomepagePresenterProtocol? {get set}
    
    func update(with transaction:[ChartData])
    func update(with error:String)
}

class HomepageViewController: UIViewController, HomepageViewProtocol, UITableViewDelegate, UITableViewDataSource {
    
    private let tableView: UITableView = UITableView()
    private let messageLabel: UILabel = UILabel()
    
    var presenter: HomepagePresenterProtocol?
    var transaction: [ChartData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        style()
        layout()
        presenter?.viewDidLoad()
    }
    
    func update(with transaction: [ChartData]) {
        DispatchQueue.main.async { [weak self] in
            self?.transaction = transaction
            self?.messageLabel.isHidden = true
            self?.tableView.reloadData()
            self?.tableView.isHidden = false
        }
    }
    
    func update(with error: String) {
        DispatchQueue.main.async { [weak self] in
            self?.transaction = []
            self?.tableView.isHidden = true
            
            self?.messageLabel.isHidden = false
            self?.messageLabel.text = error
        }
    }
}

extension HomepageViewController {
    func style() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.isHidden = true
        tableView.delegate = self
        tableView.dataSource = self
        
        
//        messageLabel.translatesAutoresizingMaskIntoConstraints = false
//        messageLabel.isHidden = false
//        messageLabel.text = "Loading..."
//        messageLabel.font = UIFont.systemFont(ofSize: 20)
//        messageLabel.textColor = .black
//        messageLabel.textAlignment = .center
    }
    
    func layout() {
        view.addSubview(tableView)
        view.addSubview(messageLabel)
        
        // tableView
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        
        
        // messageLabel
        NSLayoutConstraint.activate([
            messageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            messageLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
    }
}

extension HomepageViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transaction.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        var content = cell.defaultContentConfiguration()
        content.text = transaction[indexPath.row].type
        cell.contentConfiguration = content
        return cell
    }
}
