//
//  BeerDetailsViewVC.swift
//  BeerApp
//
//  Created by Andrea on 25/03/2020.
//  Copyright © 2020 Andrea. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class BeerDetailsVC: UIViewController {
    
    @IBOutlet weak var imageBeer: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    
    public var beer = BehaviorSubject<BeerEntity?>(value: nil)
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        beer.subscribe(onNext: { (item) in
            self.labelName.text = item?.name
            self.labelDescription.text = item?.description
            let url = URL(string: item!.imageUrl)
            self.imageBeer.load(url: url!)
        }).disposed(by: disposeBag)
        
    }
    
}
