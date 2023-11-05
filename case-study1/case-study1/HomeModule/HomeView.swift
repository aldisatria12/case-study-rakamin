//
//  HomeView.swift
//  case-study3
//
//  Created by Aldi Mahotma on 05/11/23.
//

import Foundation
import UIKit
import QRCodeScanner

protocol HomeViewProtocol {
    var presenter: HomePresenterProtocol? {get set}
}

class HomeViewController: UIViewController, HomeViewProtocol, QRCodeScanViewControllerDelegate {
    var presenter: HomePresenterProtocol?
    
    var saldoLabel: UILabel = UILabel()
    var scanButton: UIButton = UIButton(type: .system)
    var historyButton: UIButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saldoLabel.text = "Saldo: Rp. \(Saldo.saldo)"
        style()
        layout()
        presenter?.viewDidLoad()
    }
}

extension HomeViewController {
    func style() {
        scanButton.setTitle("Scan QR", for: .normal)
        scanButton.setTitleColor(.systemBlue, for: .normal)
        scanButton.addTarget(self, action: #selector(scanButtonTapped), for: .touchUpInside)
        historyButton.setTitle("Riwayat Transaksi", for: .normal)
        historyButton.setTitleColor(.systemBlue, for: .normal)
        saldoLabel.textColor = .black
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//        tableView.isHidden = true
//        tableView.delegate = self
//        tableView.dataSource = self
    }
    
    func layout() {
        saldoLabel.frame = CGRect(x: 100, y: 300, width: 200, height: 40)
        scanButton.frame = CGRect(x: 100, y: view.frame.height - 200, width: 200, height: 40)
        historyButton.frame = CGRect(x: 100, y: view.frame.height - 150, width: 200, height: 40)
        view.addSubview(scanButton)
        view.addSubview(saldoLabel)
        view.addSubview(historyButton)
//        view.addSubview(tableView)
//        tableView.frame = CGRect(x: 0, y: 128 + self.view.frame.size.width, width: self.view.frame.size.width, height: self.view.frame.size.width)
    }
    
    @objc func scanButtonTapped() {
        print("Button tapped!")
        scanQRCode()
    }
}

extension HomeViewController {
    /// Start the QR code scan
    func scanQRCode() {
        
        // Create an instance of QRCodeScanViewController
        let viewController = QRCodeScanViewController.create()
        
        // Set itself as delegate
        viewController.delegate = self
        
        // Present the view controller
        self.present(viewController, animated: true)
    }
    
    // MARK: QRCodeScanViewControllerDelegate
    
    /// Called when the camera scans a QR code
    /// - Parameters:
    ///   - viewController: View controller that scanned the QR code
    ///   - value: String encoded in the QR code
    func qrCodeScanViewController(_ viewController: QRCodeScanViewController, didScanQRCode value: String) {
        
        // Dismiss the view controller
        viewController.dismiss(animated: true) {
        
            // Show an alert with the scanned value
            let qrValue = value.split(separator: ".")
            let arrayValue = qrValue.map {
                String($0)
            }
            TransactionHistory.transaction.append(TransactionHistory(bank: arrayValue[0], id: arrayValue[1], merchant: arrayValue[2], nominal: Int(arrayValue[3]) ?? 0))
            self.presenter?.toPaymentPage(transaction: TransactionHistory(bank: arrayValue[0], id: arrayValue[1], merchant: arrayValue[2], nominal: Int(arrayValue[3]) ?? 0))
            print(arrayValue)
            let alert = UIAlertController(title: "Scanned value", message: "Transaction Success", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
}
