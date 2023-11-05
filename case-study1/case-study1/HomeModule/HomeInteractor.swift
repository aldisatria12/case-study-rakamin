//
//  HomeInteractor.swift
//  case-study3
//
//  Created by Aldi Mahotma on 05/11/23.
//

import Foundation

protocol HomeInteractorProtocol {
    var presenter: HomePresenterProtocol? {get set}
}

class HomeInteractor: HomeInteractorProtocol {
    var presenter: HomePresenterProtocol?
}
