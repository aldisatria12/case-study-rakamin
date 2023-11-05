//
//  HistoryPresenter.swift
//  case-study3
//
//  Created by Aldi Mahotma on 05/11/23.
//

import Foundation

protocol HistoryPresenterProtocol {
    var router: HistoryRouterProtocol? {get set}
    var view: HistoryViewProtocol? {get set}
    var interactor: HistoryInteractorProtocol? {get set}
    
    func viewDidLoad()
//    func interactorWithData(result: Result<[Transaction], Error>)
//    func tapOnDetail(_ transaction: [TransactionDetail])
    
}

class HistoryPresenter: HistoryPresenterProtocol {
    var router: HistoryRouterProtocol?
    
    var view: HistoryViewProtocol?
    
    var interactor: HistoryInteractorProtocol?
    
    func viewDidLoad() {
        interactor?.getTransactionData()
    }
    
//    func interactorWithData(result: Result<[Transaction], Error>) {
//        switch result {
//        case .success(let transaction):
//            view?.update(with: transaction)
//        case . failure(let error):
//            print(error)
//            view?.update(with: "Try again later")
//        }
//    }
//    
//    func tapOnDetail(_ transaction: [TransactionDetail]) {
//        router?.gotoDetailView(transaction: transaction)
//    }
}
