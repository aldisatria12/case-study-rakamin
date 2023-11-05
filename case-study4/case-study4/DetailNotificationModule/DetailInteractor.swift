//
//  HomepageInteractor.swift
//  case-study3
//
//  Created by Aldi Mahotma on 05/11/23.
//

import Foundation

protocol DetailInteractorProtocol {
    var presenter: DetailPresenterProtocol? {get set}
    
    func getTransactionData()
}

class DetailInteractor: DetailInteractorProtocol {
    var presenter: DetailPresenterProtocol?
    
    func getTransactionData() {
//        guard let transaction: [Transaction] = Bundle.main.decode(file: "staticData.json") else {
//            self.presenter?.interactorWithData(result: .failure(fatalError("Error decoding file")))
//            return
//        }
//        
//        self.presenter?.interactorWithData(result: .success(transaction))
    }
}
