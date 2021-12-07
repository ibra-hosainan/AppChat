//
//  scraneOneUITableViewCell.swift
//  ChatApp
//
//  Created by Abrahim MOHAMMED on 07/12/2021.
//

import UIKit

class scraneOneUITableViewCell: UITableViewCell {

    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var imagePerson: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
