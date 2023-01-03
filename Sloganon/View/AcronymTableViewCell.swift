//
//  AcronymTableViewCell.swift
//  Sloganon
//
//  Created by Sylvia Wake-Hood on 1/2/23.
//

import UIKit

class AcronymTableViewCell: UITableViewCell {
    @IBOutlet weak var acronymTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
