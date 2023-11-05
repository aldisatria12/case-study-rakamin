//
//  HistoryInteractor.swift
//  case-study3
//
//  Created by Aldi Mahotma on 05/11/23.
//

import Foundation

protocol HistoryInteractorProtocol {
    var presenter: HistoryPresenterProtocol? {get set}
    
    func getTransactionData()
}

class HistoryInteractor: HistoryInteractorProtocol {
    var presenter: HistoryPresenterProtocol?
    
    func getTransactionData() {
        
    }
}
