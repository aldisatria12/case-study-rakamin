//
//  PaymentInteractor.swift
//  case-study3
//
//  Created by Aldi Mahotma on 05/11/23.
//

import Foundation

protocol PaymentInteractorProtocol {
    var presenter: PaymentPresenterProtocol? {get set}
}

class PaymentInteractor: PaymentInteractorProtocol {
    var presenter: PaymentPresenterProtocol?
}
