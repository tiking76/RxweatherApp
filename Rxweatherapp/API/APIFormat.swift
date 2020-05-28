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

class NetworkingClient {
    private let baseURL : String = "http://api.openweathermap.org/data/2.5/weather?q="
    private let myAPIKey : String = "c99c1251da79265a3fea7735ae927232"
    private(set) var weathericon : String = ""
    private(set) var detailData : Main?
    //completionで非同期処理をしている
    func getAddress(_ loocation : String) {
        let url = "\(baseURL)\(loocation),jp&units=metric&APPID=\(myAPIKey)"
        //ここからデータ通信している
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default)
            .responseJSON{ (response) in
                switch response.result {
                //成功時に実行する内容
                case .success:
                    guard let data = response.data else { return }
                    let decoder = JSONDecoder()
                    //ここでデコードしている
                    guard let weatherResult = try? decoder.decode(DataFormat.self, from: data) else { return }
                    self.weathericon = weatherResult.weather[0].main
                    self.detailData = weatherResult.main
                //エラー処理
                case let .failure(error):
                    print(error)
                }
                
            }
    }
    /*こっちでは、RxSwiftを用いてやっている
    func getAddress(_ location : String) -> Observable<Void> {
        getAddress(location, completion : {})
        return Observable.create {(observer) -> Disposable in
            getAddress(location, completion : {},
                observer.onNext(())
            )
            
            return Disposables.create()
        }
        
    }*/
}

