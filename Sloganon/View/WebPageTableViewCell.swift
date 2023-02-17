//
//  CustomTableViewCell.swift
//  Sloganon
//
//  Created by Sylvia Wake-Hood on 2/15/23.
//

import UIKit

class WebPageTableViewCell: UITableViewCell {
    static let identifier = "CustomTableViewCell"
    
    //Create some tags to differentiate between textFields
    static let webPageTitleTag = 0
    static let urlTag = 1
    
    private let webPageNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Web Page Title"
        textField.text = ""
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 25.0)
        textField.backgroundColor = .white
        textField.tag = webPageTitleTag
        textField.tintColor = K.webInputCursorColor
        textField.keyboardType = .default
//        textField.layer.cornerRadius = 10
//        textField.layer.masksToBounds = true
        
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let urlTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "https://www.yourwebaddress.com"
        textField.text = ""
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 25.0)
        textField.backgroundColor = .white
        textField.tag = urlTag
        textField.tintColor = K.webInputCursorColor
        textField.keyboardType = .URL
//        textField.layer.cornerRadius = 10
//        textField.layer.masksToBounds = true
        
        textField.borderStyle = .roundedRect

        return textField
    }()
    
    //some public accessors to be able to get and set the title and URL
    var title: String{
        set { self.webPageNameTextField.text = newValue}
        get { return self.webPageNameTextField.text!}
    }
    var url: String {
        set { self.urlTextField.text = newValue}
        get { return urlTextField.text!}
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    

        contentView.addSubview(webPageNameTextField)
        contentView.addSubview(urlTextField)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let xPadding = 10.0
        let yPadding = 10.0
        let separator = 5.0
        let contentHeight = contentView.frame.size.height
        let contentWidth = contentView.frame.size.width
        
        let heightOfTextFields = (contentHeight - 2 * yPadding - separator) / 2
        
        webPageNameTextField.frame = CGRect(x: xPadding,
                                            y: yPadding,
                                            width: contentWidth - 2 * xPadding,
                                            height: heightOfTextFields)
        urlTextField.frame =  CGRect(x: xPadding,
                                     y: 2 * yPadding + heightOfTextFields,
                                     width: contentWidth - 2 * xPadding,
                                     height: heightOfTextFields)
    }
}
