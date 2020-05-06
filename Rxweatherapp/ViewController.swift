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
            .subscribe(onNext: { [weak self] in
                self?.client.getAddress(LocationData.tokyo.rawValue)
                self?.weatherView.image = UIImage(named: self!.client.weathericon)
                self?.view.addSubview(self!.weatherView)
            })
            .disposed(by: disposedBeg)
        osakaButton.rx.tap
            .subscribe(onNext : { [weak self] in
                self?.client.getAddress(LocationData.osaka.rawValue)
                self?.weatherView.image = UIImage(named: self!.client.weathericon)
                self?.view.addSubview(self!.weatherView)
            })
            .disposed(by: disposedBeg)
        kyotoButton.rx.tap
            .subscribe(onNext : { [weak self] in
                self?.client.getAddress(LocationData.kyoto.rawValue)
                self?.weatherView.image = UIImage(named: self!.client.weathericon)
                self?.view.addSubview(self!.weatherView)
            })
            .disposed(by: disposedBeg)
        fukushimaButton.rx.tap
            .subscribe(onNext :{ [weak self] in
                self?.client.getAddress(LocationData.fukushima.rawValue)
                self?.weatherView.image = UIImage(named: self!.client.weathericon)
                self?.view.addSubview(self!.weatherView)
            })
            .disposed(by: disposedBeg)
        }

}
