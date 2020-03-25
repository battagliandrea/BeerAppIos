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

class HomeVC: UIViewController {
    
    @IBOutlet weak var beerTableVCView: UIView!
    
    private lazy var beersViewController: BeersTableViewVC = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        var viewController = storyboard.instantiateViewController(withIdentifier: "BeersTableViewVC") as! BeersTableViewVC
        self.add(asChildViewController: viewController, to: beerTableVCView)
        
        return viewController
    }()
    
    var beerListViewModel = BeersTableVM()
        
    var beers: [BeerEntity] = [BeerEntity]()
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Punk Api"
        
        beerListViewModel
            .beersChannel
            .observeOn(MainScheduler.instance)
            .bind(to: beersViewController.beers)
            .disposed(by: disposeBag)
        
        beerListViewModel.requestData()
    }
}

