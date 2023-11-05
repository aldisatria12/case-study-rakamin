//
//  HomeView.swift
//  testing-promo
//
//  Created by Aldi Mahotma on 04/11/23.
//

import Foundation
import UIKit

protocol DetailViewProtocol {
    var presenter: DetailPresenterProtocol? {get set}
    
    func update(with apiDetail:PublicAPI)
    func update(with error:String)
}

class DetailViewController: UIViewController, DetailViewProtocol {
    
    private let titleLabel: UILabel = UILabel()
    
    var presenter: DetailPresenterProtocol?
    
    func update(with apiDetail: PublicAPI) {
        titleLabel.textColor = .black
        titleLabel.text = apiDetail.title
    }
    
    func update(with error: String) {
        titleLabel.textColor = .black
        titleLabel.text = error
    }
}
