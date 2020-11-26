//
//  Card_4_View_Controller.swift
//  Habit 60 Refactor
//
//  Created by MichaelTr on 2020-08-27.
//  Copyright © 2020 Michael Troeung. All rights reserved.
//

import UIKit

var Menu_Slide_4 = false
var Card_Pop_Flag_4 = false
var Reminder_Switch_State_4 = false
var Panel_Grid_4: [Int] = Array(repeating: 0, count: 60)



class Card_4_View_Controller: UIViewController, UITextFieldDelegate {
    
    
    
    // Constraint variables
    @IBOutlet weak var Left_Menu_4_Sliding_Constraint: NSLayoutConstraint!
    @IBOutlet weak var Right_Menu_4_Sliding_Constraint: NSLayoutConstraint!
    @IBOutlet weak var Card_Constraint_4: NSLayoutConstraint!

    // Buttons
    @IBOutlet weak var Card_Button_Pop_4: UIButton!
    @IBOutlet weak var Clear_Button_4: Clear_Panel_Buttons!
    @IBOutlet weak var Modal_Dismiss_4: UIButton!
    @IBOutlet var Tile_Collection_4: [Rounded_Buttons_4]!

    // Views
    @IBOutlet weak var Card_Pop_Up_4: UIView!
    @IBOutlet weak var Card_4_Background_View: UIView!
    @IBOutlet weak var Menu_4_Background_View: UIView!
    @IBOutlet weak var Dismiss_Panel_4: UIView!
    @IBOutlet weak var Menu_Dismiss_Panel_4: UIView!
    @IBOutlet weak var Percentage_Circle_4: UIView!
    @IBOutlet weak var Clear_Habit_Panel_4: UIView!
    
    // Input text fields
    @IBOutlet weak var Habit_Title_Field_4: UITextField!
    @IBOutlet weak var Routine_Field_4: Frequency_Picker_Field_4!
    
    // Labels
    @IBOutlet weak var Percentage_Label_4: UILabel!
    @IBOutlet weak var Count_Label_4: UILabel!
    @IBOutlet weak var Habit_Label_4: UILabel!
    
    // Stacks
    @IBOutlet weak var Tile_Stack_4: UIStackView!
    @IBOutlet var Horizontal_Stacks_4: [UIStackView]!
    
    // Toggle switches
    @IBOutlet weak var Reminder_Toggle_4: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Create_Keyboard_Observer_4()
        Card_Pop_Up_Style(Card_Pop_Up: Card_Pop_Up_4)
        Generate_Background_Colour(Card_View_Controller: Menu_4_Background_View, Card_Index_Value: 4)
        Card_4_Background_View.layer.shadowColor = UIColor.black.cgColor
        Card_4_Background_View.layer.shadowOffset = CGSize(width: -10.0, height: 4.0)
        Card_4_Background_View.layer.shadowRadius = 15
        Card_4_Background_View.layer.masksToBounds = false
        Dismiss_Panel_4.layer.opacity = 0
        Menu_Dismiss_Panel_4.layer.opacity = 0
        Habit_Title_Field_4.delegate = self
        Habit_Title_Field_4.layer.opacity = 0
        Routine_Field_4.layer.opacity = 0
        let Screen_Width = Card_4_Background_View.bounds.width
        Tile_Stack_4.spacing = 0.02*Screen_Width
        let Number_Of_Rows = Horizontal_Stacks_4.count
        for Index in 0 ..< Number_Of_Rows{
        Horizontal_Stacks_4[Index].spacing = 0.02*Screen_Width
        }
        Clear_Habit_Panel_4.layer.opacity = 0
        Modal_Dismiss_4.layer.opacity = 0
    }
    
     func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    Habit_Title_Field_4.layer.backgroundColor = UIColor.white.cgColor
    Copy_Habit_Title(Habit_Field: Habit_Title_Field_4, Habit_Title_Label: Habit_Label_4)
    return true
 }
    
    @IBAction func Card_4_Swipe_Up(_ sender: Any) {
        let Tile_Count_4 = Calculate_Percentage_Completed(Tile_Array: Panel_Grid_4)
        _ = Draw_Percentage_Circle(Graph_Canvas: Percentage_Circle_4, Count: Tile_Count_4.0, Card_Index_Value: 4)
        Percentage_Label_4.text = Tile_Count_4.1 + "%"
        Count_Label_4.text = String(Tile_Count_4.0) + "/60 Tiles"
        Card_Constraint_4.constant = 50
        Card_Pop_Flag_4 = true
        UIView.animate(withDuration: 0.6, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {self.view.layoutIfNeeded()
        self.Dismiss_Panel_4.layer.opacity = 0.2
        self.Habit_Title_Field_4.layer.opacity = 1
        self.Routine_Field_4.layer.opacity = 1
        },completion: nil)
    }
    
    @IBAction func Card_4_Swipe_Down(_ sender: Any) {
        Card_Constraint_4.constant = -370
        Card_Pop_Flag_4 = false
        UIView.animate(withDuration: 0.6, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseIn,animations: {self.view.layoutIfNeeded()
        self.Dismiss_Panel_4.layer.opacity = 0
        self.Habit_Title_Field_4.layer.opacity = 0
        self.Routine_Field_4.layer.opacity = 0
        },completion: nil)
        _ = textFieldShouldReturn(Habit_Title_Field_4)
    }
    
    
/*************************************************************/
/*FUNCTIONS: VIEW CONTROLLER CARD 4*/
/*************************************************************/

@IBAction func Edit_Button_4_Pressed(_ sender: Any) {
        if(Card_Pop_Flag_4 == false){
        let Tile_Count_4 = Calculate_Percentage_Completed(Tile_Array: Panel_Grid_4)
        _ = Draw_Percentage_Circle(Graph_Canvas: Percentage_Circle_4, Count: Tile_Count_4.0, Card_Index_Value: 4)
        Percentage_Label_4.text = Tile_Count_4.1 + "%"
        Count_Label_4.text = String(Tile_Count_4.0) + "/60 Tiles"
        Card_Constraint_4.constant = 50
        Card_Pop_Flag_4 = true
        UIView.animate(withDuration: 0.6, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {self.view.layoutIfNeeded()
        self.Dismiss_Panel_4.layer.opacity = 0.2
        self.Habit_Title_Field_4.layer.opacity = 1
        self.Routine_Field_4.layer.opacity = 1
        },completion: nil)
            }
        else{
        Card_Constraint_4.constant = -370
        Card_Pop_Flag_4 = false
        UIView.animate(withDuration: 0.6, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {self.view.layoutIfNeeded()
        self.Dismiss_Panel_4.layer.opacity = 0
        self.Habit_Title_Field_4.layer.opacity = 0
        self.Routine_Field_4.layer.opacity = 0
        },completion: nil)
        _ = textFieldShouldReturn(Habit_Title_Field_4)
            }
            
        Left_Menu_4_Sliding_Constraint.constant = 0
        Right_Menu_4_Sliding_Constraint.constant = 0
        Menu_Slide_4 = false
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseIn, animations: {self.view.layoutIfNeeded()
        self.Card_4_Background_View.layer.shadowOpacity = 0
        self.Menu_Dismiss_Panel_4.layer.opacity = 0
        }, completion: nil)
            
}
    
    
    
    @IBAction func Menu_Button_4(_ sender: Any) {
        if Menu_Slide_4 == false{
        Left_Menu_4_Sliding_Constraint.constant = 170
        Right_Menu_4_Sliding_Constraint.constant = -170
        Menu_Slide_4 = true
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseIn, animations: {self.view.layoutIfNeeded()
        self.Card_4_Background_View.layer.shadowOpacity = 0.2
        self.Menu_Dismiss_Panel_4.layer.opacity = 0.5
        self.Habit_Title_Field_4.layer.opacity = 0
        self.Routine_Field_4.layer.opacity = 0
        }, completion: nil)
        _ = textFieldShouldReturn(Habit_Title_Field_4)
        Card_Constraint_4.constant = -370
        Card_Pop_Flag_4 = false
        UIView.animate(withDuration: 1, delay: 0.25, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {self.view.layoutIfNeeded()
        self.Dismiss_Panel_4.layer.opacity = 0
        },completion: nil)
        }
    
        else{
        Left_Menu_4_Sliding_Constraint.constant = 0
        Right_Menu_4_Sliding_Constraint.constant = 0
        Menu_Slide_4 = false
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseIn, animations: {self.view.layoutIfNeeded()
        self.Card_4_Background_View.layer.shadowOpacity = 0
        self.Menu_Dismiss_Panel_4.layer.opacity = 0
        }, completion: nil)
        }
    }
    
    @IBAction func Card_Button_Pop_Pressed_4(_ sender: Any) {
        if(Card_Pop_Flag_4 == false){
        let Tile_Count_4 = Calculate_Percentage_Completed(Tile_Array: Panel_Grid_4)
        _ = Draw_Percentage_Circle(Graph_Canvas: Percentage_Circle_4, Count: Tile_Count_4.0, Card_Index_Value: 4)
        Percentage_Label_4.text = Tile_Count_4.1 + "%"
        Count_Label_4.text = String(Tile_Count_4.0) + "/60 Tiles"
        Card_Constraint_4.constant = 50
        Card_Pop_Flag_4 = true
        UIView.animate(withDuration: 0.6, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {self.view.layoutIfNeeded()
        self.Dismiss_Panel_4.layer.opacity = 0.2
        self.Habit_Title_Field_4.layer.opacity = 1
        self.Routine_Field_4.layer.opacity = 1
        },completion: nil)
            }
        else{
        Card_Constraint_4.constant = -370
        Card_Pop_Flag_4 = false
        UIView.animate(withDuration: 0.6, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {self.view.layoutIfNeeded()
        self.Dismiss_Panel_4.layer.opacity = 0
        self.Habit_Title_Field_4.layer.opacity = 0
        self.Routine_Field_4.layer.opacity = 0
        },completion: nil)
        _ = textFieldShouldReturn(Habit_Title_Field_4)
            }
    }
    
        @IBAction func Dismiss_Card_4(_ sender: Any) {
        Card_Constraint_4.constant = -370
        Card_Pop_Flag_4 = false
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {self.view.layoutIfNeeded()
        self.Dismiss_Panel_4.layer.opacity = 0
        self.Habit_Title_Field_4.layer.opacity = 0
        self.Routine_Field_4.layer.opacity = 0
        },completion: nil)
        _ = textFieldShouldReturn(Habit_Title_Field_4)
    }
    
    
    @IBAction func Dismiss_Menu_4(_ sender: Any) {
        Left_Menu_4_Sliding_Constraint.constant = 0
        Right_Menu_4_Sliding_Constraint.constant = 0
        Menu_Slide_4 = false
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseIn, animations: {self.view.layoutIfNeeded()
        self.Card_4_Background_View.layer.shadowOpacity = 0
        self.Menu_Dismiss_Panel_4.layer.opacity = 0
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

        if(Panel_Grid_4[Tile_Array_Index] == 0){
            Panel_Grid_4[Tile_Array_Index] = 1;
            let Green_Strength = (153-(1.2*CGFloat(Day!)))
            UIButton.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn, animations: {
            self.Tile_Collection_4[Tile_Array_Index].backgroundColor = UIColor.init(red:255/255, green:Green_Strength/255, blue: 0/255, alpha: 1/1);}, completion: nil)
            self.Tile_Collection_4[Tile_Array_Index].setTitleColor(.white, for: .normal)
        }
        else{
            Panel_Grid_4[Tile_Array_Index] = 0;
            UIButton.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn, animations: {
            self.Tile_Collection_4[Tile_Array_Index].backgroundColor = .systemGray6}, completion: nil)
            let Tile_Text_Colour_4 = UIColor(red:255/255,green:153/255,blue:0/255,alpha:0.7/1)
            self.Tile_Collection_4[Tile_Array_Index].setTitleColor(Tile_Text_Colour_4, for: .normal)
        }
        

}
    
    let Keyboard_Dimiss = Notification.Name(rawValue: Swipe_And_Dismiss_Notification_Key)

    func Create_Keyboard_Observer_4(){
    NotificationCenter.default.addObserver(self, selector: #selector(Card_4_View_Controller.Dimiss_Keyboard_And_Text_Field_Editing), name: Keyboard_Dimiss, object: nil)
    }
    
    @objc func Dimiss_Keyboard_And_Text_Field_Editing(notification: NSNotification){
//    _ = textFieldShouldReturn(Habit_Title_Field_4)
    Habit_Title_Field_4.layer.backgroundColor = UIColor.white.cgColor
    }

    @IBAction func Habit_Title_4_Pressed(_ sender: Any) {
    Habit_Title_Field_4.layer.backgroundColor = UIColor.systemGray6.cgColor
    }
    
    @IBAction func Reminder_4_Pressed(_ sender: UISwitch) {
    if(Reminder_Switch_State_4 == false){
    performSegue(withIdentifier: "Reminder_4", sender: nil)
    Reminder_Switch_State_4 = true
    }
    else{
        Reminder_Switch_State_4 = false
    }
    }
    
    @IBAction func Clear_Button_4_Pressed(_ sender: Any) {
    

    UIButton.animate(withDuration: 0.1,
    animations: {
    self.Clear_Button_4.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
    },
    completion: { _ in
    UIButton.animate(withDuration: 0.1) {
    self.Clear_Button_4.transform = CGAffineTransform.identity
    }
    })

    Card_Constraint_4.constant = -370
    Card_Pop_Flag_4 = false
    UIView.animate(withDuration: 1.0, delay: 0.2, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {self.view.layoutIfNeeded()
    self.Habit_Title_Field_4.layer.opacity = 0
    self.Routine_Field_4.layer.opacity = 0
    self.Dismiss_Panel_4.layer.opacity = 0
    self.Modal_Dismiss_4.layer.opacity = 0.5
    },completion: nil)
    _ = textFieldShouldReturn(Habit_Title_Field_4)
    
    UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {self.view.layoutIfNeeded()
    self.Clear_Habit_Panel_4.layer.opacity = 1
    },completion: nil)
}

    @IBAction func Clear_Modal_Dismiss_4(_ sender: Any) {
    UIView.animate(withDuration: 0.5, delay: 0.15, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {self.view.layoutIfNeeded()
    self.Clear_Habit_Panel_4.layer.opacity = 0
    self.Modal_Dismiss_4.layer.opacity = 0

    },completion: nil)
    }
    
    @IBAction func Cancel_Button_4(_ sender: UIButton) {
    UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseOut, animations: {
    sender.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
    self.Clear_Habit_Panel_4.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
    self.Clear_Habit_Panel_4.transform = CGAffineTransform.identity
    },
    completion: { _ in
    UIView.animate(withDuration: 0.1) {
    sender.transform = CGAffineTransform.identity
    }
    })
    }

    @IBAction func Confirm_Button_4(_ sender: UIButton) {
    UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseOut, animations: {
    sender.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
    self.Clear_Habit_Panel_4.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
    },
    completion: { _ in
    UIView.animate(withDuration: 0.1) {
    sender.transform = CGAffineTransform.identity
    self.Clear_Habit_Panel_4.transform = CGAffineTransform.identity
    self.Habit_Label_4.text = ""
    }
    })
    
    Habit_Title_Field_4.text = ""
    
    Panel_Grid_4 = Array(repeating: 0, count: 60)
    Clear_Panel_Grid(Panel_Grid: Tile_Collection_4!, Habit_Card_Index: 4)
    
    UIView.animate(withDuration: 0.5, delay: 0.3, options: .curveEaseOut, animations: {
    self.view.layoutIfNeeded()
    self.Clear_Habit_Panel_4.layer.opacity = 0
    self.Modal_Dismiss_4.layer.opacity = 0
    },completion: nil)
    }


}
