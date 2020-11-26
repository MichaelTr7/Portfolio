//
//  Card_5_View_Controller.swift
//  Habit 60 Refactor 2
//
//  Created by MichaelTr on 2020-08-28.
//  Copyright © 2020 Michael Troeung. All rights reserved.
//

import UIKit

var Menu_Slide_5 = false
var Card_Pop_Flag_5 = false
var Reminder_Switch_State_5 = false
var Panel_Grid_5: [Int] = Array(repeating: 0, count: 60)

class Card_5_View_Controller: UIViewController, UITextFieldDelegate {

    // Constraint variables
    @IBOutlet weak var Left_Menu_5_Sliding_Constraint: NSLayoutConstraint!
    @IBOutlet weak var Right_Menu_5_Sliding_Constraint: NSLayoutConstraint!
    @IBOutlet weak var Card_Constraint_5: NSLayoutConstraint!

    // Buttons
    @IBOutlet weak var Card_Button_Pop_5: UIButton!
    @IBOutlet weak var Clear_Button_5: Clear_Panel_Buttons!
    @IBOutlet weak var Modal_Dismiss_5: UIButton!
    @IBOutlet var Tile_Collection_5: [Rounded_Buttons_5]!

    // Views
    @IBOutlet weak var Card_Pop_Up_5: UIView!
    @IBOutlet weak var Card_5_Background_View: UIView!
    @IBOutlet weak var Menu_5_Background_View: UIView!
    @IBOutlet weak var Dismiss_Panel_5: UIView!
    @IBOutlet weak var Menu_Dismiss_Panel_5: UIView!
    @IBOutlet weak var Percentage_Circle_5: UIView!
    @IBOutlet weak var Clear_Habit_Panel_5: UIView!
    
    // Input text fields
    @IBOutlet weak var Habit_Title_Field_5: UITextField!
    @IBOutlet weak var Routine_Field_5: Frequency_Picker_Field_5!

    // Labels
    @IBOutlet weak var Percentage_Label_5: UILabel!
    @IBOutlet weak var Count_Label_5: UILabel!
    @IBOutlet weak var Habit_Label_5: UILabel!
    
    // Stacks
    @IBOutlet weak var Tile_Stack_5: UIStackView!
    @IBOutlet var Horizontal_Stacks_5: [UIStackView]!
    
    // Toggle switches
    @IBOutlet weak var Reminder_Toggle_5: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Create_Keyboard_Observer_5()
        Card_Pop_Up_Style(Card_Pop_Up: Card_Pop_Up_5)
        Generate_Background_Colour(Card_View_Controller: Menu_5_Background_View, Card_Index_Value: 5)
        Card_5_Background_View.layer.shadowColor = UIColor.black.cgColor
        Card_5_Background_View.layer.shadowOffset = CGSize(width: -10.0, height: 4.0)
        Card_5_Background_View.layer.shadowRadius = 15
        Card_5_Background_View.layer.masksToBounds = false
        Dismiss_Panel_5.layer.opacity = 0
        Menu_Dismiss_Panel_5.layer.opacity = 0
        Habit_Title_Field_5.delegate = self
        Habit_Title_Field_5.layer.opacity = 0
        Routine_Field_5.layer.opacity = 0
        let Screen_Width = Card_5_Background_View.bounds.width
        Tile_Stack_5.spacing = 0.02*Screen_Width
        let Number_Of_Rows = Horizontal_Stacks_5.count
        for Index in 0 ..< Number_Of_Rows{
        Horizontal_Stacks_5[Index].spacing = 0.02*Screen_Width
        }
        Clear_Habit_Panel_5.layer.opacity = 0
        Modal_Dismiss_5.layer.opacity = 0
    }

 func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    Habit_Title_Field_5.layer.backgroundColor = UIColor.white.cgColor
    Copy_Habit_Title(Habit_Field: Habit_Title_Field_5, Habit_Title_Label: Habit_Label_5)
    return true
 }

    @IBAction func Card_5_Swipe_Up(_ sender: Any) {
        let Tile_Count_5 = Calculate_Percentage_Completed(Tile_Array: Panel_Grid_5)
        _ = Draw_Percentage_Circle(Graph_Canvas: Percentage_Circle_5, Count: Tile_Count_5.0, Card_Index_Value: 5)
        Percentage_Label_5.text = Tile_Count_5.1 + "%"
        Count_Label_5.text = String(Tile_Count_5.0) + "/60 Tiles"
        Card_Constraint_5.constant = 50
        Card_Pop_Flag_5 = true
        UIView.animate(withDuration: 0.6, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {self.view.layoutIfNeeded()
        self.Dismiss_Panel_5.layer.opacity = 0.2
        self.Habit_Title_Field_5.layer.opacity = 1
        self.Routine_Field_5.layer.opacity = 1
        },completion: nil)
    }
    
    
    @IBAction func Card_5_Swipe_Down(_ sender: Any) {
        Card_Constraint_5.constant = -370
        Card_Pop_Flag_5 = false
        UIView.animate(withDuration: 0.6, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {self.view.layoutIfNeeded()
        self.Dismiss_Panel_5.layer.opacity = 0
        self.Habit_Title_Field_5.layer.opacity = 0
        self.Routine_Field_5.layer.opacity = 0
        },completion: nil)
        _ = textFieldShouldReturn(Habit_Title_Field_5)
    }
    


/*************************************************************/
/*FUNCTIONS: VIEW CONTROLLER CARD 5*/
/*************************************************************/

@IBAction func Edit_Button_5_Pressed(_ sender: Any) {
      if(Card_Pop_Flag_5 == false){
        let Tile_Count_5 = Calculate_Percentage_Completed(Tile_Array: Panel_Grid_5)
        _ = Draw_Percentage_Circle(Graph_Canvas: Percentage_Circle_5, Count: Tile_Count_5.0, Card_Index_Value: 5)
        Percentage_Label_5.text = Tile_Count_5.1 + "%"
        Count_Label_5.text = String(Tile_Count_5.0) + "/60 Tiles"
        Card_Constraint_5.constant = 50
        Card_Pop_Flag_5 = true
        UIView.animate(withDuration: 0.6, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {self.view.layoutIfNeeded()
        self.Dismiss_Panel_5.layer.opacity = 0.2
        self.Habit_Title_Field_5.layer.opacity = 1
        self.Routine_Field_5.layer.opacity = 1
        },completion: nil)
            }
        else{
        Card_Constraint_5.constant = -370
        Card_Pop_Flag_5 = false
        UIView.animate(withDuration: 0.6, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {self.view.layoutIfNeeded()
        self.Dismiss_Panel_5.layer.opacity = 0
        self.Habit_Title_Field_5.layer.opacity = 0
        self.Routine_Field_5.layer.opacity = 0
        },completion: nil)
        _ = textFieldShouldReturn(Habit_Title_Field_5)
            }
            
        Left_Menu_5_Sliding_Constraint.constant = 0
        Right_Menu_5_Sliding_Constraint.constant = 0
        Menu_Slide_5 = false
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseIn, animations: {self.view.layoutIfNeeded()
        self.Card_5_Background_View.layer.shadowOpacity = 0
        self.Menu_Dismiss_Panel_5.layer.opacity = 0
        }, completion: nil)
        
    }

    @IBAction func Menu_Button_5(_ sender: Any) {
        if Menu_Slide_5 == false{
        Left_Menu_5_Sliding_Constraint.constant = 170
        Right_Menu_5_Sliding_Constraint.constant = -170
        Menu_Slide_5 = true
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseIn, animations: {self.view.layoutIfNeeded()
        self.Card_5_Background_View.layer.shadowOpacity = 0.2
        self.Menu_Dismiss_Panel_5.layer.opacity = 0.5
        self.Habit_Title_Field_5.layer.opacity = 0
        self.Routine_Field_5.layer.opacity = 0
        }, completion: nil)
        _ = textFieldShouldReturn(Habit_Title_Field_5)
        Card_Constraint_5.constant = -370
        Card_Pop_Flag_5 = false
        UIView.animate(withDuration: 1, delay: 0.25, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {self.view.layoutIfNeeded()
        self.Dismiss_Panel_5.layer.opacity = 0
        },completion: nil)
        }
    
        else{
        Left_Menu_5_Sliding_Constraint.constant = 0
        Right_Menu_5_Sliding_Constraint.constant = 0
        Menu_Slide_5 = false
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseIn, animations: {self.view.layoutIfNeeded()
        self.Card_5_Background_View.layer.shadowOpacity = 0
        self.Menu_Dismiss_Panel_5.layer.opacity = 0
        }, completion: nil)
        }
    
    }
    
    @IBAction func Card_Button_Pop_Pressed_5(_ sender: Any) {
        if(Card_Pop_Flag_5 == false){
        let Tile_Count_5 = Calculate_Percentage_Completed(Tile_Array: Panel_Grid_5)
        _ = Draw_Percentage_Circle(Graph_Canvas: Percentage_Circle_5, Count: Tile_Count_5.0, Card_Index_Value: 5)
        Percentage_Label_5.text = Tile_Count_5.1 + "%"
        Count_Label_5.text = String(Tile_Count_5.0) + "/60 Tiles"
        Card_Constraint_5.constant = 50
        Card_Pop_Flag_5 = true
        UIView.animate(withDuration: 0.6, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {self.view.layoutIfNeeded()
        self.Dismiss_Panel_5.layer.opacity = 0.2
        self.Habit_Title_Field_5.layer.opacity = 1
        self.Routine_Field_5.layer.opacity = 1
        },completion: nil)
            }
        else{
        Card_Constraint_5.constant = -370
        Card_Pop_Flag_5 = false
        UIView.animate(withDuration: 0.6, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {self.view.layoutIfNeeded()
        self.Dismiss_Panel_5.layer.opacity = 0
        self.Habit_Title_Field_5.layer.opacity = 0
        self.Routine_Field_5.layer.opacity = 0
        },completion: nil)
        _ = textFieldShouldReturn(Habit_Title_Field_5)
            }

    }
    
        @IBAction func Dismiss_Card_5(_ sender: Any) {
        Card_Constraint_5.constant = -370
        Card_Pop_Flag_5 = false
        UIView.animate(withDuration: 0.5, delay: 0.15, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {self.view.layoutIfNeeded()
        self.Dismiss_Panel_5.layer.opacity = 0
        self.Habit_Title_Field_5.layer.opacity = 0
        self.Routine_Field_5.layer.opacity = 0
        },completion: nil)
        _ = textFieldShouldReturn(Habit_Title_Field_5)
    }
    
    
    @IBAction func Dismiss_Menu_5(_ sender: Any) {
        Left_Menu_5_Sliding_Constraint.constant = 0
        Right_Menu_5_Sliding_Constraint.constant = 0
        Menu_Slide_5 = false
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseIn, animations: {self.view.layoutIfNeeded()
        self.Card_5_Background_View.layer.shadowOpacity = 0
        self.Dismiss_Panel_5.layer.opacity = 0
        self.Clear_Habit_Panel_5.layer.opacity = 1
        self.Modal_Dismiss_5.layer.opacity = 0.5
        }, completion: nil)
    }
    
    
    
    @IBAction func Tile_Pressed(_ sender: UIButton) {

      UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseOut, animations: {
        sender.transform = CGAffineTransform(scaleX: 1.15, y: 1.15)
        },
        completion: { _ in
        UIView.animate(withDuration: 0.3) {
        sender.transform = CGAffineTransform.identity
        }
    })
        
       let Day = Int(sender.currentTitle!)
        let Tile_Array_Index = Day!-1

        if(Panel_Grid_5[Tile_Array_Index] == 0){
            Panel_Grid_5[Tile_Array_Index] = 1;
            let Blue_Strength = (255-(2*CGFloat(Day!)))
            let Red_Strength = (98+(1.2*CGFloat(Day!)))
            UIButton.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn, animations: {
            self.Tile_Collection_5[Tile_Array_Index].backgroundColor = UIColor.init(red:Red_Strength/255, green:41/255, blue: Blue_Strength/255, alpha: 1/1);}, completion: nil)
            self.Tile_Collection_5[Tile_Array_Index].setTitleColor(.white, for: .normal)
        }
        else{
            Panel_Grid_5[Tile_Array_Index] = 0;
            UIButton.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn, animations: {
            self.Tile_Collection_5[Tile_Array_Index].backgroundColor = .systemGray6}, completion: nil)
            let Tile_Text_Colour_5 = UIColor(red:98/255,green:41/255,blue:255/255,alpha:0.7/1)
            self.Tile_Collection_5[Tile_Array_Index].setTitleColor(Tile_Text_Colour_5, for: .normal)
        }
    }
    

    let Keyboard_Dimiss = Notification.Name(rawValue: Swipe_And_Dismiss_Notification_Key)

    func Create_Keyboard_Observer_5(){
    NotificationCenter.default.addObserver(self, selector: #selector(Card_5_View_Controller.Dimiss_Keyboard_And_Text_Field_Editing), name: Keyboard_Dimiss, object: nil)
    }
    
    @objc func Dimiss_Keyboard_And_Text_Field_Editing(notification: NSNotification){
//    _ = textFieldShouldReturn(Habit_Title_Field_5)
    Habit_Title_Field_5.layer.backgroundColor = UIColor.white.cgColor
    }

    @IBAction func Habit_Title_5_Pressed(_ sender: Any) {
    Habit_Title_Field_5.layer.backgroundColor = UIColor.systemGray6.cgColor
    }

    @IBAction func Reminder_5_Pressed(_ sender: UISwitch) {
    if(Reminder_Switch_State_5 == false){
    performSegue(withIdentifier: "Reminder_5", sender: nil)
    Reminder_Switch_State_5 = true
    }
    else{
        Reminder_Switch_State_5 = false
    }
    }

    @IBAction func Clear_Button_5_Pressed(_ sender: Any) {
    

    UIButton.animate(withDuration: 0.1,
    animations: {
    self.Clear_Button_5.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
    },
    completion: { _ in
    UIButton.animate(withDuration: 0.1) {
    self.Clear_Button_5.transform = CGAffineTransform.identity
    }
    })

    Card_Constraint_5.constant = -370
    Card_Pop_Flag_5 = false
    UIView.animate(withDuration: 1.0, delay: 0.2, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {self.view.layoutIfNeeded()
    self.Habit_Title_Field_5.layer.opacity = 0
    self.Routine_Field_5.layer.opacity = 0
    self.Dismiss_Panel_5.layer.opacity = 0
    self.Modal_Dismiss_5.layer.opacity = 0.5
    },completion: nil)
    _ = textFieldShouldReturn(Habit_Title_Field_5)

    UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {self.view.layoutIfNeeded()
    self.Clear_Habit_Panel_5.layer.opacity = 1
    },completion: nil)

}

    @IBAction func Clear_Modal_Dismiss_5(_ sender: Any) {
    UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {self.view.layoutIfNeeded()
    self.Clear_Habit_Panel_5.layer.opacity = 0
    self.Modal_Dismiss_5.layer.opacity = 0
    },completion: nil)
    }
    
    @IBAction func Cancel_Button_5(_ sender: UIButton) {
    UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseOut, animations: {
    sender.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
    self.Clear_Habit_Panel_5.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
    },
    completion: { _ in
    UIView.animate(withDuration: 0.1) {
    sender.transform = CGAffineTransform.identity
    self.Clear_Habit_Panel_5.transform = CGAffineTransform.identity
    }
    })
    }

    @IBAction func Confirm_Button_5(_ sender: UIButton) {
    UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseOut, animations: {
    sender.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
    self.Clear_Habit_Panel_5.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
    },
    completion: { _ in
    UIView.animate(withDuration: 0.1) {
    sender.transform = CGAffineTransform.identity
    self.Clear_Habit_Panel_5.transform = CGAffineTransform.identity
    self.Habit_Label_5.text = ""
    }
    })
    
    Habit_Title_Field_5.text = ""
    
    Panel_Grid_2 = Array(repeating: 0, count: 60)
    Clear_Panel_Grid(Panel_Grid: Tile_Collection_5!, Habit_Card_Index: 5)
    
    UIView.animate(withDuration: 0.5, delay: 0.3, options: .curveEaseOut, animations: {
    self.view.layoutIfNeeded()
    self.Clear_Habit_Panel_5.layer.opacity = 0
    self.Modal_Dismiss_5.layer.opacity = 0
    },completion: nil)
    }


}


func Generate_Background_Colour(Card_View_Controller: UIView, Card_Index_Value: Int){
        let Gradient: CAGradientLayer = CAGradientLayer()
        var Colour_1 = UIColor.white.cgColor
        var Colour_2 = UIColor.white.cgColor

        
        if(Card_Index_Value == 1){
        Colour_1 = UIColor(red:104/255,green:218/255,blue:252/255,alpha:1/1).cgColor
        Colour_2 = UIColor(red:104/255, green:218/255, blue:132/255,alpha:1/1).cgColor
        }
        
        if(Card_Index_Value == 2){
        Colour_1 = UIColor(red:255/255,green:41/255,blue:130/255,alpha:1/1).cgColor
        Colour_2 = UIColor(red:135/255, green:41/255, blue:130/255,alpha:1/1).cgColor
        }
        
        if(Card_Index_Value == 3){
        Colour_1 = UIColor(red:75/255,green:237/255,blue:17/255,alpha:1/1).cgColor
        Colour_2 = UIColor(red:75/255, green:177/255, blue:17/255,alpha:1/1).cgColor
        }
        
        if(Card_Index_Value == 4){
        Colour_1 = UIColor(red:255/255,green:153/255,blue:0/255,alpha:1/1).cgColor
        Colour_2 = UIColor(red:255/255, green:193/255, blue:0/255,alpha:1/1).cgColor
        }
        
        if(Card_Index_Value == 5){
        Colour_1 = UIColor(red:98/255,green:41/255,blue:255/255,alpha:1/1).cgColor
        Colour_2 = UIColor(red:98/255, green:41/255, blue:135/255,alpha:1/1).cgColor
        }
    
        Gradient.colors = [Colour_1, Colour_2]
        Gradient.locations = [0.0 , 1.0]
        Gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        Gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
        Gradient.frame = Card_View_Controller.bounds
        Card_View_Controller.layer.insertSublayer(Gradient, at: 0)
//      Gradient.frame = CGRect(x: 0.0, y: 0.0, width: Card_View_Controller.view.frame.size.width, height: Card_View_Controller.view.frame.size.height)
//      Card_View_Controller.view.layer.insertSublayer(Gradient, at: 0)
    }

func Card_Pop_Up_Style(Card_Pop_Up: UIView){
        // Adjusting the style of the "Card Pop Up" modal
        Card_Pop_Up.backgroundColor = UIColor.init(red:255/255, green:255/255, blue:255/255, alpha: 1/1);
        Card_Pop_Up.layer.cornerRadius = 35;
        Card_Pop_Up.layer.shadowColor = UIColor.black.cgColor
        Card_Pop_Up.layer.shadowOpacity = 0.5
        Card_Pop_Up.layer.shadowOffset = CGSize(width: 0.0, height: 10.0)
        Card_Pop_Up.layer.shadowRadius = 10
    }

func Background_Style(Background_Panel: UIView){
        // Adjusting the style of the "Card Pop Up" modal
        Background_Panel.backgroundColor = UIColor.init(red:255/255, green:255/255, blue:255/255, alpha: 1/1);
        Background_Panel.layer.cornerRadius = 0;
        Background_Panel.layer.shadowColor = UIColor.white.cgColor
        Background_Panel.layer.shadowOpacity = 0.5
        Background_Panel.layer.shadowOffset = CGSize(width: 0.0, height: 10.0)
        Background_Panel.layer.shadowRadius = 10
    }

func Calculate_Percentage_Completed(Tile_Array: [Int]) -> (Int, String){
var Count: Int = 0
for Index in 0 ..< 60{

if(Tile_Array[Index] == 1){
Count = Count + 1
}

}
let Percentage: Float = (Float(Count)/60.0)*100.0
let Rounded_Percentage: Int = Int(round(Percentage))
let String_Percentage: String = String(Rounded_Percentage)

    return (Count, String_Percentage)
}


func Draw_Percentage_Circle(Graph_Canvas:UIView, Count: Int, Card_Index_Value: Int) -> CAShapeLayer{
        let Arc_Shape_Layer = CAShapeLayer()
        let Arc_Layer_Background = CAShapeLayer()
        
        let Canvas_Width: CGFloat = Graph_Canvas.bounds.width
        let Canvas_Height: CGFloat = Graph_Canvas.bounds.height
        let Ring_Sizing_Factor: CGFloat = 0.38
        let Arc_Radius: CGFloat = Ring_Sizing_Factor*Canvas_Width
        
        // Inner ring position
        let Line_Width: CGFloat = 30
        let Centre_Position_X: CGFloat = (Canvas_Width/2)
        let Centre_Position_Y: CGFloat = Canvas_Height/2
        
        //Graph_Angle
        let Offset: CGFloat = -0.1*(2*CGFloat.pi)
//        let Count: CGFloat = 50
        let Fraction: CGFloat = (CGFloat(Count)/60)*2*CGFloat.pi + Offset
        
        
        let Circular_Ring = UIBezierPath(arcCenter: CGPoint(x: Centre_Position_X, y: Centre_Position_Y), radius: Arc_Radius, startAngle: Offset, endAngle: Fraction, clockwise: true)
        let Circular_Ring_Background = UIBezierPath(arcCenter: CGPoint(x: Centre_Position_X, y: Centre_Position_Y), radius: Arc_Radius, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)


        Arc_Shape_Layer.path = Circular_Ring.cgPath
        Arc_Shape_Layer.strokeColor = UIColor(red:104/255,green:218/255,blue:252/255,alpha:1/1).cgColor
        Arc_Shape_Layer.lineWidth = Line_Width
        Arc_Shape_Layer.fillColor = UIColor.clear.cgColor
        Arc_Shape_Layer.lineCap = CAShapeLayerLineCap.round
        Arc_Shape_Layer.strokeEnd = 0
        
        Arc_Layer_Background.path = Circular_Ring_Background.cgPath
        Arc_Layer_Background.strokeColor = UIColor.systemGray5.cgColor
        Arc_Layer_Background.lineWidth = Line_Width + 10
        Arc_Layer_Background.fillColor = UIColor.clear.cgColor
        Arc_Layer_Background.lineCap = CAShapeLayerLineCap.round
        
    
        
        let Revolve_Animation = CABasicAnimation(keyPath: "strokeEnd")
        Revolve_Animation.toValue = 1
        Revolve_Animation.duration = 0.8
        Revolve_Animation.beginTime = CACurrentMediaTime() + 0.1
        Revolve_Animation.fillMode = CAMediaTimingFillMode.forwards
        Revolve_Animation.isRemovedOnCompletion = false
        Arc_Shape_Layer.add(Revolve_Animation, forKey: "Revolve")
        
        var Colour_1 = UIColor.white.cgColor
        var Colour_2 = UIColor.white.cgColor
        
         if(Card_Index_Value == 1){
        Colour_1 = UIColor(red:104/255,green:218/255,blue:252/255,alpha:1/1).cgColor
        Colour_2 = UIColor(red:104/255, green:218/255, blue:132/255,alpha:1/1).cgColor
        }
        
        if(Card_Index_Value == 2){
        Colour_1 = UIColor(red:255/255,green:41/255,blue:130/255,alpha:1/1).cgColor
        Colour_2 = UIColor(red:135/255, green:41/255, blue:130/255,alpha:1/1).cgColor
        }
        
        if(Card_Index_Value == 3){
        Colour_1 = UIColor(red:75/255,green:237/255,blue:17/255,alpha:1/1).cgColor
        Colour_2 = UIColor(red:75/255, green:177/255, blue:17/255,alpha:1/1).cgColor
        }
        
        if(Card_Index_Value == 4){
        Colour_1 = UIColor(red:255/255,green:153/255,blue:0/255,alpha:1/1).cgColor
        Colour_2 = UIColor(red:255/255, green:193/255, blue:0/255,alpha:1/1).cgColor
        }
        
        if(Card_Index_Value == 5){
        Colour_1 = UIColor(red:98/255,green:41/255,blue:255/255,alpha:1/1).cgColor
        Colour_2 = UIColor(red:98/255, green:41/255, blue:135/255,alpha:1/1).cgColor
        }
        
        let Gradient_Layer = CAGradientLayer()
        Gradient_Layer.startPoint = CGPoint(x:1.0, y:0.5)
        Gradient_Layer.endPoint = CGPoint(x:0.0, y:0.5)
        Gradient_Layer.colors = [Colour_1, Colour_2]
        Gradient_Layer.frame = Graph_Canvas.bounds
        Gradient_Layer.mask = Arc_Shape_Layer

        
        Graph_Canvas.layer.addSublayer(Arc_Layer_Background)
        Graph_Canvas.layer.addSublayer(Gradient_Layer)

        
        return Arc_Layer_Background
}


func Copy_Habit_Title(Habit_Field:UITextField, Habit_Title_Label:UILabel){
let Habit_Name = Habit_Field.text
Habit_Title_Label.text = String(Habit_Name!)
}

func Saving_Tile_Data(){
print("Saving tile data")
}

func Saving_Card_Data(){
print("Saving card data")
}

