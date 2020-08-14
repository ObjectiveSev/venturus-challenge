//
//  UITableViewCell.swift
//  Venturus Challenge
//
//  Created by Thiago Augusto on 28/07/20.
//  Copyright © 2020 objectivesev. All rights reserved.
//

import UIKit

public extension UICollectionViewCell {
    
    /** Return identifier with the same name of the subclass */
    static var defaultIdentifier: String {
        return String(describing: self)
    }
}
