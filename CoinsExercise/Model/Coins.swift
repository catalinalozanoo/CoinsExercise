//
//  Coins.swift
//  CoinsExercise
//
//  Created by catalina lozano on 04/07/24.
//

import Foundation


struct Coins: Decodable {
    let data: [DataCoin]
}

struct DataCoin: Decodable, Hashable {
    let name: String
    let supply : String
    let priceUsd: String
    let changePercent24Hr: String
}

extension DataCoin {
    static let example = DataCoin(name: "Ethereum", supply: "120195136.3430213600000000", priceUsd: "3124.3288620715388563", changePercent24Hr: "-5.4913104362823332")
}

/*
 // var id: Int32
  let employee_name: String
  //let employee_salary: Int32
 */
