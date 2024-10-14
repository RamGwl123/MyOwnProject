//
//  GFButton.swift
//  MyOwnProject
//
//  Created by Ram Naidu on 10/10/24.
//

import UIKit

class GFButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implements ")
    }
    
    convenience init(color: UIColor, title: String, systemImageView: String) {
        self.init(frame: .zero)
        self.set(color: color, title: title, systemImageView: systemImageView)
    }
    
    private func configure() {
        configuration                               = .tinted()
        configuration?.cornerStyle                  = .medium
        translatesAutoresizingMaskIntoConstraints   = false
    }
    
    func set(color: UIColor, title: String, systemImageView: String) {
        configuration?.baseBackgroundColor  = color
        configuration?.baseForegroundColor  = color
        configuration?.title                = title
        configuration?.imagePadding         = 6
        configuration?.imagePlacement       = .leading
        
        configuration?.image                = UIImage(systemName: systemImageView)
    }
}
