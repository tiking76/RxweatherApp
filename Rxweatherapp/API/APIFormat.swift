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

class NetworkingClient : WeatherModel{
    var weatherIcon : String = ""
    var detailData : Main?
    //completionで非同期処理をしている
    func getAddress(_ location : String, complecation: @escaping (DataFormat) -> Void ) {
        let url = "\(baseURL)\(location),jp&units=metric&APPID=\(myAPIKey)"
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
                        complecation(weatherResult)
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