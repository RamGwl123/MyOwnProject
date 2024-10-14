//
//  GFItemView.swift
//  MyOwnProject
//
//  Created by Ram Naidu on 12/10/24.
//

import UIKit

enum ItemInfoType {
    case repos, gists, followers, following
}

class GFItemView: UIView {

    let symbalImageView = UIImageView()
    let titleLabel = GFTitleLabel(textAlignment: .left, fontSize: 14)
    let countLabel = GFTitleLabel(textAlignment: .center, fontSize: 14)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubViews(symbalImageView, titleLabel, countLabel)
        symbalImageView.translatesAutoresizingMaskIntoConstraints = false
        symbalImageView.contentMode = .scaleAspectFill
        symbalImageView.tintColor = .label
        
        NSLayoutConstraint.activate([
            symbalImageView.topAnchor.constraint(equalTo: self.topAnchor),
            symbalImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            symbalImageView.heightAnchor.constraint(equalToConstant: 20),
            symbalImageView.widthAnchor.constraint(equalToConstant: 20),
            
            titleLabel.centerYAnchor.constraint(equalTo: symbalImageView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: symbalImageView.trailingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 18),
            
            countLabel.topAnchor.constraint(equalTo: symbalImageView.bottomAnchor, constant: 5),
            countLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            countLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            countLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
    
    func set(itemInfoType: ItemInfoType, withCount count: Int) {
        switch itemInfoType {
        case .repos:
            symbalImageView.image = UIImage(named: GFSymbals.repos)
            titleLabel.text = "repos"
        case .gists:
            symbalImageView.image = UIImage(named: GFSymbals.gists)
            titleLabel.text = "gists"
        case .followers:
            symbalImageView.image = UIImage(named: GFSymbals.followers)
            titleLabel.text = "followers"
        case .following:
            symbalImageView.image = UIImage(named: GFSymbals.following)
            titleLabel.text = "following"
        }
        countLabel.text = String(count)
    }
}
