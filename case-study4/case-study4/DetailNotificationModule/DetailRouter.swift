//
//  HomepageRouter.swift
//  case-study3
//
//  Created by Aldi Mahotma on 05/11/23.
//

import Foundation

protocol DetailRouterProtocol {
    var entry: DetailViewController? {get}
    static func startExecution() -> DetailRouterProtocol
    
//    func gotoDetailView(transaction: [TransactionDetail])
}

class DetailRouter: DetailRouterProtocol {
    var entry: DetailViewController?
    
    static func startExecution() -> DetailRouterProtocol {
        let router = DetailRouter()
        let view = DetailViewController()
        let presenter = DetailPresenter()
        let interactor = DetailInteractor()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        router.entry = view
        
        return router
    }
    
//    func gotoDetailView(transaction: [TransactionDetail]) {
//        let detailRouter = DetailRouter.createTransactionDetail(with: transaction)
//        guard let detailView = detailRouter.entry else { return }
//        guard let viewController = self.entry else { return }
//        
//        viewController.navigationController?.pushViewController(detailView, animated: true)
//    }
}
