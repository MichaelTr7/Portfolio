//
//  Menu_Buttons.swift
//  Habit 60 Refactor 2
//
//  Created by MichaelTr on 2020-08-28.
//  Copyright © 2020 Michael Troeung. All rights reserved.
//

import UIKit

class Menu_Buttons: UIButton {

override func awakeFromNib() {

let Path = UIBezierPath(roundedRect: bounds, byRoundingCorners: [.topRight,.bottomRight], cornerRadii: CGSize(width: 20, height: 20))
let Menu_Button_Mask = CAShapeLayer()
Menu_Button_Mask.path = Path.cgPath
layer.mask = Menu_Button_Mask
    layer.shadowColor = UIColor.white.cgColor
    layer.shadowOffset = CGSize(width: 0.0, height: -50.0)
    layer.shadowOpacity = 0.1
    layer.shadowRadius = 3
    layer.masksToBounds = false
    layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: 3).cgPath

}

}

class Rounded_Buttons_1: UIButton {

override func awakeFromNib() {
    layer.cornerRadius = 7
//    layer.borderColor = UIColor.white.cgColor
//    layer.borderWidth = 3
    let Button_Width = self.bounds.width
    layer.shadowColor = UIColor.black.cgColor
    layer.shadowOffset = CGSize(width: 0.0, height: 0.2*Button_Width)
    layer.shadowOpacity = 0.2
    layer.shadowRadius = 0.1*Button_Width
    layer.masksToBounds = false
    layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: 3).cgPath
    let Tile_Text_Colour_1 = UIColor(red:104/255,green:218/255,blue:252/255,alpha:1/1)
    self.setTitleColor(Tile_Text_Colour_1, for: .normal)

    // Rasterize
    layer.contents = center
    layer.shouldRasterize = true
    layer.rasterizationScale = UIScreen.main.scale

}
}

class Rounded_Buttons_2: UIButton {

override func awakeFromNib() {

    let Button_Width = self.bounds.width
    layer.cornerRadius = 7
//    layer.borderColor = UIColor.white.cgColor
//    layer.borderWidth = 3
    layer.shadowColor = UIColor.black.cgColor
    layer.shadowOffset = CGSize(width: 0.0, height: 0.2*Button_Width)
    layer.shadowOpacity = 0.2
    layer.shadowRadius = 0.1*Button_Width
    layer.masksToBounds = false
    layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: 3).cgPath
    let Tile_Text_Colour_2 = UIColor(red:255/255,green:41/255,blue:130/255,alpha:0.7/1)
    self.setTitleColor(Tile_Text_Colour_2, for: .normal)

    // Rasterize
    layer.contents = center
    layer.shouldRasterize = true
    layer.rasterizationScale = UIScreen.main.scale

}
}

class Rounded_Buttons_3: UIButton {

override func awakeFromNib() {

    let Button_Width = self.bounds.width
    layer.cornerRadius = 7
//    layer.borderColor = UIColor.white.cgColor
//    layer.borderWidth = 3
    layer.shadowColor = UIColor.black.cgColor
    layer.shadowOffset = CGSize(width: 0.0, height: 0.2*Button_Width)
    layer.shadowOpacity = 0.2
    layer.shadowRadius = 0.1*Button_Width
    layer.masksToBounds = false
    layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: 3).cgPath
    let Tile_Text_Colour_3 = UIColor(red:75/255,green:237/255,blue:17/255,alpha:0.7/1)
    self.setTitleColor(Tile_Text_Colour_3, for: .normal)

    // Rasterize
    layer.contents = center
    layer.shouldRasterize = true
    layer.rasterizationScale = UIScreen.main.scale

}
}

class Rounded_Buttons_4: UIButton {

override func awakeFromNib() {

    let Button_Width = self.bounds.width
    layer.cornerRadius = 7
//    layer.borderColor = UIColor.white.cgColor
//    layer.borderWidth = 3
    layer.shadowColor = UIColor.black.cgColor
    layer.shadowOffset = CGSize(width: 0.0, height: 0.2*Button_Width)
    layer.shadowOpacity = 0.2
    layer.shadowRadius = 0.1*Button_Width
    layer.masksToBounds = false
    layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: 3).cgPath
    let Tile_Text_Colour_4 = UIColor(red:255/255,green:153/255,blue:0/255,alpha:0.7/1)
    self.setTitleColor(Tile_Text_Colour_4, for: .normal)

    // Rasterize
    layer.contents = center
    layer.shouldRasterize = true
    layer.rasterizationScale = UIScreen.main.scale

}
}

class Rounded_Buttons_5: UIButton {

override func awakeFromNib() {

    let Button_Width = self.bounds.width
    layer.cornerRadius = 7
//    layer.borderColor = UIColor.white.cgColor
//    layer.borderWidth = 3
    layer.shadowColor = UIColor.black.cgColor
    layer.shadowOffset = CGSize(width: 0.0, height: 0.2*Button_Width)
    layer.shadowOpacity = 0.2
    layer.shadowRadius = 0.1*Button_Width
    layer.masksToBounds = false
    layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: 3).cgPath
    let Tile_Text_Colour_5 = UIColor(red:98/255,green:41/255,blue:255/255,alpha:0.7/1)
    self.setTitleColor(Tile_Text_Colour_5, for: .normal)

    // Rasterize
    layer.contents = center
    layer.shouldRasterize = true
    layer.rasterizationScale = UIScreen.main.scale

}
}

