//
//  HomeInteractor.swift
//  testing-promo
//
//  Created by Aldi Mahotma on 04/11/23.
//

import Foundation

protocol HomeInteractorProtocol {
    var presenter: HomePresenterProtocol? {get set}
    
    func getPromoListData()
}

class HomeInteractor: HomeInteractorProtocol {
    var presenter: HomePresenterProtocol?
    
    func getPromoListData() {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            print(data)
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let apiList = try JSONDecoder().decode([PublicAPI].self, from: data)
                self.presenter?.interactorWithData(result: .success(apiList))
            } catch {
                print("Failed")
                return
            }
        }
        
        task.resume()
    }
}
