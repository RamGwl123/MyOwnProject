//
//  UITableView+Ext.swift
//  MyOwnProject
//
//  Created by Ram Naidu on 13/10/24.
//

import UIKit

extension UITableView {
    
    func removeExcessCells() {
        tableFooterView = UIView(frame: .zero)
    }
}
