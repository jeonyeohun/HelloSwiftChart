//
//  SeriesChart.swift
//  SwiftChartsEx
//
//  Created by USER on 2022/07/15.
//

import SwiftUI
import Charts

struct Series: Identifiable {
    let city: String
    let sales: [SalesSummary]

    var id: String { city }
}

let seriesData: [Series] = [
    .init(city: "Cupertino", sales: cupertinoData),
    .init(city: "San Francisco", sales: sfData)
]

struct SeriesChart: View {
    var body: some View {
        Chart(seriesData) { series in
            ForEach(series.sales) { element in
                LineMark(
                    x: .value("Day", element.weekday),
                    y: .value("Sales", element.sales)
                )
                .foregroundStyle(by: .value("City", series.city))
                .symbol(by: .value("City", series.city))
            }
        }
    }
}

struct SeriesChart_Previews: PreviewProvider {
    static var previews: some View {
        SeriesChart()
    }
}
