//
//  DetailView.swift
//  case-study3
//
//  Created by Aldi Mahotma on 05/11/23.
//

import Foundation
import UIKit

protocol DetailViewProtocol {
    var presenter: DetailPresenterProtocol? {get set}
    
    func update(with transaction: [TransactionDetail])
    func update(with error:String)
}


class DetailViewController: UIViewController, DetailViewProtocol, UITableViewDataSource, UITableViewDelegate {
    private let tableView: UITableView = UITableView()
    
    var presenter: DetailPresenterProtocol?
    var transactionDetail: [TransactionDetail] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        presenter?.viewDidLoad()
    }
    
    func update(with transaction: [TransactionDetail]) {
            DispatchQueue.main.async { [weak self] in
                self?.transactionDetail = transaction
                self?.tableView.reloadData()
                self?.tableView.isHidden = false
            }
    }
    
    func update(with error: String) {
        DispatchQueue.main.async { [weak self] in
            self?.transactionDetail = []
            self?.tableView.isHidden = true
        }
    }
}

extension DetailViewController {
    func style() {
        view.backgroundColor = .white
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.isHidden = true
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func layout() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}

extension DetailViewController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactionDetail.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        var content = cell.defaultContentConfiguration()
        content.text = "\(transactionDetail[indexPath.row].nominal)"
        content.secondaryText = "Date: \(transactionDetail[indexPath.row].trxDate)"
        cell.contentConfiguration = content
        return cell
    }
}
