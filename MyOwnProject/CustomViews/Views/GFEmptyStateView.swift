//
//  GFEmptyStateView.swift
//  MyOwnProject
//
//  Created by Ram Naidu on 11/10/24.
//

import UIKit

class GFEmptyStateView: UIView {
    
    let messageLabel    = GFTitleLabel(textAlignment: .center, fontSize: 28)
    let logoImageView   = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(message: String) {
        self.init(frame: .zero)
        messageLabel.text = message
    }

    func configure() {
       addSubViews(messageLabel, logoImageView)
        configureMessagelabel()
        configureLogoView()
    }
    
    private func configureMessagelabel() {
        messageLabel.numberOfLines  = 3
        messageLabel.textColor      = .secondaryLabel
        
        let labelCenterYConatnts: CGFloat = DeviceType.isiPhoneX || DeviceType.isiPhone8Zoomed ? -80 : -150
        
        NSLayoutConstraint.activate([
            messageLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: labelCenterYConatnts),
            messageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            messageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            messageLabel.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func configureLogoView() {
        logoImageView.image = Images.emptyStateLogoImage
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let logoImageContraints: CGFloat = DeviceType.isiPhoneX || DeviceType.isiPhone8Zoomed ? 80 : 40
        
        NSLayoutConstraint.activate([
            logoImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),
            logoImageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1.3),
            logoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 200),
            logoImageView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: logoImageContraints)
        ])
    }
}
