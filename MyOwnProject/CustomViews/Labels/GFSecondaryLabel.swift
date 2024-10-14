//
//  GFSecondaryLabel.swift
//  MyOwnProject
//
//  Created by Ram Naidu on 12/10/24.
//

import UIKit

class GFSecondaryLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(fontSize: CGFloat) {
        super.init(frame: .zero)
        font = UIFont.systemFont(ofSize: fontSize, weight: .medium)
        configure()
    }
    
    private func configure() {
        textColor                                   = .secondaryLabel
        adjustsFontSizeToFitWidth                   = true
        font                                        = UIFont.preferredFont(forTextStyle: .body)
        minimumScaleFactor                          = 0.90
        lineBreakMode                               = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints   = false
    }
}
