//
//  ChartData.swift
//  case-study3
//
//  Created by Aldi Mahotma on 05/11/23.
//

import Foundation

struct ChartData: Codable {
    let type: String
    let data: ChartType
}

enum ChartType: Codable {
    case lineChart(LineChart)
    case donutChart([DonutChart])

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode([DonutChart].self) {
            self = .donutChart(x)
            return
        }
        if let x = try? container.decode(LineChart.self) {
            self = .lineChart(x)
            return
        }
        throw DecodingError.typeMismatch(ChartType.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong chart type"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .lineChart(let x):
            try container.encode(x)
        case .donutChart(let x):
            try container.encode(x)
        }
    }
}
