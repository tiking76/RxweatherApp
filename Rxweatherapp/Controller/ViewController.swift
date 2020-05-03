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
    private let disposedBeg = DisposeBag()
    var client = NetworkingClient()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tokyoButton.rx.tap
            .subscribe(onNext: {
                location = LocationData.tokyo.rawValue
                self.client.getAddress()
                self.weatherView.image = UIImage(named: "Sun")
                self.view.addSubview(self.weatherView)
            })
            .disposed(by: disposedBeg)
        osakaButton.rx.tap
            .subscribe(onNext : {
                location = LocationData.osaka.rawValue
                self.client.getAddress()
                self.weatherView.image = UIImage(named: "Rain")
                self.view.addSubview(self.weatherView)
            })
            .disposed(by: disposedBeg)
        kyotoButton.rx.tap
            .subscribe(onNext : {
                location = LocationData.kyoto.rawValue
                self.client.getAddress()
                self.weatherView.image = UIImage(named: "Clouds")
                self.view.addSubview(self.weatherView)
            })
            .disposed(by: disposedBeg)
        fukushimaButton.rx.tap
            .subscribe(onNext :{
                location = LocationData.fukushima.rawValue
                self.client.getAddress()
                self.weatherView.image = UIImage(named: "Snow")
                self.view.addSubview(self.weatherView)
            })
            .disposed(by: disposedBeg)
        }

}
