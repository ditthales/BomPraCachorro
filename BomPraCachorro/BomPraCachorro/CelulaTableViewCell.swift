//
//  CelulaTableViewCell.swift
//  BomPraCachorro
//
//  Created by ditthales on 18/05/22.
//

import UIKit

class CelulaTableViewCell: UITableViewCell {

    @IBOutlet var label: UILabel!
    @IBOutlet var info: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
