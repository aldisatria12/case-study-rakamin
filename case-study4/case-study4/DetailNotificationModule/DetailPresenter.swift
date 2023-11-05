//
//  HomepagePresenter.swift
//  case-study3
//
//  Created by Aldi Mahotma on 05/11/23.
//

import Foundation

protocol DetailPresenterProtocol {
    var router: DetailRouterProtocol? {get set}
    var view: DetailViewProtocol? {get set}
    var interactor: DetailInteractorProtocol? {get set}
    
    func viewDidLoad()
//    func interactorWithData(result: Result<[Transaction], Error>)
//    func tapOnDetail(_ transaction: [TransactionDetail])
    
}

class DetailPresenter: DetailPresenterProtocol {
    var router: DetailRouterProtocol?
    
    var view: DetailViewProtocol?
    
    var interactor: DetailInteractorProtocol?
    
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
