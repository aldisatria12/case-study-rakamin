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
}
