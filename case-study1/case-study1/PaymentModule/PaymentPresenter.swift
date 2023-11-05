//
//  PaymentPresenter.swift
//  case-study3
//
//  Created by Aldi Mahotma on 05/11/23.
//

import Foundation

protocol PaymentPresenterProtocol {
    var router: PaymentRouterProtocol? {get set}
    var view: PaymentViewProtocol? {get set}
    var interactor: PaymentInteractorProtocol? {get set}
    
    func updateData(transaction: TransactionHistory)
    
    func viewDidLoad()
}

class PaymentPresenter: PaymentPresenterProtocol {
    func viewDidLoad() {
        
    }
    
    func updateData(transaction: TransactionHistory) {
        view?.update(with: transaction)
    }
    
    var router: PaymentRouterProtocol?
    
    var view: PaymentViewProtocol?
    
    var interactor: PaymentInteractorProtocol?
    
    
}
