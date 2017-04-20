//
//  CircleImageView.swift
//  SocialNetwork
//
//  Created by Kalyan Dechiraju on 20/04/17.
//  Copyright © 2017 Codelight Studios. All rights reserved.
//

import UIKit

class CircleImageView: UIImageView {

    override func layoutSubviews() {
        //layer.shadowColor
        //layer.shadowRadius
        //layer.shadowOpacity
        //layer.shadowOffset
        layer.cornerRadius = self.frame.width / 2
    }

}
