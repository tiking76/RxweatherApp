//
//  APIFormat.swift
//  Rxweatherapp
//
//  Created by 舘佳紀 on 2020/03/14.
//  Copyright © 2020 yoshiki Tachi. All rights reserved.
//

import Foundation
import Alamofire



let baseURL : String = "http://api.openweathermap.org/data/2.5/weather?q="
var location : String!
let myAPIKey : String = "c99c1251da79265a3fea7735ae927232"
//http://api.openweathermap.org/data/2.5/weather?q=tokyo,jp&units=metric&APPID=c99c1251da79265a3fea7735ae927232

struct  DataFormat : Codable{
    let coord : Coord
    let weather : [Weather]
    let base : String
    let main : Main
    let visibility : Int
    let wind : Wind
    let clouds : Clouds
    let sys : Sys
    let timezone : Int
    let id : Int
    let name : String
    let cod : Int
}


struct Coord : Codable {
    let lon : Int
    let lan : Int
}

struct Weather : Codable {
    let id : Int
    let main : String
    let description : String
    let icon : String
}

struct Main : Codable {
    let temp : Int
    let feels_like : Int
    let temp_min : Int
    let temp_max : Int
    let pressure : Int
    let humidity : Int
}

struct Wind : Codable {
    let speed : Int
    let deg : Int
}


struct Clouds : Codable {
    let all : Int
}

struct Sys : Codable {
    let type : Int
    let id : Int
    let country : String
    let sunrise : Int
    let sunset : Int
}




class NetworkingClient {
    
    
   func getAddress() {
        let text = baseURL + location + ",jp&units=metric&APPID=" + myAPIKey
        let lowurl = text.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        //ここからデータ通信している
        Alamofire.request(lowurl, method: .get, parameters: nil, encoding: JSONEncoding.default)
            .responseJSON { (response) in
                switch response.result {
                //成功時に実行する内容
                case .success:
                    //多分ここでJSONからオブジェクトに変換されている？
                    guard let data = response.data else { return }
                    print(data)
                    print(type(of: data.self))
                    let decoder = JSONDecoder()
                    print("hoge")
                    guard let weatherResult = try? decoder.decode(DataFormat.self, from: data) else { return }
                    print(weatherResult)
                    
                    
                    
                    
                    
                    
                    
                    
                    
                //エラー処理
                case let .failure(error):
                    print(error)
                }
        }
    }
}



