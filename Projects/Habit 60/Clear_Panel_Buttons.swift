//
//  Clear_Panel_Buttons.swift
//  Habit 60 Refactor 2
//
//  Created by MichaelTr on 2020-09-12.
//  Copyright © 2020 Michael Troeung. All rights reserved.
//

import UIKit

class Clear_Panel_Buttons: UIButton {

override func awakeFromNib() {
    self.layer.cornerRadius = 20;

    let shadowLayer = CALayer()
    shadowLayer.masksToBounds = false
    shadowLayer.shadowColor = UIColor.systemGray6.cgColor
    shadowLayer.shadowOpacity = 0.8
    shadowLayer.shadowOffset = CGSize(width: 6.0, height: 6.0)
    let Blur_Factor = CGFloat(5.5);
    shadowLayer.shadowRadius = Blur_Factor
    shadowLayer.shouldRasterize = true
    shadowLayer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: 15).cgPath
    self.layer.insertSublayer(shadowLayer, at: 1)
    clipsToBounds = true


    let shadowLayer_2 = CALayer()
    shadowLayer_2.masksToBounds = false
    shadowLayer_2.shadowColor = UIColor.black.cgColor
    shadowLayer_2.shadowOpacity = 0.05
    shadowLayer_2.shadowOffset = CGSize(width: -4.0, height: -4.0)
    shadowLayer_2.shadowRadius = 2
    shadowLayer_2.shouldRasterize = true
    shadowLayer_2.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: 20).cgPath
    self.layer.insertSublayer(shadowLayer_2, at: 0)
    clipsToBounds = true


}





}
