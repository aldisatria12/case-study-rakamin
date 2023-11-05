//
//  HomeInteractor.swift
//  testing-promo
//
//  Created by Aldi Mahotma on 04/11/23.
//

import Foundation

protocol DetailInteractorProtocol {
    var presenter: DetailPresenterProtocol? {get set}
    var apiDetail: PublicAPI? {get set}
    
    func getPromoListData()
}

class DetailInteractor: DetailInteractorProtocol {
    var presenter: DetailPresenterProtocol?
    
    var apiDetail: PublicAPI?
    
    func getPromoListData() {
        presenter?.interactorUpdateData(apiDetail: apiDetail)
    }
}
