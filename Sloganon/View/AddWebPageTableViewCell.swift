//
//  AddWebPageTableViewCell.swift
//  Sloganon
//
//  Created by Sylvia Wake-Hood on 2/14/23.
//

import UIKit

class AddWebPageTableViewCell: UITableViewCell {

    @IBOutlet weak var webPageNameTextField: UITextField!
    @IBOutlet weak var urlTextField: UITextField!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        webPageNameTextField.font = UIFont.systemFont(ofSize: 25.0)
        urlTextField.font = UIFont.systemFont(ofSize: 25.0)
        
        webPageNameTextField.tintColor = K.webInputCursorColor
        urlTextField.tintColor = K.webInputCursorColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
