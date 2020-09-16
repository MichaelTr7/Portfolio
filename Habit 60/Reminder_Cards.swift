//
//  Reminder_Cards.swift
//  Habit 60 Refactor 2
//
//  Created by MichaelTr on 2020-09-06.
//  Copyright © 2020 Michael Troeung. All rights reserved.
//

import UIKit

class Clear_Habit_Modal: UIView{

override func awakeFromNib() {
    self.layer.cornerRadius = 25;
    let Reminder_Card = self.layer
    Reminder_Card.cornerRadius = 20
    Reminder_Card.shadowColor = UIColor.black.cgColor
    Reminder_Card.shadowOpacity = 0.3
    Reminder_Card.shadowOffset = CGSize(width: 0.0, height: 6.0)
    Reminder_Card.shadowRadius = 5
    Reminder_Card.opacity = 1
//    self.Set_Gradient_Background(First_Colour: Colour_Palette.White, Second_Colour: Colour_Palette.Light_Grey, Corner_Radius: 20)
}
}

class Clear_Habit_Modal_Buttons: UIButton{

override func awakeFromNib() {
    self.layer.cornerRadius = 27.5;
    self.layer.opacity = 0.8
    self.layer.borderColor = UIColor.init(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.05/1).cgColor
    self.layer.borderWidth = 3;

    let shadowLayer_2 = CALayer()
    shadowLayer_2.masksToBounds = false
    shadowLayer_2.shadowColor = UIColor.black.cgColor
    shadowLayer_2.shadowOpacity = 0.05
    shadowLayer_2.shadowOffset = CGSize(width: 0.0, height: -10.0)
    shadowLayer_2.shadowRadius = 2
    shadowLayer_2.shouldRasterize = true
    shadowLayer_2.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: 20).cgPath
    self.layer.insertSublayer(shadowLayer_2, at: 0)
    clipsToBounds = true

}
}


class Reminder_Cards: UIView {

override func awakeFromNib() {
    let Reminder_Card = self.layer
    Reminder_Card.cornerRadius = 20
    Reminder_Card.shadowColor = UIColor.black.cgColor
    Reminder_Card.shadowOpacity = 0.3
    Reminder_Card.shadowOffset = CGSize(width: 0.0, height: 6.0)
    Reminder_Card.shadowRadius = 5
    Reminder_Card.opacity = 1
    self.Set_Gradient_Background(First_Colour: Colour_Palette.White, Second_Colour: Colour_Palette.Light_Grey, Corner_Radius: 20)
   
//    let shadowLayer = CALayer()
//    shadowLayer.masksToBounds = false
//    shadowLayer.shadowColor = UIColor.white.cgColor
//    shadowLayer.shadowOpacity = 0.5
//    shadowLayer.shadowOffset = CGSize(width: -5.0, height: -5.0)
//    shadowLayer.shadowRadius = 2
//    shadowLayer.shouldRasterize = true
//    shadowLayer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: 20).cgPath
//    self.layer.insertSublayer(shadowLayer, at: 0)

}


}

class Slider_Style: UISlider {

override func awakeFromNib() {
    let Slider = self.layer
    Slider.cornerRadius = 20
    Slider.shadowColor = UIColor.black.cgColor
    Slider.shadowOpacity = 0.2
    Slider.shadowOffset = CGSize(width: 0.0, height: 6.0)
    Slider.shadowRadius = 3
    Slider.opacity = 1
}

override func trackRect(forBounds bounds: CGRect) -> CGRect {
    var Track_Rectangle = super.trackRect(forBounds: bounds)
    Track_Rectangle.size.height = 10
    return Track_Rectangle
}

//override func thumbRect(forBounds bounds: CGRect, trackRect rect: CGRect, value: Float) -> CGRect {
//    var Thumb = super.thumbRect(forBounds: bounds, trackRect: rect, value: value)
//    return Thumb
//}


}



