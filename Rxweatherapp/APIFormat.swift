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
    let weather : [Weather]
    struct Weather : Codable {
        var id : Int
        var main : String
        var description : String
        var icon : String
    }
}


class NetworkingClient {
    var weathericon : String = ""
    
    func getAddress() {
        let text = baseURL + location + ",jp&units=metric&APPID=" + myAPIKey
        let lowurl = text.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        //ここからデータ通信している
        Alamofire.request(lowurl, method: .get, parameters: nil, encoding: JSONEncoding.default)
            .responseJSON{ (response) in
                switch response.result {
                //成功時に実行する内容
                case .success:
                    //多分ここでJSONからオブジェクトに変換されている？
                    guard let data = response.data else { return }
                    print(data)
                    print(type(of: data.self))
                    let decoder = JSONDecoder()
                    //ここでデコードしている
                    guard let weatherResult = try? decoder.decode(DataFormat.self, from: data) else { return }
                    print(weatherResult.weather[0].main)
                    self.weathericon = weatherResult.weather[0].main
                //エラー処理
                case let .failure(error):
                    print(error)
                }
                
            }
    }
}



