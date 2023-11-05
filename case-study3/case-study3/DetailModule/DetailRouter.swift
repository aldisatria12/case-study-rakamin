//
//  DetailRouter.swift
//  case-study3
//
//  Created by Aldi Mahotma on 05/11/23.
//

import Foundation

protocol DetailRouterProtocol {
    var entry: DetailViewController? {get}
    static func createTransactionDetail(with transaction: [TransactionDetail]) -> DetailRouterProtocol
}

class DetailRouter: DetailRouterProtocol {
    var entry: DetailViewController?
    
    static func createTransactionDetail(with transaction: [TransactionDetail]) -> DetailRouterProtocol {
        let router = DetailRouter()
        let view = DetailViewController()
        let presenter = DetailPresenter()
        let interactor = DetailInteractor()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        interactor.transaction = transaction
        
        router.entry = view
        
        return router
    }
}
