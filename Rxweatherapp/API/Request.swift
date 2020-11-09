//
//  Request.swift
//  Rxweatherapp
//
//  Created by 舘佳紀 on 2020/06/21.
//  Copyright © 2020 yoshiki Tachi. All rights reserved.
//

import Alamofire

protocol Request {
    var endpoint: URLConvertible { get }
    var parameters: Alamofire.Parameters { get }
    var encoding: ParameterEncoding { get }
}
