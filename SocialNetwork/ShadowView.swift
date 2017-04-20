//
//  ShadowView.swift
//  SocialNetwork
//
//  Created by Kalyan Dechiraju on 20/04/17.
//  Copyright © 2017 Codelight Studios. All rights reserved.
//

import UIKit

class ShadowView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.shadowColor = UIColor(red:0.83, green:0.83, blue:0.83, alpha:0.6).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
    }

}
