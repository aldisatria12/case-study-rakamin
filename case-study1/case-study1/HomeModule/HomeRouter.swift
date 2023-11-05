//
//  HomeRouter.swift
//  case-study3
//
//  Created by Aldi Mahotma on 05/11/23.
//

import Foundation

protocol HomeRouterProtocol {
    var entry: HomeViewController? {get}
    static func startExecution() -> HomeRouterProtocol
    
    func gotoPaymentView(transaction: TransactionHistory)
}

class HomeRouter: HomeRouterProtocol {
    func gotoPaymentView(transaction: TransactionHistory) {
        let detailRouter = PaymentRouter.startExecution(with: transaction)
            guard let detailView = detailRouter.entry else { return }
            guard let viewController = self.entry else { return }
            
            viewController.navigationController?.pushViewController(detailView, animated: true)
    }
    
    var entry: HomeViewController?
    
    static func startExecution() -> HomeRouterProtocol {
        let router = HomeRouter()
        let view = HomeViewController()
        let presenter = HomePresenter()
        let interactor = HomeInteractor()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        router.entry = view
        
        return router
    }
}
