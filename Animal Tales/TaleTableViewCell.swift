//
//  TaleTableViewCell.swift
//  Animal Tales
//
//  Created by Anita Souv on 2/4/18.
//  Copyright © 2018 Elizabeth Crisologo. All rights reserved.
//

import UIKit

class TaleTableViewCell: UITableViewCell {

    
    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
