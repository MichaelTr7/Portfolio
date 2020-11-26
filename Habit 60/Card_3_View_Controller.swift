//
//  Card_3_View_Controller.swift
//  Habit 60 Refactor
//
//  Created by MichaelTr on 2020-08-27.
//  Copyright © 2020 Michael Troeung. All rights reserved.
//

import UIKit

var Menu_Slide_3 = false
var Card_Pop_Flag_3 = false
var Reminder_Switch_State_3 = false
var Panel_Grid_3: [Int] = Array(repeating: 0, count: 60)

class Card_3_View_Controller: UIViewController, UITextFieldDelegate {

    // Constraint variables
    @IBOutlet weak var Left_Menu_3_Sliding_Constraint: NSLayoutConstraint!
    @IBOutlet weak var Right_Menu_3_Sliding_Constraint: NSLayoutConstraint!
    @IBOutlet weak var Card_Constraint_3: NSLayoutConstraint!

    // Buttons
    @IBOutlet weak var Card_Button_Pop_3: UIButton!
    @IBOutlet weak var Clear_Button_3: Clear_Panel_Buttons!
    @IBOutlet weak var Modal_Dismiss_3: UIButton!
    @IBOutlet var Tile_Collection_3: [Rounded_Buttons_3]!
    
    // Views
    @IBOutlet weak var Card_Pop_Up_3: UIView!
    @IBOutlet weak var Card_3_Background_View: UIView!
    @IBOutlet weak var Menu_3_Background_View: UIView!
    @IBOutlet weak var Dismiss_Panel_3: UIView!
    @IBOutlet weak var Menu_Dismiss_Panel_3: UIView!
    @IBOutlet weak var Percentage_Circle_3: UIView!
    @IBOutlet weak var Clear_Habit_Panel_3: UIView!
    
    // Input text fields
    @IBOutlet weak var Habit_Title_Field_3: UITextField!
    @IBOutlet weak var Routine_Field_3: Frequency_Picker_Field_3!
    
    // Labels
    @IBOutlet weak var Percentage_Label_3: UILabel!
    @IBOutlet weak var Count_Label_3: UILabel!
    @IBOutlet weak var Habit_Label_3: UILabel!
    
    // Stacks
    @IBOutlet weak var Tile_Stack_3: UIStackView!
    @IBOutlet var Horizontal_Stacks_3: [UIStackView]!
    
    // Toggle switches
    @IBOutlet weak var Reminder_Toggle_3: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Create_Keyboard_Observer_3()
        Card_Pop_Up_Style(Card_Pop_Up: Card_Pop_Up_3)
        Generate_Background_Colour(Card_View_Controller: Menu_3_Background_View, Card_Index_Value: 3)
        Card_3_Background_View.layer.shadowColor = UIColor.black.cgColor
        Card_3_Background_View.layer.shadowOffset = CGSize(width: -10.0, height: 4.0)
        Card_3_Background_View.layer.shadowRadius = 15
        Card_3_Background_View.layer.masksToBounds = false
        Dismiss_Panel_3.layer.opacity = 0
        Menu_Dismiss_Panel_3.layer.opacity = 0
        Habit_Title_Field_3.delegate = self
        self.Habit_Title_Field_3.layer.opacity = 0
        self.Routine_Field_3.layer.opacity = 0
        let Screen_Width = Card_3_Background_View.bounds.width
        Tile_Stack_3.spacing = 0.02*Screen_Width
        let Number_Of_Rows = Horizontal_Stacks_3.count
        for Index in 0 ..< Number_Of_Rows{
        Horizontal_Stacks_3[Index].spacing = 0.02*Screen_Width
        }
        Clear_Habit_Panel_3.layer.opacity = 0
        Modal_Dismiss_3.layer.opacity = 0
    }

 func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    Habit_Title_Field_3.layer.backgroundColor = UIColor.white.cgColor
    Copy_Habit_Title(Habit_Field: Habit_Title_Field_3, Habit_Title_Label: Habit_Label_3)
    return true
 }

    @IBAction func Card_3_Swipe_Up(_ sender: Any) {
        let Tile_Count_3 = Calculate_Percentage_Completed(Tile_Array: Panel_Grid_3)
        _ = Draw_Percentage_Circle(Graph_Canvas: Percentage_Circle_3, Count: Tile_Count_3.0, Card_Index_Value: 3)
        Percentage_Label_3.text = Tile_Count_3.1 + "%"
        Count_Label_3.text = String(Tile_Count_3.0) + "/60 Tiles"
        Card_Constraint_3.constant = 50
        Card_Pop_Flag_3 = true
        UIView.animate(withDuration: 0.6, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {self.view.layoutIfNeeded()
        self.Dismiss_Panel_3.layer.opacity = 0.2
        self.Habit_Title_Field_3.layer.opacity = 1
        self.Routine_Field_3.layer.opacity = 1
        },completion: nil)
    }
    
    @IBAction func Card_3_Swipe_Down(_ sender: Any) {
        Card_Constraint_3.constant = -370
        Card_Pop_Flag_3 = false
        UIView.animate(withDuration: 0.6, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseIn,animations: {self.view.layoutIfNeeded()
        self.Dismiss_Panel_3.layer.opacity = 0
        self.Habit_Title_Field_3.layer.opacity = 0
        self.Routine_Field_3.layer.opacity = 0
        },completion: nil)
        _ = textFieldShouldReturn(Habit_Title_Field_3)
    }
    

/*************************************************************/
/*FUNCTIONS: VIEW CONTROLLER CARD 3*/
/*************************************************************/

    @IBAction func Edit_Button_3_Pressed(_ sender: Any) {
        if(Card_Pop_Flag_3 == false){
        let Tile_Count_3 = Calculate_Percentage_Completed(Tile_Array: Panel_Grid_3)
        _ = Draw_Percentage_Circle(Graph_Canvas: Percentage_Circle_3, Count: Tile_Count_3.0, Card_Index_Value: 3)
        Percentage_Label_3.text = Tile_Count_3.1 + "%"
        Count_Label_3.text = String(Tile_Count_3.0) + "/60 Tiles"
        Card_Constraint_3.constant = 50
        Card_Pop_Flag_3 = true
        UIView.animate(withDuration: 0.6, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveLinear,animations: {self.view.layoutIfNeeded()
        self.Dismiss_Panel_3.layer.opacity = 0.2
        self.Habit_Title_Field_3.layer.opacity = 1
        self.Routine_Field_3.layer.opacity = 1
        },completion: nil)
            }
            
        else{
        Card_Constraint_3.constant = -370
        Card_Pop_Flag_3 = false
        UIView.animate(withDuration: 0.6, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveLinear,animations: {self.view.layoutIfNeeded()
        self.Dismiss_Panel_3.layer.opacity = 0
        self.Habit_Title_Field_3.layer.opacity = 0
        self.Routine_Field_3.layer.opacity = 0
        },completion: nil)
        _ = textFieldShouldReturn(Habit_Title_Field_3)
            }
            
        Left_Menu_3_Sliding_Constraint.constant = 0
        Right_Menu_3_Sliding_Constraint.constant = 0
        Menu_Slide_3 = false
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseIn, animations: {self.view.layoutIfNeeded()
        self.Card_3_Background_View.layer.shadowOpacity = 0
        self.Menu_Dismiss_Panel_3.layer.opacity = 0
        }, completion: nil)
        
    }

    @IBAction func Menu_Button_3(_ sender: Any) {
    
    
        if Menu_Slide_3 == false{
        Left_Menu_3_Sliding_Constraint.constant = 170
        Right_Menu_3_Sliding_Constraint.constant = -170
        Menu_Slide_3 = true
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseIn, animations: {self.view.layoutIfNeeded()
        self.Card_3_Background_View.layer.shadowOpacity = 0.2
        self.Menu_Dismiss_Panel_3.layer.opacity = 0.5
        }, completion: nil)
        _ = textFieldShouldReturn(Habit_Title_Field_3)
        Card_Constraint_3.constant = -370
        Card_Pop_Flag_3 = false
        UIView.animate(withDuration: 1, delay: 0.25, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {self.view.layoutIfNeeded()
        self.Dismiss_Panel_3.layer.opacity = 0
        self.Habit_Title_Field_3.layer.opacity = 0
        self.Routine_Field_3.layer.opacity = 0
        },completion: nil)
        }
    
        else{
        Left_Menu_3_Sliding_Constraint.constant = 0
        Right_Menu_3_Sliding_Constraint.constant = 0
        Menu_Slide_3 = false
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseIn, animations: {self.view.layoutIfNeeded()
        self.Card_3_Background_View.layer.shadowOpacity = 0
        self.Menu_Dismiss_Panel_3.layer.opacity = 0
        }, completion: nil)
        }
    }
    
    @IBAction func Card_Button_Pop_Pressed_3(_ sender: Any) {
        if(Card_Pop_Flag_3 == false){
        let Tile_Count_3 = Calculate_Percentage_Completed(Tile_Array: Panel_Grid_3)
        _ = Draw_Percentage_Circle(Graph_Canvas: Percentage_Circle_3, Count: Tile_Count_3.0, Card_Index_Value: 3)
        Percentage_Label_3.text = Tile_Count_3.1 + "%"
        Count_Label_3.text = String(Tile_Count_3.0) + "/60 Tiles"
        Card_Constraint_3.constant = 50
        Card_Pop_Flag_3 = true
        UIView.animate(withDuration: 0.6, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveLinear,animations: {self.view.layoutIfNeeded()
        self.Dismiss_Panel_3.layer.opacity = 0.2
        self.Habit_Title_Field_3.layer.opacity = 1
        self.Routine_Field_3.layer.opacity = 1
        },completion: nil)
            }
            
        else{
        Card_Constraint_3.constant = -370
        Card_Pop_Flag_3 = false
        UIView.animate(withDuration: 0.6, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveLinear,animations: {self.view.layoutIfNeeded()
        self.Dismiss_Panel_3.layer.opacity = 0
        self.Habit_Title_Field_3.layer.opacity = 0
        self.Routine_Field_3.layer.opacity = 0
        },completion: nil)
        _ = textFieldShouldReturn(Habit_Title_Field_3)
            }

    }

        @IBAction func Dismiss_Card_3(_ sender: Any) {
        Card_Constraint_3.constant = -370
        Card_Pop_Flag_3 = false
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {self.view.layoutIfNeeded()
        self.Dismiss_Panel_3.layer.opacity = 0
        self.Habit_Title_Field_3.layer.opacity = 0
        self.Routine_Field_3.layer.opacity = 0
        },completion: nil)
        _ = textFieldShouldReturn(Habit_Title_Field_3)
    }
    
    
    @IBAction func Dismiss_Menu_3(_ sender: Any) {
        Left_Menu_3_Sliding_Constraint.constant = 0
        Right_Menu_3_Sliding_Constraint.constant = 0
        Menu_Slide_3 = false
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseIn, animations: {self.view.layoutIfNeeded()
        self.Card_3_Background_View.layer.shadowOpacity = 0
        self.Menu_Dismiss_Panel_3.layer.opacity = 0
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
        let Red_Strength = (75-(0.5*CGFloat(Day!)))

        if(Panel_Grid_3[Tile_Array_Index] == 0){
            Panel_Grid_3[Tile_Array_Index] = 1;
            let Green_Strength = (237-(1.2*CGFloat(Day!)))
            UIButton.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn, animations: {
            self.Tile_Collection_3[Tile_Array_Index].backgroundColor = UIColor.init(red:Red_Strength/255, green:Green_Strength/255, blue: 17/255, alpha: 1/1);}, completion: nil)
            self.Tile_Collection_3[Tile_Array_Index].setTitleColor(.white, for: .normal)
        }
        else{
            Panel_Grid_3[Tile_Array_Index] = 0;
            UIButton.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn, animations: {
            self.Tile_Collection_3[Tile_Array_Index].backgroundColor = .systemGray6}, completion: nil)
            let Tile_Text_Colour_3 = UIColor(red:75/255,green:237/255,blue:17/255,alpha:0.7/1)
            self.Tile_Collection_3[Tile_Array_Index].setTitleColor(Tile_Text_Colour_3, for: .normal)
        }
        

}
    
    let Keyboard_Dimiss = Notification.Name(rawValue: Swipe_And_Dismiss_Notification_Key)

    func Create_Keyboard_Observer_3(){
    NotificationCenter.default.addObserver(self, selector: #selector(Card_3_View_Controller.Dimiss_Keyboard_And_Text_Field_Editing), name: Keyboard_Dimiss, object: nil)
    }
    
    @objc func Dimiss_Keyboard_And_Text_Field_Editing(notification: NSNotification){
//    _ = textFieldShouldReturn(Habit_Title_Field_3)
    Habit_Title_Field_3.layer.backgroundColor = UIColor.white.cgColor
    }
    
    @IBAction func Habit_Title_3_Pressed(_ sender: Any) {
    Habit_Title_Field_3.layer.backgroundColor = UIColor.systemGray6.cgColor
    }
    
    @IBAction func Reminder_3_Pressed(_ sender: UISwitch) {
    if(Reminder_Switch_State_3 == false){
    performSegue(withIdentifier: "Reminder_3", sender: nil)
    Reminder_Switch_State_3 = true
    }
    else{
        Reminder_Switch_State_3 = false
    }
    }

    @IBAction func Clear_Button_3_Pressed(_ sender: Any) {
    

    UIButton.animate(withDuration: 0.1,
    animations: {
    self.Clear_Button_3.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
    },
    completion: { _ in
    UIButton.animate(withDuration: 0.1) {
    self.Clear_Button_3.transform = CGAffineTransform.identity
    }
    })

    Card_Constraint_3.constant = -370
    Card_Pop_Flag_3 = false
    UIView.animate(withDuration: 1.0, delay: 0.2, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {self.view.layoutIfNeeded()
    self.Habit_Title_Field_3.layer.opacity = 0
    self.Routine_Field_3.layer.opacity = 0
    self.Dismiss_Panel_3.layer.opacity = 0
    self.Modal_Dismiss_3.layer.opacity = 0.5
    },completion: nil)
    _ = textFieldShouldReturn(Habit_Title_Field_3)

    UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {self.view.layoutIfNeeded()
    self.Clear_Habit_Panel_3.layer.opacity = 1
    },completion: nil)
}

    @IBAction func Clear_Modal_Dismiss_3(_ sender: Any) {
    UIView.animate(withDuration: 0.5, delay: 0.15, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {self.view.layoutIfNeeded()
    self.Clear_Habit_Panel_3.layer.opacity = 0
    self.Modal_Dismiss_3.layer.opacity = 0

    },completion: nil)
    }
    
    @IBAction func Cancel_Button_3(_ sender: UIButton) {
    UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseOut, animations: {
    sender.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
    self.Clear_Habit_Panel_3.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
    },
    completion: { _ in
    UIView.animate(withDuration: 0.1) {
    sender.transform = CGAffineTransform.identity
    self.Clear_Habit_Panel_3.transform = CGAffineTransform.identity
    }
    })
    }

    @IBAction func Confirm_Button_3(_ sender: UIButton) {
    UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseOut, animations: {
    sender.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
    self.Clear_Habit_Panel_3.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
    },
    completion: { _ in
    UIView.animate(withDuration: 0.1) {
    sender.transform = CGAffineTransform.identity
    self.Clear_Habit_Panel_3.transform = CGAffineTransform.identity
    self.Habit_Label_3.text = ""
    }
    })
    
    Habit_Title_Field_3.text = ""
    
    Panel_Grid_3 = Array(repeating: 0, count: 60)
    Clear_Panel_Grid(Panel_Grid: Tile_Collection_3!, Habit_Card_Index: 3)
    
    UIView.animate(withDuration: 0.5, delay: 0.3, options: .curveEaseOut, animations: {
    self.view.layoutIfNeeded()
    self.Clear_Habit_Panel_3.layer.opacity = 0
    self.Modal_Dismiss_3.layer.opacity = 0
    },completion: nil)
    }



}
