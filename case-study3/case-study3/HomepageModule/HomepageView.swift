//
//  HomepageView.swift
//  case-study3
//
//  Created by Aldi Mahotma on 05/11/23.
//

import Foundation
import UIKit
import Charts

protocol HomepageViewProtocol {
    var presenter: HomepagePresenterProtocol? {get set}
    
    func update(with transaction:[Transaction])
    func update(with error:String)
}

class HomepageViewController: UIViewController, HomepageViewProtocol, UITableViewDelegate, UITableViewDataSource, ChartViewDelegate {
    
    private let pieChartView: PieChartView = PieChartView()
    private let tableView: UITableView = UITableView()
    
    var presenter: HomepagePresenterProtocol?
    var transaction: [Transaction] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pieChartView.delegate = self
        style()
        layout()
        presenter?.viewDidLoad()
    }
    
    func update(with transaction: [Transaction]) {
        DispatchQueue.main.async { [weak self] in
            self?.transaction = transaction
            self?.tableView.reloadData()
            print(transaction)
            
            
            var entries = [PieChartDataEntry]()
            
            for x in 0 ... transaction.count - 1 {
                entries.append(PieChartDataEntry(value: Double(transaction[x].percentage) ?? 0, label: transaction[x].label, data: transaction[x].data))
            }
            
            let set = PieChartDataSet(entries: entries)
            set.colors = ChartColorTemplates.pastel()
            
            let data = PieChartData(dataSet: set)
            
            
            self?.pieChartView.data = data
                    
            self?.tableView.isHidden = false
        }
    }
    
    func update(with error: String) {
        DispatchQueue.main.async { [weak self] in
            self?.transaction = []
            self?.tableView.isHidden = true
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
    }
    
    func layout() {
        view.addSubview(tableView)
        tableView.frame = CGRect(x: 0, y: 128 + self.view.frame.size.width, width: self.view.frame.size.width, height: self.view.frame.size.width)
        
//        barchart
        view.addSubview(pieChartView)
        pieChartView.frame = CGRect(x: 0, y: 128, width: self.view.frame.size.width, height: self.view.frame.size.width)
    }
}

extension HomepageViewController {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.tapOnDetail(transaction[indexPath.row].data)
    }
}

extension HomepageViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transaction.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        var content = cell.defaultContentConfiguration()
        content.text = transaction[indexPath.row].label
        content.secondaryText = transaction[indexPath.row].percentage
        cell.contentConfiguration = content
        return cell
    }
}
