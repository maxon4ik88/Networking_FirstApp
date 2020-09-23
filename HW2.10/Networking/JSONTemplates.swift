//
//  CbrExchangeRates.swift
//  HW2.10
//
//  Created by Maxon on 21.09.2020.
//  Copyright © 2020 Maxim Shvanov. All rights reserved.
//


struct Valute: Decodable {
    let Nominal: Int?
    let Name: String?
    let Value: Double?
    let Previous: Double?
}

struct CbrExchangeRates: Decodable {
    let Valute: [String : Valute]?
}

struct ShowIP: Decodable {
    let ip: String
}

struct RandomDog: Decodable {
    let url: String
}
