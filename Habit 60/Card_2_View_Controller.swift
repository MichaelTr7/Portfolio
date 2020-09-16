//
//  Card_2_View_Controller.swift
//  Habit 60 Refactor
//
//  Created by MichaelTr on 2020-08-27.
//  Copyright © 2020 Michael Troeung. All rights reserved.
//

import UIKit

var Menu_Slide_2 = false
var Card_Pop_Flag_2 = false
var Reminder_Switch_State_2 = false
var Panel_Grid_2: [Int] = Array(repeating: 0, count: 60)

class Card_2_View_Controller: UIViewController, UITextFieldDelegate {

    // Constraint variables
    @IBOutlet weak var Right_Menu_2_Sliding_Constraint: NSLayoutConstraint!
    @IBOutlet weak var Left_Menu_2_Sliding_Constraint: NSLayoutConstraint!
    @IBOutlet weak var Card_Constraint_2: NSLayoutConstraint!

    // Buttons
    @IBOutlet weak var Card_Button_Pop_2: UIButton!
    @IBOutlet weak var Clear_Button_2: Clear_Panel_Buttons!
    @IBOutlet weak var Modal_Dismiss_2: UIButton!
    @IBOutlet var Tile_Collection_2: [Rounded_Buttons_2]!

    // Views
    @IBOutlet weak var Card_Pop_Up_2: UIView!
    @IBOutlet weak var Card_2_Background_View: UIView!
    @IBOutlet weak var Menu_2_Background_View: UIView!
    @IBOutlet weak var Dismiss_Panel_2: UIView!
    @IBOutlet weak var Menu_Dismiss_Panel_2: UIView!
    @IBOutlet weak var Percentage_Circle_2: UIView!
    @IBOutlet weak var Clear_Habit_Panel_2: UIView!
    
    // Input text fields
    @IBOutlet weak var Habit_Title_Field_2: UITextField!
    @IBOutlet weak var Routine_Field_2: Frequency_Picker_Field_2!

    // Labels
    @IBOutlet weak var Percentage_Label_2: UILabel!
    @IBOutlet weak var Count_Label_2: UILabel!
    @IBOutlet weak var Habit_Label_2: UILabel!
    
    // Stacks
    @IBOutlet weak var Tile_Stack_2: UIStackView!
    @IBOutlet var Horizontal_Stacks_2: [UIStackView]!
    
    // Toggle switches
    @IBOutlet weak var Reminder_Toggle_2: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Create_Keyboard_Observer_2()
        Card_Pop_Up_Style(Card_Pop_Up: Card_Pop_Up_2)
        Generate_Background_Colour(Card_View_Controller: Menu_2_Background_View, Card_Index_Value: 2)
        Card_2_Background_View.layer.shadowColor = UIColor.black.cgColor
        Card_2_Background_View.layer.shadowOffset = CGSize(width: -10.0, height: 4.0)
        Card_2_Background_View.layer.shadowRadius = 15
        Card_2_Background_View.layer.masksToBounds = false
        Dismiss_Panel_2.layer.opacity = 0
        Menu_Dismiss_Panel_2.layer.opacity = 0
        Habit_Title_Field_2.delegate = self
        Habit_Title_Field_2.layer.opacity = 0
        Routine_Field_2.layer.opacity = 0
        Card_2_Background_View.layer.shouldRasterize = true
        Card_2_Background_View.layer.rasterizationScale = UIScreen.main.scale
        let Screen_Width = Card_2_Background_View.bounds.width
        Tile_Stack_2.spacing = 0.02*Screen_Width
        let Number_Of_Rows = Horizontal_Stacks_2.count
        for Index in 0 ..< Number_Of_Rows{
        Horizontal_Stacks_2[Index].spacing = 0.02*Screen_Width
        }
        Clear_Habit_Panel_2.layer.opacity = 0
        Modal_Dismiss_2.layer.opacity = 0
    }
    
     func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    Habit_Title_Field_2.layer.backgroundColor = UIColor.white.cgColor
    Copy_Habit_Title(Habit_Field: Habit_Title_Field_2, Habit_Title_Label: Habit_Label_2)
    return true
 }
   
    @IBAction func Card_2_Swipe_Up(_ sender: Any) {
        let Tile_Count_2 = Calculate_Percentage_Completed(Tile_Array: Panel_Grid_2)
        _ = Draw_Percentage_Circle(Graph_Canvas: Percentage_Circle_2, Count: Tile_Count_2.0, Card_Index_Value: 2)
        Percentage_Label_2.text = Tile_Count_2.1 + "%"
        Count_Label_2.text = String(Tile_Count_2.0) + "/60 Tiles"
        Card_Constraint_2.constant = 50
        Card_Pop_Flag_2 = true
        UIView.animate(withDuration: 0.6, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {self.view.layoutIfNeeded()
        self.Dismiss_Panel_2.layer.opacity = 0.2
        self.Habit_Title_Field_2.layer.opacity = 1
        self.Routine_Field_2.layer.opacity = 1
        },completion: nil)
    }
    
    @IBAction func Card_2_Swipe_Down(_ sender: Any) {
        Card_Constraint_2.constant = -370
        Card_Pop_Flag_2 = false
        UIView.animate(withDuration: 0.6, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {self.view.layoutIfNeeded()
        self.Dismiss_Panel_2.layer.opacity = 0
        self.Habit_Title_Field_2.layer.opacity = 0
        self.Routine_Field_2.layer.opacity = 0
        },completion: nil)
        _ = textFieldShouldReturn(Habit_Title_Field_2)
    }
    
   
/*************************************************************/
/*FUNCTIONS: VIEW CONTROLLER CARD 2*/
/*************************************************************/

    @IBAction func Edit_Button_2_Pressed(_ sender: Any) {
        if(Card_Pop_Flag_2 == false){
        let Tile_Count_2 = Calculate_Percentage_Completed(Tile_Array: Panel_Grid_2)
        _ = Draw_Percentage_Circle(Graph_Canvas: Percentage_Circle_2, Count: Tile_Count_2.0, Card_Index_Value: 2)
        Percentage_Label_2.text = Tile_Count_2.1 + "%"
        Count_Label_2.text = String(Tile_Count_2.0) + "/60 Tiles"
        Card_Constraint_2.constant = 50
        Card_Pop_Flag_2 = true
        UIView.animate(withDuration: 0.6, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {self.view.layoutIfNeeded()
        self.Dismiss_Panel_2.layer.opacity = 0.2
        self.Habit_Title_Field_2.layer.opacity = 1
        self.Routine_Field_2.layer.opacity = 1
        },completion: nil)
            }
            
        else{
        Card_Constraint_2.constant = -370
        Card_Pop_Flag_2 = false
        UIView.animate(withDuration: 0.6, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {self.view.layoutIfNeeded()
        self.Dismiss_Panel_2.layer.opacity = 0
        self.Habit_Title_Field_2.layer.opacity = 0
        self.Routine_Field_2.layer.opacity = 0
        },completion: nil)
        _ = textFieldShouldReturn(Habit_Title_Field_2)
            }
            
        Left_Menu_2_Sliding_Constraint.constant = 0
        Right_Menu_2_Sliding_Constraint.constant = 0
        Menu_Slide_2 = false
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseIn, animations: {self.view.layoutIfNeeded()
        self.Card_2_Background_View.layer.shadowOpacity = 0
        self.Menu_Dismiss_Panel_2.layer.opacity = 0
        }, completion: nil)
            
    }

    @IBAction func Menu_2_Button(_ sender: Any) {
        if Menu_Slide_2 == false{
        Left_Menu_2_Sliding_Constraint.constant = 170
        Right_Menu_2_Sliding_Constraint.constant = -170
        Menu_Slide_2 = true
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseIn, animations: {self.view.layoutIfNeeded()
        self.Card_2_Background_View.layer.shadowOpacity = 0.2
        self.Menu_Dismiss_Panel_2.layer.opacity = 0.5
        }, completion: nil)
        _ = textFieldShouldReturn(Habit_Title_Field_2)
        Card_Constraint_2.constant = -370
        Card_Pop_Flag_2 = false
        UIView.animate(withDuration: 1, delay: 0.25, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {self.view.layoutIfNeeded()
        self.Dismiss_Panel_2.layer.opacity = 0
        self.Habit_Title_Field_2.layer.opacity = 0
        self.Routine_Field_2.layer.opacity = 0
        },completion: nil)
        }
    
        else{
        Left_Menu_2_Sliding_Constraint.constant = 0
        Right_Menu_2_Sliding_Constraint.constant = 0
        Menu_Slide_2 = false
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseIn, animations: {self.view.layoutIfNeeded()
        self.Card_2_Background_View.layer.shadowOpacity = 0
        self.Menu_Dismiss_Panel_2.layer.opacity = 0
        }, completion: nil)
        }
    }


    @IBAction func Card_Button_Pop_Pressed_2(_ sender: Any) {
        if(Card_Pop_Flag_2 == false){
        let Tile_Count_2 = Calculate_Percentage_Completed(Tile_Array: Panel_Grid_2)
        _ = Draw_Percentage_Circle(Graph_Canvas: Percentage_Circle_2, Count: Tile_Count_2.0, Card_Index_Value: 2)
        Percentage_Label_2.text = Tile_Count_2.1 + "%"
        Count_Label_2.text = String(Tile_Count_2.0) + "/60 Tiles"
        Card_Constraint_2.constant = 50
        Card_Pop_Flag_2 = true
        UIView.animate(withDuration: 0.6, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {self.view.layoutIfNeeded()
        self.Dismiss_Panel_2.layer.opacity = 0.2
        self.Habit_Title_Field_2.layer.opacity = 1
        self.Routine_Field_2.layer.opacity = 1
        },completion: nil)
            }
            
        else{
        Card_Constraint_2.constant = -370
        Card_Pop_Flag_2 = false
        UIView.animate(withDuration: 0.6, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {self.view.layoutIfNeeded()
        self.Dismiss_Panel_2.layer.opacity = 0
        self.Habit_Title_Field_2.layer.opacity = 0
        self.Routine_Field_2.layer.opacity = 0
        },completion: nil)
        _ = textFieldShouldReturn(Habit_Title_Field_2)
            }
            
    }
    
        @IBAction func Dismiss_Card_2(_ sender: Any) {
        Card_Constraint_2.constant = -370
        Card_Pop_Flag_2 = false
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {self.view.layoutIfNeeded()
        self.Dismiss_Panel_2.layer.opacity = 0
        self.Habit_Title_Field_2.layer.opacity = 0
        self.Routine_Field_2.layer.opacity = 0
        },completion: nil)
        _ = textFieldShouldReturn(Habit_Title_Field_2)
    }
    
    
    @IBAction func Dismiss_Menu_2(_ sender: Any) {
        Left_Menu_2_Sliding_Constraint.constant = 0
        Right_Menu_2_Sliding_Constraint.constant = 0
        Menu_Slide_2 = false
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseIn, animations: {self.view.layoutIfNeeded()
        self.Card_2_Background_View.layer.shadowOpacity = 0
        self.Menu_Dismiss_Panel_2.layer.opacity = 0
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
        let Blue_Strength = (130+(1.2*CGFloat(Day!)))

        if(Panel_Grid_2[Tile_Array_Index] == 0){
            Panel_Grid_2[Tile_Array_Index] = 1;
            UIButton.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn, animations: {
            self.Tile_Collection_2[Tile_Array_Index].backgroundColor = UIColor.init(red:CGFloat(255-(1.2*CGFloat(Day!)))/255, green:41/255, blue: Blue_Strength/255, alpha: 1/1);}, completion: nil)
            self.Tile_Collection_2[Tile_Array_Index].setTitleColor(.white, for: .normal)
        }
        else{
            Panel_Grid_2[Tile_Array_Index] = 0;
            UIButton.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn, animations: {
            self.Tile_Collection_2[Tile_Array_Index].backgroundColor = .systemGray6}, completion: nil)
            let Tile_Text_Colour_2 = UIColor(red:255/255,green:41/255,blue:130/255,alpha:0.7/1)
            self.Tile_Collection_2[Tile_Array_Index].setTitleColor(Tile_Text_Colour_2, for: .normal)
        }
        

}


    @IBAction func Habit_Title_2_Pressed(_ sender: Any) {
    Habit_Title_Field_2.layer.backgroundColor = UIColor.systemGray6.cgColor
    }
    
    let Keyboard_Dimiss = Notification.Name(rawValue: Swipe_And_Dismiss_Notification_Key)

    func Create_Keyboard_Observer_2(){
    NotificationCenter.default.addObserver(self, selector: #selector(Card_2_View_Controller.Dimiss_Keyboard_And_Text_Field_Editing), name: Keyboard_Dimiss, object: nil)
    }
    
    @objc func Dimiss_Keyboard_And_Text_Field_Editing(notification: NSNotification){
//    _ = textFieldShouldReturn(Habit_Title_Field_2)
    Habit_Title_Field_2.layer.backgroundColor = UIColor.white.cgColor
    }
    
    @IBAction func Reminder_2_Pressed(_ sender: UISwitch) {
    if(Reminder_Switch_State_2 == false){
    performSegue(withIdentifier: "Reminder_2", sender: nil)
    Reminder_Switch_State_2 = true
    }
    else{
        Reminder_Switch_State_2 = false
    }
    }
    
        @IBAction func Clear_Button_2_Pressed(_ sender: Any) {
        

        UIButton.animate(withDuration: 0.1,
        animations: {
        self.Clear_Button_2.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        },
        completion: { _ in
        UIButton.animate(withDuration: 0.1) {
        self.Clear_Button_2.transform = CGAffineTransform.identity
        }
        })
    
        Card_Constraint_2.constant = -370
        Card_Pop_Flag_2 = false
        UIView.animate(withDuration: 1.0, delay: 0.2, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {self.view.layoutIfNeeded()
        self.Habit_Title_Field_2.layer.opacity = 0
        self.Routine_Field_2.layer.opacity = 0
        self.Dismiss_Panel_2.layer.opacity = 0
        self.Modal_Dismiss_2.layer.opacity = 0.5
        },completion: nil)
        _ = textFieldShouldReturn(Habit_Title_Field_2)

    UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {self.view.layoutIfNeeded()
    self.Clear_Habit_Panel_2.layer.opacity = 1
    },completion: nil)

    }
    
    @IBAction func Clear_Modal_Dismiss_2(_ sender: Any) {
    UIView.animate(withDuration: 0.5, delay: 0.15, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {self.view.layoutIfNeeded()
    self.Clear_Habit_Panel_2.layer.opacity = 0
    self.Modal_Dismiss_2.layer.opacity = 0
    },completion: nil)
    }
    
    @IBAction func Cancel_Button_2(_ sender: UIButton) {
    UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseOut, animations: {
    sender.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
    self.Clear_Habit_Panel_2.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
    },
    completion: { _ in
    UIView.animate(withDuration: 0.1) {
    sender.transform = CGAffineTransform.identity
    self.Clear_Habit_Panel_2.transform = CGAffineTransform.identity
    }
    })
    }
    
    @IBAction func Confirm_Button_2(_ sender: UIButton) {
    UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseOut, animations: {
    sender.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
    self.Clear_Habit_Panel_2.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
    },
    completion: { _ in
    UIView.animate(withDuration: 0.1) {
    sender.transform = CGAffineTransform.identity
    self.Clear_Habit_Panel_2.transform = CGAffineTransform.identity
    self.Habit_Label_2.text = ""
    }
    })
    
    Habit_Title_Field_2.text = ""
    
    Panel_Grid_2 = Array(repeating: 0, count: 60)
    Clear_Panel_Grid(Panel_Grid: Tile_Collection_2!, Habit_Card_Index: 2)
    
    UIView.animate(withDuration: 0.5, delay: 0.3, options: .curveEaseOut, animations: {
    self.view.layoutIfNeeded()
    self.Clear_Habit_Panel_2.layer.opacity = 0
    self.Modal_Dismiss_2.layer.opacity = 0
    },completion: nil)
    }
    
    

}
