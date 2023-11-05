//
//  HomeView.swift
//  case-study3
//
//  Created by Aldi Mahotma on 05/11/23.
//

import Foundation
import UIKit

protocol HomeViewProtocol {
    var presenter: HomePresenterProtocol? {get set}
}

class HomeViewController: UIViewController, HomeViewProtocol {
    var presenter: HomePresenterProtocol?
    
    var saldoLabel: UILabel = UILabel()
    var scanButton: UIButton = UIButton()
    var historyButton: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        presenter?.viewDidLoad()
    }
}

extension HomeViewController {
    func style() {
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//        tableView.isHidden = true
//        tableView.delegate = self
//        tableView.dataSource = self
    }
    
    func layout() {
//        view.addSubview(tableView)
//        tableView.frame = CGRect(x: 0, y: 128 + self.view.frame.size.width, width: self.view.frame.size.width, height: self.view.frame.size.width)
    }
}
