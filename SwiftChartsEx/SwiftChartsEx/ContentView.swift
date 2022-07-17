//
//  ContentView.swift
//  SwiftChartsEx
//
//  Created by USER on 2022/07/15.
//

import SwiftUI
import Charts

struct SalesSummary: Identifiable {
    let weekday: String
    let sales: Int

    var id: String { weekday }
}

let cupertinoData: [SalesSummary] = [
    .init(weekday: "2022-5-2", sales: 54),
    .init(weekday: "2022-5-3", sales: 42),
    .init(weekday: "2022-5-4", sales: 88),
    .init(weekday: "2022-5-5", sales: 49),
    .init(weekday: "2022-5-6", sales: 42),
    .init(weekday: "2022-5-7", sales: 126),
    .init(weekday: "2022-5-8", sales: 67),
]

let sfData: [SalesSummary] = [
    .init(weekday: "2022-5-2", sales: 81),
    .init(weekday: "2022-5-3", sales: 90),
    .init(weekday: "2022-5-4", sales: 52),
    .init(weekday: "2022-5-5", sales: 72),
    .init(weekday: "2022-5-6", sales: 84),
    .init(weekday: "2022-5-7", sales: 84),
    .init(weekday: "2022-5-8", sales: 137),
]

struct ContentView: View {
    @State var city: String = "Cupertino"

    var data: [SalesSummary] {
        switch city {
        case "Cupertino":
            return cupertinoData
        case "San Francisco":
            return sfData
        default:
            return cupertinoData
        }
    }
    var body: some View {
        VStack {
            Picker("City", selection: $city.animation(.easeOut)) {
                Text("Cupertino").tag("Cupertino")
                Text("San Francisco").tag("San Francisco")
            }
            .pickerStyle(.segmented)
            Chart(data) { element in
                BarMark(
                    x: .value("Weekday", element.weekday),
                    y: .value("Sales", element.sales)
                )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

