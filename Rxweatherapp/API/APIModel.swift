//
// Created by 舘佳紀 on 2020/05/29.
// Copyright (c) 2020 yoshiki Tachi. All rights reserved.
//

import Foundation

protocol WeatherModel {
    var weatherIcon : String { get set  }
    var detailData : Main? { get set }
    func getAddress(_ location : String, complecation: @escaping (DataFormat) -> Void ) -> Void
}

extension WeatherModel {
    var  baseURL : String {
        return "http://api.openweathermap.org/data/2.5/weather?q="
    }

    var  myAPIKey : String {
        return "c99c1251da79265a3fea7735ae927232"
    }
}