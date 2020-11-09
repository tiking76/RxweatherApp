//
//  ViewController.swift
//  Rxweatherapp
//
//  Created by 舘佳紀 on 2020/03/14.
//  Copyright © 2020 yoshiki Tachi. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var tokyoButton: UIButton!
    @IBOutlet weak var osakaButton: UIButton!
    @IBOutlet weak var kyotoButton: UIButton!
    @IBOutlet weak var fukushimaButton: UIButton!
    @IBOutlet weak var weatherView: UIImageView!
    @IBOutlet weak var senderDetail: UIButton!
    
    private let disposedBeg = DisposeBag()
    var client = NetworkingClient()
    var weatherData : Array<String> = []
    var indicatorBackgroundView: UIView!
    var indicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()


        tokyoButton.rx.tap
                .subscribe(onNext: { [weak self] in
                    guard let self = self else { return }
                    self.client.getAddress(LocationData.tokyo.rawValue)
                    { format in
                        self.weatherView.image = UIImage(named: format.weather[0].main)
                        print(format.weather[0].main)
                        DispatchQueue.main.async {
                            self.weatherView.image = UIImage(named: "Rain")
                        }
                    }
                    //self.weatherView.image = UIImage(named: "Rain")
                    //print(self.weatherView.image ?? "hoge")
                    self.view.addSubview(self.weatherView)
                })
                .disposed(by: disposedBeg)

        osakaButton.rx.tap
                .subscribe(onNext : { [weak self] in
                    guard let self = self else { return }
                    self.client.getAddress(LocationData.osaka.rawValue)
                    { format in
                        self.weatherView.image = UIImage(named: format.weather[0].icon)
                    }
                    self.weatherView.image = UIImage(named: self.client.weatherIcon)
                    self.view.addSubview(self.weatherView)
                })
                .disposed(by: disposedBeg)

        kyotoButton.rx.tap
                .subscribe(onNext : { [weak self] in
                    guard let self = self else { return }
                    self.client.getAddress(LocationData.kyoto.rawValue)
                    { format in
                        self.weatherView.image = UIImage(named: format.weather[0].icon)
                    }
                    self.view.addSubview(self.weatherView)
                })
                .disposed(by: disposedBeg)

        fukushimaButton.rx.tap
                .subscribe(onNext :{ [weak self] in
                    guard let self = self else { return }
                    self.client.getAddress(LocationData.fukushima.rawValue)
                    { format in
                        self.weatherView.image = UIImage(named: format.weather[0].icon)
                    }
                    self.view.addSubview(self.weatherView)
                })
                .disposed(by: disposedBeg)
    }
}
