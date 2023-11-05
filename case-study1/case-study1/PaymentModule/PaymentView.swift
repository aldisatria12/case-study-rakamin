//
//  PaymentView.swift
//  case-study3
//
//  Created by Aldi Mahotma on 05/11/23.
//

import Foundation
import UIKit

protocol PaymentViewProtocol {
    var presenter: PaymentPresenterProtocol? {get set}
    
    func update(with transaction: TransactionHistory)
}

class PaymentViewController: UIViewController, PaymentViewProtocol {
    func update(with transaction: TransactionHistory) {
        self.transaction = transaction
        bankLabel.text = self.transaction?.bank
        idLabel.text = self.transaction?.id
        merchantLabel.text = self.transaction?.merchant
        nominalLabel.text = "Rp. \(String(describing: self.transaction?.nominal))"
    }
    
    var presenter: PaymentPresenterProtocol?
    var transaction: TransactionHistory?
    
    var nominalLabel: UILabel = UILabel()
    var bankLabel: UILabel = UILabel()
    var merchantLabel: UILabel = UILabel()
    var idLabel: UILabel = UILabel()
    var successLabel: UILabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        presenter?.viewDidLoad()
    }
}

extension PaymentViewController {
    func style() {
        bankLabel.textColor = .black
        idLabel.textColor = .black
        merchantLabel.textColor = .black
        nominalLabel.textColor = .black
        successLabel.textColor = .black
        successLabel.text = "Transaction Success"
    }
    
    func layout() {
        bankLabel.frame = CGRect(x: 100, y: 300, width: 200, height: 40)
        idLabel.frame = CGRect(x: 100, y: 350, width: 200, height: 40)
        merchantLabel.frame = CGRect(x: 100, y: 400, width: 200, height: 40)
        nominalLabel.frame = CGRect(x: 100, y: 450, width: 200, height: 40)
        successLabel.frame = CGRect(x: 100, y: 500, width: 200, height: 40)
        view.addSubview(bankLabel)
        view.addSubview(idLabel)
        view.addSubview(merchantLabel)
        view.addSubview(nominalLabel)
        view.addSubview(successLabel)
    }
}
