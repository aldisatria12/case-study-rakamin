//
//  PaymentRouter.swift
//  case-study3
//
//  Created by Aldi Mahotma on 05/11/23.
//

import Foundation

protocol PaymentRouterProtocol {
    var entry: PaymentViewController? {get}
    static func startExecution(with transaction: TransactionHistory) -> PaymentRouterProtocol
    
//    func gotoDetailView(transaction: [TransactionDetail])
}

class PaymentRouter: PaymentRouterProtocol {
    var entry: PaymentViewController?
    
    static func startExecution(with transaction: TransactionHistory) -> PaymentRouterProtocol {
        let router = PaymentRouter()
        let view = PaymentViewController()
        let presenter = PaymentPresenter()
        let interactor = PaymentInteractor()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        presenter.updateData(transaction: transaction)
        
        interactor.presenter = presenter
        
        router.entry = view
        
        return router
    }
}
