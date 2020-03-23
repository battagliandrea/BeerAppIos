//
//  BeerViewCell.swift
//  BeerApp
//
//  Created by Andrea on 22/03/2020.
//  Copyright © 2020 Andrea. All rights reserved.
//

import UIKit

class BeerViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriotionLabel: UILabel!
    @IBOutlet weak var imageBeer: UIImageView!
    
    
    public var cellBeer : BeerEntity! {
        didSet {
            self.titleLabel.text = cellBeer.name
            self.descriotionLabel.text = cellBeer.description
            
            let url = URL(string: cellBeer.imageUrl)
            self.imageBeer.load(url: url!)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
