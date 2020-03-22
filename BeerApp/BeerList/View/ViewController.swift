//
//  ViewController.swift
//  BeerApp
//
//  Created by Andrea on 21/03/2020.
//  Copyright © 2020 Andrea. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    var beerListViewModel = BeerListViewModel()
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        beerListViewModel
                   .beersChannel
                   .observeOn(MainScheduler.instance)
//                   .bind(to: albumsViewController.albums)
                    .subscribe(onNext: { (beerList) in
                        print(beerList)
                    })
                   .disposed(by: disposeBag)
        
        
        beerListViewModel.requestData()
    }
}

