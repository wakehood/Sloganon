//
//  SloganOfTheDayContentConfiguration.swift
//  Sloganon
//
//  Created by Sylvia Wake-Hood on 1/9/23.
//

import Foundation
import UIKit

struct SloganOfTheDayContentConfiguration : UIContentConfiguration {
    var text = ""
    var percentageBy = 0.0
        
    func makeContentView() -> UIView & UIContentView {
        return SloganOfTheDayContentView(self)
    }
    func updated(for state: UIConfigurationState) -> SloganOfTheDayContentConfiguration {
        return self
    }
}

class SloganOfTheDayContentView : UIView, UIContentView {
    var configuration: UIContentConfiguration {
        didSet {
            self.configure(configuration: configuration)
        }
    }
    let textView = UITextView()
    init(_ configuration: UIContentConfiguration) {
        self.configuration = configuration
        super.init(frame:.zero)
        self.addSubview(self.textView)
        self.textView.centerVertically()
        self.textView.font = UIFont.boldSystemFont(ofSize: 30.0)
        self.textView.isEditable = false
        self.textView.isSelectable = false

        self.textView.textAlignment = .center
        
        textView.translatesAutoresizingMaskIntoConstraints = false

        textView.layout(top:self.topAnchor, leading:self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor, padding: .init(top: 5, left: 10, bottom: 5, right: 10))
        
        self.configure(configuration: configuration)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure(configuration: UIContentConfiguration) {
        guard let configuration = configuration as? SloganOfTheDayContentConfiguration else { return }
        self.textView.text = configuration.text
        
        let color = K.CellContentColor.sloganOfTheDay.darken(byPercentage: configuration.percentageBy)
        self.textView.textColor = color.contrastingColor(isFlat: false)
        self.textView.backgroundColor = color
    }
}
