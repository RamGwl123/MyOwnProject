//
//  FavorateCell.swift
//  MyOwnProject
//
//  Created by Ram Naidu on 13/10/24.
//

import UIKit

class FavorateCell: UITableViewCell {

    static let reuseID   = "FavorateCell"
    let avatarImageView     = GFAvatarImageView(frame: .infinite)
    let userLabel           = GFTitleLabel(textAlignment: .left, fontSize: 26)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(favorite: Follower) {
        avatarImageView.downloadImage(fromUrl: favorite.avatarUrl)
        userLabel.text = favorite.login
    }

    func configure() {
        addSubViews(avatarImageView, userLabel)
        accessoryType           = .disclosureIndicator
        let padding: CGFloat    = 12
        
        NSLayoutConstraint.activate([
            avatarImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            avatarImageView.heightAnchor.constraint(equalToConstant: 60),
            avatarImageView.widthAnchor.constraint(equalToConstant: 60),
            
            userLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            userLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 24),
            userLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            userLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
