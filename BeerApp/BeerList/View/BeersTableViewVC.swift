//
//  BeerTableViewVC.swift
//  BeerApp
//
//  Created by Andrea on 24/03/2020.
//  Copyright © 2020 Andrea. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa


class BeersTableViewVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private lazy var beerDetailsVC: BeerDetailsVC = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: "BeerDetailsVC") as! BeerDetailsVC
    }()
    
    public var beers = PublishSubject<[BeerEntity]>()
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBinding()
    }
    
    
    private func setupBinding(){
        
        tableView.register(UINib(nibName: "BeerViewCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")

        tableView.rx.modelSelected(BeerEntity.self)
              .bind { (item) in
                  self.beerDetailsVC.beer.onNext(item)
                  self.present(self.beerDetailsVC, animated: true, completion: nil)
              }
              .disposed(by: disposeBag)
        
        beers.bind(to: tableView.rx.items(cellIdentifier: "ReusableCell", cellType: BeerViewCell.self)) {  (row,item,cell) in
            cell.cellBeer = item
        }.disposed(by: disposeBag)
        

        

//        tableView.rx.willDisplayCell
//            .subscribe(onNext: ({ (cell,indexPath) in
//                cell.alpha = 0
//                let transform = CATransform3DTranslate(CATransform3DIdentity, -250, 0, 0)
//                cell.layer.transform = transform
//                UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
//                    cell.alpha = 1
//                    cell.layer.transform = CATransform3DIdentity
//                }, completion: nil)
//            })).disposed(by: disposeBag)
    }
}
