//
//  BeerListViewModel.swift
//  BeerApp
//
//  Created by Andrea on 22/03/2020.
//  Copyright © 2020 Andrea. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift
import Alamofire

class BeersTableVM {
    
    let beerListURL = "https://api.punkapi.com/v2/beers"
    
    public enum BeerListError {
        case serverMessage(String)
    }
    
    public let beersChannel : PublishSubject<[BeerEntity]> = PublishSubject()
    public let error : PublishSubject<BeerListError> = PublishSubject()
    
    private let disposable = DisposeBag()
    
    public func requestData(){
        AF.request(beerListURL).responseDecodable(of: [BeerData].self) { (response) in
            if let status = response.response?.statusCode {
                switch (status){
                case 200:
                    if let value = response.value {
                        self.beersChannel.onNext(value.mapTo())
                    }
                default:
                    self.error.onNext(.serverMessage("Check your Internet connection."))
                }
            }
        }
    }
}
