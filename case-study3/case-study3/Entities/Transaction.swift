//
//  Transaction.swift
//  case-study3
//
//  Created by Aldi Mahotma on 05/11/23.
//

import Foundation

struct Transaction: Codable {
    let label: String
    let percentage: String
    let data: [TransactionDetail]
}

extension Bundle {
    func decode<T: Decodable>(file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("File could not be found.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Fail to load the file")
        }
        
        let decoder = JSONDecoder()
        
        guard let loadedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Error decoding the file")
        }
        
        return loadedData
    }
}
