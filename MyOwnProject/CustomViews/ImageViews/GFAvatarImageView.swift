//
//  GFAvatarImageView.swift
//  MyOwnProject
//
//  Created by Ram Naidu on 10/10/24.
//

import UIKit

class GFAvatarImageView: UIImageView {
    
    let cache               = NetworkManager.shared.cache
    let placeHolderImage    = Images.placeHolder
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerRadius                          = 10
        clipsToBounds                               = true
        image                                       = placeHolderImage
        translatesAutoresizingMaskIntoConstraints   = false
    }
    
    func downloadImage(fromUrl url: String) {
        NetworkManager.shared.downLoadImages(from: url) { [weak self] image in
            guard let self = self else { return }
            DispatchQueue.main.async { self.image = image }
        }
    }
}
