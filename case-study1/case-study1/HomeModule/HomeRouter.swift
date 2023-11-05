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
}

class HomeRouter: HomeRouterProtocol {
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
