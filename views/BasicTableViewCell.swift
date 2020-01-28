//
//  BasicTableViewCell.swift
//  TabelPlusCollection
//
//  Created by Alif on 28/1/20.
//  Copyright © 2020 Alif. All rights reserved.
//

import UIKit

class BasicTableViewCell: UITableViewCell {

    let identifier = String(describing: BasicTableViewCell.self)

    @IBOutlet weak var titleLabrl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
