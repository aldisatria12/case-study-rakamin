//
//  DonutChart.swift
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
