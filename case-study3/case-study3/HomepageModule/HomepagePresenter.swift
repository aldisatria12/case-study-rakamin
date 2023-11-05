//
//  HomepagePresenter.swift
//  case-study3
//
//  Created by Aldi Mahotma on 05/11/23.
//

import Foundation

protocol HomepagePresenterProtocol {
    var router: HomepageRouterProtocol? {get set}
    var view: HomepageViewProtocol? {get set}
    var interactor: HomepageInteractorProtocol? {get set}
    
    func viewDidLoad()
    func interactorWithData(result: Result<[Transaction], Error>)
    func tapOnDetail(_ transaction: [TransactionDetail])
    
}

class HomepagePresenter: HomepagePresenterProtocol {
    var router: HomepageRouterProtocol?
    
    var view: HomepageViewProtocol?
    
    var interactor: HomepageInteractorProtocol?
    
    func viewDidLoad() {
        interactor?.getTransactionData()
    }
    
    func interactorWithData(result: Result<[Transaction], Error>) {
        switch result {
        case .success(let transaction):
            view?.update(with: transaction)
        case . failure(let error):
            print(error)
            view?.update(with: "Try again later")
        }
    }
    
    func tapOnDetail(_ transaction: [TransactionDetail]) {
        router?.gotoDetailView(transaction: transaction)
    }
}
