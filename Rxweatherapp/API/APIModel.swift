//
// Created by 舘佳紀 on 2020/05/29.
// Copyright (c) 2020 yoshiki Tachi. All rights reserved.
//

import Foundation

struct  DataFormat : Decodable{
    let weather : [Weather]
    let main : Main
}
struct Weather : Decodable {
    var id : Int
    var main : String
    var description : String
    var icon : String
}
struct Main : Decodable {
    var temp : Double
    var feelsLike : Double
    var tempMin : Double
    var tempMax : Double
    var pressure : Int
    var humidity : Int

    enum CodingKeys : String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case humidity
    }
}