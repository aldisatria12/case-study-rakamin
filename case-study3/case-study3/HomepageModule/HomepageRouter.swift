//
//  HomepageRouter.swift
//  case-study3
//
//  Created by Aldi Mahotma on 05/11/23.
//

import Foundation

protocol HomepageRouterProtocol {
    var entry: HomepageViewController? {get}
    static func startExecution() -> HomepageRouterProtocol
    
    func gotoDetailView(transaction: [TransactionDetail])
}

class HomepageRouter: HomepageRouterProtocol {
    var entry: HomepageViewController?
    
    static func startExecution() -> HomepageRouterProtocol {
        let router = HomepageRouter()
        let view = HomepageViewController()
        let presenter = HomepagePresenter()
        let interactor = HomepageInteractor()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        router.entry = view
        
        return router
    }
    
    func gotoDetailView(transaction: [TransactionDetail]) {
        let detailRouter = DetailRouter.createTransactionDetail(with: transaction)
        guard let detailView = detailRouter.entry else { return }
        guard let viewController = self.entry else { return }
        
        viewController.navigationController?.pushViewController(detailView, animated: true)
    }
}
