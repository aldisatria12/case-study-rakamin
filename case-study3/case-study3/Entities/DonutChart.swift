//
//  DonutChart.swift
//  case-study3
//
//  Created by Aldi Mahotma on 05/11/23.
//

import Foundation

struct DonutChart: Codable {
    let label, percentage: String
    let data: [Transaction]
}
