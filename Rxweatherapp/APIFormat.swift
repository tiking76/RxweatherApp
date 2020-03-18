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

let BaseURL : String = "http://api.openweathermap.org/data/2.5/weather?q="
var Location : String!
let MyAPIKey : String = "c99c1251da79265a3fea7735ae927232"



struct  DataFormat : Codable{
    var LocationName : String?
    var StatusCode : Int?
    var Weather : String?
    
    init() {
        LocationName = ""
        StatusCode = 200
        Weather = ""
    }
}

func httpRequest() {
    let url : String = BaseURL + Location + ",jp&units=metric&APPID=" + MyAPIKey
    let headers: HTTPHeaders = [
        "Contenttype": "application/json"
    ]
}
