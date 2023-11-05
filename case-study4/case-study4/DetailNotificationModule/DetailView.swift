//
//  HomepageView.swift
//  case-study3
//
//  Created by Aldi Mahotma on 05/11/23.
//

import Foundation
import UIKit

protocol DetailViewProtocol {
    var presenter: DetailPresenterProtocol? {get set}
    
//    func update(with transaction:[Transaction])
//    func update(with error:String)
}

class DetailViewController: UIViewController, DetailViewProtocol {
    
    
    var presenter: DetailPresenterProtocol?
//    var transaction: [Transaction] = []
    var messageLabel: UILabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        presenter?.viewDidLoad()
    }
    
//    func update(with transaction: [Transaction]) {
//        DispatchQueue.main.async { [weak self] in
//            self?.transaction = transaction
//            self?.tableView.reloadData()
//            print(transaction)
//
//
//            var entries = [PieChartDataEntry]()
//
//            for x in 0 ... transaction.count - 1 {
//                entries.append(PieChartDataEntry(value: Double(transaction[x].percentage) ?? 0, label: transaction[x].label, data: transaction[x].data))
//            }
//
//            let set = PieChartDataSet(entries: entries)
//            set.colors = ChartColorTemplates.pastel()
//
//            let data = PieChartData(dataSet: set)
//
//
//            self?.pieChartView.data = data
//
//            self?.tableView.isHidden = false
//        }
//    }
//
//    func update(with error: String) {
//        DispatchQueue.main.async { [weak self] in
//            self?.transaction = []
//            self?.tableView.isHidden = true
//        }
//    }
}

extension DetailViewController {
    func style() {
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.isHidden = false
        messageLabel.text = "Loading..."
        messageLabel.font = UIFont.systemFont(ofSize: 20)
        messageLabel.textColor = .black
        messageLabel.textAlignment = .center
    }
    
    func layout() {
        view.addSubview(messageLabel)
        
        NSLayoutConstraint.activate([
            messageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            messageLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
//        view.addSubview(tableView)
//        tableView.frame = CGRect(x: 0, y: 128 + self.view.frame.size.width, width: self.view.frame.size.width, height: self.view.frame.size.width)
    }
}
