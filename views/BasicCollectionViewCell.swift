//
//  BasicCollectionViewCell.swift
//  TabelPlusCollection
//
//  Created by Alif on 28/1/20.
//  Copyright © 2020 Alif. All rights reserved.
//

import UIKit

class BasicCollectionViewCell: UICollectionViewCell {

    let identifier = String(describing: BasicCollectionViewCell.self)

    @IBOutlet weak var img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
