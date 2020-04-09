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
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tokyoButton.rx.tap
            .subscribe(onNext: {
                location = "tokyo"
                self.weatherView.image = UIImage(named: "Sun")
                self.view.addSubview(self.weatherView)
                print("hoge")
            })
            .disposed(by: disposedBeg)
        osakaButton.rx.tap.subscribe(onNext : {
            location = "osaka"
            self.weatherView.image = UIImage(named: "Rain")
            self.view.addSubview(self.weatherView)
            print("hoge")
        })
            .disposed(by: disposedBeg)
        }

}
