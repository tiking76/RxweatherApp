//
//  APIFormat.swift
//  Rxweatherapp
//
//  Created by 舘佳紀 on 2020/03/14.
//  Copyright © 2020 yoshiki Tachi. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire
import RxAlamofire

let baseURL : String = "http://api.openweathermap.org/data/2.5/weather?q="
var location : String!
let myAPIKey : String = "c99c1251da79265a3fea7735ae927232"



struct  DataFormat : Codable{
    var statusCode : Int
    var weather : String
}

func httpRequest() {
    let url : String = baseURL + location + ",jp&units=metric&APPID=" + myAPIKey
    
    Alamofire.request(url,
                      method: .get,
                      encoding: JSONEncoding.default
        ).responseJSON { response in
            switch response.result {
            case .success:
                guard let data = response.data else { return }
                //guard let weather = try? JSONDecoder().decode(Weather.self, from: data) else { return }
                
            case .failure(let error):
                print(error)
                }
            }
    }

