//
//  HomePresenter.swift
//  case-study3
//
//  Created by Aldi Mahotma on 05/11/23.
//

import Foundation

protocol HomePresenterProtocol {
    var router: HomeRouterProtocol? {get set}
    var view: HomeViewProtocol? {get set}
    var interactor: HomeInteractorProtocol? {get set}
    
    func viewDidLoad()
    
    func toPaymentPage(transaction: TransactionHistory)
}

class HomePresenter: HomePresenterProtocol {
    func toPaymentPage(transaction: TransactionHistory) {
        router?.gotoPaymentView(transaction: transaction)
    }
    
    var router: HomeRouterProtocol?
    
    var view: HomeViewProtocol?
    
    var interactor: HomeInteractorProtocol?
    
    func viewDidLoad() {
        
    }
}
