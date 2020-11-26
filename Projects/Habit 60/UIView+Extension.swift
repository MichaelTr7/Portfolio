//
//  UIView+Extension.swift
//  Habit 60 Refactor 2
//
//  Created by MichaelTr on 2020-09-09.
//  Copyright © 2020 Michael Troeung. All rights reserved.
//

import Foundation
import UIKit

extension UIView{

func Set_Gradient_Background(First_Colour: UIColor, Second_Colour: UIColor, Corner_Radius: CGFloat){
    
    let Gradient_Layer: CAGradientLayer = CAGradientLayer()
    Gradient_Layer.frame = bounds
    Gradient_Layer.cornerRadius = Corner_Radius
    Gradient_Layer.colors = [First_Colour.cgColor, Second_Colour.cgColor]
    Gradient_Layer.locations = [0.6, 1.0]
    Gradient_Layer.startPoint = CGPoint(x: 0.0, y: 0.0)
    Gradient_Layer.endPoint = CGPoint(x: 0.0, y: 1.0)
    layer.insertSublayer(Gradient_Layer, at: 0)

}


}
