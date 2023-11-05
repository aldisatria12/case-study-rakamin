//
//  HomePresenter.swift
//  testing-promo
//
//  Created by Aldi Mahotma on 04/11/23.
//

import Foundation

protocol DetailPresenterProtocol {
    var router: DetailRouterProtocol? {get set}
    var view: DetailViewProtocol? {get set}
    var interactor: DetailInteractorProtocol? {get set}
    
    func viewDidLoad()
    func interactorUpdateData(apiDetail: PublicAPI?)
    
}

class DetailPresenter: DetailPresenterProtocol {
    var router: DetailRouterProtocol?
    
    var view: DetailViewProtocol?
    
    var interactor: DetailInteractorProtocol?
    
    func viewDidLoad() {
        interactor?.getPromoListData()
    }
    
    func interactorUpdateData(apiDetail: PublicAPI?) {
            if let apiDetail = apiDetail{
                view?.update(with: apiDetail)
            } else {
                view?.update(with: "No data")
            }
    }
}
