//
//  UserInfoVC.swift
//  MyOwnProject
//
//  Created by Ram Naidu on 11/10/24.
//

import UIKit

protocol UserInfoVCDelegate: AnyObject {
    func didRequestFollowers(for username: String)
}

class UserInfoVC: GFDataLoadingVC {
    
    var username: String!
    weak var delegate: UserInfoVCDelegate!
    
    var scrollView          = UIScrollView()
    var contentView         = UIView()
    var headerView          = UIView()
    var itemViewOne         = UIView()
    var itemViewTwo         = UIView()
    var dateLabel           = GFBodyLabel(textAlignment: .center)
    var itemViews: [UIView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureController()
        layoutUI()
        getUserInfo()
        configureScrollView()
    }
    
    func getUserInfo() {
        NetworkManager.shared.getUserInfo(for: username) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let user):
                DispatchQueue.main.async { self.configureUIElements(with: user) }
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Somthing want to wrang", message: error.rawValue, buttonTitle: "OK")
            }
        }
    }
    
    func configureUIElements(with user: User) {
        self.add(childVC: GFUserInfoHeaderVC(user: user), to: self.headerView)
        self.add(childVC: GFRepoItemVC(user: user, delegate: self), to: self.itemViewOne)
        self.add(childVC: GFFollwerItemVC(user: user, delegate: self), to: self.itemViewTwo)
        self.dateLabel.text = "GitHub since\(user.createdAt.convertToMonthYearFormate())"
    }
    
    func configureController() {
        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    func configureScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.pinToEdges(of: view)
        contentView.pinToEdges(of: scrollView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: 783)
        ])
    }
    
    func layoutUI() {
        let padding: CGFloat    = 20
        let itemHeight: CGFloat = 140
        itemViews = [headerView, itemViewOne, itemViewTwo, dateLabel]
        for itemView in itemViews {
            contentView.addSubview(itemView)
            itemView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                itemView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
                itemView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding)
            ])
        }
        
        headerView.backgroundColor  = .systemGray
        itemViewOne.backgroundColor = .systemPink
        itemViewTwo.backgroundColor = .systemBlue
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 210),
            
            itemViewOne.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: padding),
            itemViewOne.heightAnchor.constraint(equalToConstant: itemHeight),
            
            itemViewTwo.topAnchor.constraint(equalTo: itemViewOne.bottomAnchor, constant: padding),
            itemViewTwo.heightAnchor.constraint(equalToConstant: itemHeight),
            
            dateLabel.topAnchor.constraint(equalTo: itemViewTwo.bottomAnchor, constant: padding),
            dateLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func add(childVC: UIViewController, to containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
}

extension UserInfoVC: RepoInfoVCDelegate {
    
    func didTapGithubProfile(for user: User) {
        guard let url = URL(string: user.htmlUser) else {
            presentGFAlertOnMainThread(title: "Invalid URL", message: "The Url attached to this user is invalid", buttonTitle: "Ok")
            return
        }
        presentSafariVC(with: url)
    }
}

extension UserInfoVC: GFFollwerItemVCDelegate {
    
    func didTapGetFolloers(for user: User) {
        guard user.followers != 0 else {
            presentGFAlertOnMainThread(title: "No followers", message: "This user has no follower. what a shame 🙂.", buttonTitle: "So sad")
            return
        }
        delegate.didRequestFollowers(for: user.login)
        dismissVC()
    }
}

