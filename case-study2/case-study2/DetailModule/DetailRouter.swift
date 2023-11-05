//
//  HomeRouter.swift
//  testing-promo
//
//  Created by Aldi Mahotma on 04/11/23.
//

import Foundation

protocol DetailRouterProtocol {
    var entry: DetailViewController? {get}
    static func createDetail(with apiDetail: PublicAPI) -> DetailRouterProtocol
}

class DetailRouter: DetailRouterProtocol {
    var entry: DetailViewController?
    
    static func createDetail(with apiDetail: PublicAPI) -> DetailRouterProtocol {
        let router = DetailRouter()
        let view = DetailViewController()
        let presenter = DetailPresenter()
        let interactor = DetailInteractor()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        interactor.apiDetail = apiDetail
        
        router.entry = view
        
        return router
    }
}
