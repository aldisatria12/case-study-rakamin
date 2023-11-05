//
//  DetailInteractor.swift
//  case-study3
//
//  Created by Aldi Mahotma on 05/11/23.
//

import Foundation

protocol DetailInteractorProtocol {
    var presenter: DetailPresenterProtocol? {get set}
    var transaction: [TransactionDetail]? {get set}
    
    func getTransactionData()
}

class DetailInteractor: DetailInteractorProtocol {
    var presenter: DetailPresenterProtocol?
    
    var transaction: [TransactionDetail]?
    
    func getTransactionData() {
        presenter?.interactorUpdateData(transaction: transaction)
    }
}
