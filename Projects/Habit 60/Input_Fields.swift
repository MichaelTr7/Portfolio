//
//  Input_Fields.swift
//  Habit 60 Refactor 2
//
//  Created by MichaelTr on 2020-09-01.
//  Copyright © 2020 Michael Troeung. All rights reserved.
//

import UIKit

class Input_Fields: UITextField {

    let Text_Padding = UIEdgeInsets(top: 2, left: 6, bottom: 2, right: 25)
   
    override func awakeFromNib() {
    layer.cornerRadius = 10
    }
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: Text_Padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: Text_Padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: Text_Padding)
    }
    
}


class Frequency_Picker_Field_1: UITextField{

    override func awakeFromNib(){
    layer.cornerRadius = 14
    let Frequency_Picker_Color = UIColor(red:104/255,green:218/255,blue:252/255,alpha:0.8/1)
    layer.borderColor = Frequency_Picker_Color.cgColor
    layer.borderWidth = 2
    self.attributedPlaceholder = NSAttributedString(string: "Habit Frequency", attributes: [NSAttributedString.Key.foregroundColor: Frequency_Picker_Color])
    }
    
    let Text_Padding = UIEdgeInsets(top: 5, left: 8, bottom: 5, right: 8)
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.inset(by: Text_Padding)
    }
        override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: Text_Padding)
    }
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: Text_Padding)
    }
    
}

class Frequency_Picker_Field_2: UITextField{

    override func awakeFromNib(){
    layer.cornerRadius = 14
    let Frequency_Picker_Color = UIColor(red:255/255,green:41/255,blue:130/255,alpha:0.6/1)
    layer.borderColor = Frequency_Picker_Color.cgColor
    layer.borderWidth = 2
    self.attributedPlaceholder = NSAttributedString(string: "Habit Frequency", attributes: [NSAttributedString.Key.foregroundColor: Frequency_Picker_Color])

    }
    
    let Text_Padding = UIEdgeInsets(top: 5, left: 8, bottom: 5, right: 8)
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.inset(by: Text_Padding)
    }
        override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: Text_Padding)
    }
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: Text_Padding)
    }
    
}

class Frequency_Picker_Field_3: UITextField{

    override func awakeFromNib(){
    layer.cornerRadius = 14
    let Frequency_Picker_Color = UIColor(red:75/255,green:237/255,blue:17/255,alpha:0.6/1)
    layer.borderColor = Frequency_Picker_Color.cgColor
    layer.borderWidth = 2
    self.attributedPlaceholder = NSAttributedString(string: "Habit Frequency", attributes: [NSAttributedString.Key.foregroundColor: Frequency_Picker_Color])
    }
    
    let Text_Padding = UIEdgeInsets(top: 5, left: 8, bottom: 5, right: 8)
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.inset(by: Text_Padding)
    }
        override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: Text_Padding)
    }
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: Text_Padding)
    }
    
}

class Frequency_Picker_Field_4: UITextField{

    override func awakeFromNib(){
    layer.cornerRadius = 14
    let Frequency_Picker_Color = UIColor(red:255/255,green:153/255,blue:0/255,alpha:0.6/1)
    layer.borderColor = Frequency_Picker_Color.cgColor
    layer.borderWidth = 2
    self.attributedPlaceholder = NSAttributedString(string: "Habit Frequency", attributes: [NSAttributedString.Key.foregroundColor: Frequency_Picker_Color])
    }
    
    let Text_Padding = UIEdgeInsets(top: 5, left: 8, bottom: 5, right: 8)
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.inset(by: Text_Padding)
    }
        override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: Text_Padding)
    }
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: Text_Padding)
    }
    
}

class Frequency_Picker_Field_5: UITextField{

    override func awakeFromNib(){
    layer.cornerRadius = 14
    let Frequency_Picker_Color = UIColor(red:98/255,green:41/255,blue:255/255,alpha:0.6/1)
    layer.borderColor = Frequency_Picker_Color.cgColor
    layer.borderWidth = 2
    self.attributedPlaceholder = NSAttributedString(string: "Habit Frequency", attributes: [NSAttributedString.Key.foregroundColor: Frequency_Picker_Color])
    }
    
    let Text_Padding = UIEdgeInsets(top: 5, left: 8, bottom: 5, right: 8)
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.inset(by: Text_Padding)
    }
        override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: Text_Padding)
    }
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: Text_Padding)
    }
    
}

class Frequency_Picker_Label: UILabel{


override func awakeFromNib() {
layer.borderColor = UIColor.red.cgColor
layer.borderWidth = 3
layer.cornerRadius = 5

}

}
