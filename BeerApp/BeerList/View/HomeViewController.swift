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

class HomeViewController: UIViewController {
    
    @IBOutlet weak var beerTableView: UITableView!
    
    var beerListViewModel = BeerListViewModel()
        
    var beers: [BeerEntity] = [BeerEntity]()
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        beerTableView.dataSource = self
        
        beerTableView.register(UINib(nibName: "BeerViewCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
       
        beerListViewModel
            .beersChannel
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { (data) in
                self.beers = data
                self.beerTableView.reloadData()
            })
            .disposed(by: disposeBag)


        beerListViewModel.requestData()
    }
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! BeerViewCell
        
        cell.cellBeer = beers[indexPath.row]
        return cell
    }
}

