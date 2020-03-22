//
//  BeerViewCell.swift
//  BeerApp
//
//  Created by Andrea on 22/03/2020.
//  Copyright © 2020 Andrea. All rights reserved.
//

import UIKit

class BeerViewCell: UITableViewCell {

    @IBOutlet weak var labelName: UILabel!
    
    public var cellBeer : BeerEntity! {
        didSet {
            self.labelName.text = "\(cellBeer.id).\(cellBeer.name)"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
