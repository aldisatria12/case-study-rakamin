//
//  HomepageInteractor.swift
//  case-study3
//
//  Created by Aldi Mahotma on 05/11/23.
//

import Foundation

protocol HomepageInteractorProtocol {
    var presenter: HomepagePresenterProtocol? {get set}
    
    func getTransactionData()
}

class HomepageInteractor: HomepageInteractorProtocol {
    var presenter: HomepagePresenterProtocol?
    
    func getTransactionData() {
//        guard let transaction: [Transaction] = Bundle.main.decode(file: "staticData.json") else {
//            self.presenter?.interactorWithData(result: .failure(fatalError("Error decoding file")))
//            return
//        }
//        
//        self.presenter?.interactorWithData(result: .success(transaction))
    }
}
