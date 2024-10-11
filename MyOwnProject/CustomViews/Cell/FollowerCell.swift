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
        userLabel.text = follower.login
        avatarImageView.downloadImage(from: follower.avatarUrl)
    }
    
    func configure() {
        addSubview(avatarImageView)
        addSubview(userLabel)
        
        let pading: CGFloat = 8
        
        NSLayoutConstraint.activate([
        
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: pading),
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: pading),
            avatarImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -pading),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),
            
            userLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 12),
            userLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: pading),
            userLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -pading),
            userLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
