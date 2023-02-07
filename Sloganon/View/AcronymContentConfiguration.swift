//
//  AcronymContentConfiguration.swift
//  Sloganon
//
//  Created by Sylvia Wake-Hood on 1/10/23.
//

//import Foundation
//
//import UIKit
//
//
//struct AcronymContentConfiguration : UIContentConfiguration {
//    var text = ""
//    var percentageBy = 0.0
//    
//    func makeContentView() -> UIView & UIContentView {
//        return AcronymContentView(self)
//    }
//    func updated(for state: UIConfigurationState) -> AcronymContentConfiguration {
//        return self
//    }
//}
//
//class AcronymContentView : UIView, UIContentView {
//    var configuration: UIContentConfiguration {
//        didSet {
//            self.configure(configuration: configuration)
//        }
//    }
//    let textView = UITextView()
//    init(_ configuration: UIContentConfiguration) {
//        self.configuration = configuration
//        super.init(frame:.zero)
//        self.addSubview(self.textView)
//        
//        textView.translatesAutoresizingMaskIntoConstraints = false
//
//        textView.layout(top:self.topAnchor, leading:self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor, padding: .init(top: 5, left: 30, bottom: 5, right: 10))
//        
//        self.configure(configuration: configuration)
//    }
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    func configure(configuration: UIContentConfiguration) {
//        guard let configuration = configuration as? AcronymContentConfiguration else { return }
//        self.textView.text = configuration.text
//        self.textView.centerVertically()
//        self.textView.font = UIFont.systemFont(ofSize: 17.0)
//        self.textView.isEditable = false
//        self.textView.isSelectable = false
//        
//        let color = K.CellContentColor.favorite.darken(byPercentage: configuration.percentageBy)
//        self.textView.textColor = color.contrastingColor(isFlat: false)
//        self.textView.backgroundColor = color
//    }
//}
