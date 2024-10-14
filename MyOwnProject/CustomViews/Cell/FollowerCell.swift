//
//  FollowerCell.swift
//  MyOwnProject
//
//  Created by Ram Naidu on 10/10/24.
//

import UIKit

class FollowerCell: UICollectionViewCell {
    
    static let identifier   = "FollowerCell"
    let avatarImageView     = GFAvatarImageView(frame: .infinite)
    let userLabel           = GFTitleLabel(textAlignment: .center, fontSize: 16)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(follower: Follower) {
        avatarImageView.downloadImage(fromUrl: follower.avatarUrl)
        userLabel.text = follower.login
    }
    
    func configure() {
        addSubViews(avatarImageView, userLabel)
        let pading: CGFloat = 8
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: pading),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: pading),
            avatarImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -pading),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),
            
            userLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 12),
            userLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: pading),
            userLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -pading),
            userLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
