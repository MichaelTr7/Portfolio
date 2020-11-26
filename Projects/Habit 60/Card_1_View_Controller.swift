//
//  Card_1_View_Controller.swift
//  Habit 60 Refactor
//
//  Created by MichaelTr on 2020-08-27.
//  Copyright © 2020 Michael Troeung. All rights reserved.
//

import UIKit
var Refresh_Queue_1: Bool = false
var Menu_Slide_1 = false
var Card_Pop_Flag_1 = false
var Reminder_Switch_State_1 = false
var Panel_Grid_1: [Int] = Array(repeating: 0, count: 60)


class Card_1_View_Controller: UIViewController, UITextFieldDelegate {
    
    // Constraint variables
    @IBOutlet weak var Left_Menu_Sliding_Constraint: NSLayoutConstraint!
    @IBOutlet weak var Right_Menu_Sliding_Constraint: NSLayoutConstraint!
    @IBOutlet weak var Card_Constraint_1: NSLayoutConstraint!
    
    // Buttons
    @IBOutlet weak var Card_Button_Pop_1: UIButton!
    @IBOutlet weak var Clear_Button_1: Clear_Panel_Buttons!
    @IBOutlet weak var Modal_Dismiss_1: UIButton!
    @IBOutlet var Tile_Collection_1: [Rounded_Buttons_1]!

    // Views
    @IBOutlet weak var Card_Pop_Up_1: UIView!
    @IBOutlet weak var Card_1_Background_View: UIView!
    @IBOutlet weak var Menu_1_Background_View: UIView!
    @IBOutlet weak var Dismiss_Panel_1: UIView!
    @IBOutlet weak var Menu_Dismiss_Panel_1: UIView!
    @IBOutlet weak var Percentage_Circle_1: UIView!
    @IBOutlet weak var Clear_Habit_Panel_1: UIView!
    
    // Input text fields
    @IBOutlet weak var Habit_Title_Field_1: UITextField!
    @IBOutlet weak var Routine_Field_1: Frequency_Picker_Field_1!
    
    // Labels
    @IBOutlet weak var Percentage_Label_1: UILabel!
    @IBOutlet weak var Count_Label_1: UILabel!
    @IBOutlet weak var Habit_Label_1: UILabel!
    
    // Stacks
    @IBOutlet weak var Tile_Stack_1: UIStackView!
    @IBOutlet var Horizontal_Stacks_1: [UIStackView]!
    
    // Toggle switches
    @IBOutlet weak var Reminder_Toggle_1: UISwitch!
    
    
    // Initial setup of IBOutlets attributes
    override func viewDidLoad() {
        super.viewDidLoad()
        Create_Keyboard_Observer_1()
        Card_Pop_Up_Style(Card_Pop_Up: Card_Pop_Up_1)
        Generate_Background_Colour(Card_View_Controller: Menu_1_Background_View, Card_Index_Value: 1)
        Card_1_Background_View.layer.shadowColor = UIColor.black.cgColor
        Card_1_Background_View.layer.shadowOffset = CGSize(width: -10.0, height: 4.0)
        Card_1_Background_View.layer.shadowRadius = 15
        Card_1_Background_View.layer.masksToBounds = false
        // Initializing the delegate to activate the "return" key
        Habit_Title_Field_1.delegate = self
        // Initially hidden panels
        Dismiss_Panel_1.layer.opacity = 0
        Menu_Dismiss_Panel_1.layer.opacity = 0
        Habit_Title_Field_1.layer.opacity = 0
        Routine_Field_1.layer.opacity = 0
        // Rasterize
        Card_1_Background_View.layer.shouldRasterize = true
        Card_1_Background_View.layer.rasterizationScale = UIScreen.main.scale
        let Screen_Width = Card_1_Background_View.bounds.width
        Tile_Stack_1.spacing = 0.02*Screen_Width
        let Number_Of_Rows = Horizontal_Stacks_1.count
        for Index in 0 ..< Number_Of_Rows{
        Horizontal_Stacks_1[Index].spacing = 0.02*Screen_Width
        }
        Clear_Habit_Panel_1.layer.opacity = 0
        Modal_Dismiss_1.layer.opacity = 0
    }


 func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    Habit_Title_Field_1.layer.backgroundColor = UIColor.white.cgColor
    Copy_Habit_Title(Habit_Field: Habit_Title_Field_1, Habit_Title_Label: Habit_Label_1)
    return true
 }  

/*************************************************************/
/*VIEW CONTROLLER 1 FUNCTIONS*/
/*************************************************************/

    @IBAction func Edit_Button_1_Pressed(_ sender: Any) {
        if(Card_Pop_Flag_1 == false){
        let Tile_Count = Calculate_Percentage_Completed(Tile_Array: Panel_Grid_1)
        _ = Draw_Percentage_Circle(Graph_Canvas: Percentage_Circle_1, Count: Tile_Count.0, Card_Index_Value: 1)
        Count_Label_1.text = String(Tile_Count.0) + "/60 Tiles"
        Percentage_Label_1.text = Tile_Count.1 + "%"
        Card_Constraint_1.constant = 50
        Card_Pop_Flag_1 = true
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {self.view.layoutIfNeeded()
        self.Dismiss_Panel_1.layer.opacity = 0.2
        self.Habit_Title_Field_1.layer.opacity = 1
        self.Routine_Field_1.layer.opacity = 1
        },completion: nil)
            }
            
        else{
        Card_Constraint_1.constant = -370
        Card_Pop_Flag_1 = false
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {self.view.layoutIfNeeded()
        self.Dismiss_Panel_1.layer.opacity = 0
        self.Habit_Title_Field_1.layer.opacity = 0
        self.Routine_Field_1.layer.opacity = 0
        },completion: nil)
        _ = textFieldShouldReturn(Habit_Title_Field_1)
            }
            
        Left_Menu_Sliding_Constraint.constant = 0
        Right_Menu_Sliding_Constraint.constant = 0
        Menu_Slide_1 = false
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseIn, animations: {self.view.layoutIfNeeded()
        self.Card_1_Background_View.layer.shadowOpacity = 0
        self.Menu_Dismiss_Panel_1.layer.opacity = 0
        }, completion: nil)
            
    }
    
    @IBAction func Menu_Button_1(_ sender: Any) {

        if Menu_Slide_1 == false{
            Left_Menu_Sliding_Constraint.constant = 170
            Right_Menu_Sliding_Constraint.constant = -170
            Menu_Slide_1 = true
            UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseIn, animations: {self.view.layoutIfNeeded()
            self.Card_1_Background_View.layer.shadowOpacity = 0.2
            self.Menu_Dismiss_Panel_1.layer.opacity = 0.5
            self.Habit_Title_Field_1.layer.opacity = 0
            self.Routine_Field_1.layer.opacity = 0
            }, completion: nil)
            Card_Constraint_1.constant = -370
            Card_Pop_Flag_1 = false
            UIView.animate(withDuration: 1, delay: 0.25, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {self.view.layoutIfNeeded()
            self.Dismiss_Panel_1.layer.opacity = 0
            },completion: nil)
            _ = textFieldShouldReturn(Habit_Title_Field_1)
        }
    
        else{
            Left_Menu_Sliding_Constraint.constant = 0
            Right_Menu_Sliding_Constraint.constant = 0
            Menu_Slide_1 = false
            UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseIn, animations: {self.view.layoutIfNeeded()
            self.Card_1_Background_View.layer.shadowOpacity = 0
            self.Menu_Dismiss_Panel_1.layer.opacity = 0
            }, completion: nil)
        }
    }
    
    
    @IBAction func Card_Button_Pop_Pressed_1(_ sender: Any) {
        if(Card_Pop_Flag_1 == false){
            let Tile_Count = Calculate_Percentage_Completed(Tile_Array: Panel_Grid_1)
            _ = Draw_Percentage_Circle(Graph_Canvas: Percentage_Circle_1, Count: Tile_Count.0, Card_Index_Value: 1)
            Count_Label_1.text = String(Tile_Count.0) + "/60 Tiles"
            Percentage_Label_1.text = Tile_Count.1 + "%"
            Card_Constraint_1.constant = 50
            Card_Pop_Flag_1 = true
            UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {self.view.layoutIfNeeded()
            self.Dismiss_Panel_1.layer.opacity = 0.2
            self.Habit_Title_Field_1.layer.opacity = 1
            self.Routine_Field_1.layer.opacity = 1
            },completion: nil)
        }
            
        else{
            Card_Constraint_1.constant = -370
            Card_Pop_Flag_1 = false
            UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {self.view.layoutIfNeeded()
            self.Dismiss_Panel_1.layer.opacity = 0
            self.Habit_Title_Field_1.layer.opacity = 0
            self.Routine_Field_1.layer.opacity = 0
            },completion: nil)
            _ = textFieldShouldReturn(Habit_Title_Field_1)
        }
    }
    
    
    @IBAction func Card_1_Swiped_Up(_ sender: Any) {
        Card_Constraint_1.constant = 50
        Card_Pop_Flag_1 = true
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {self.view.layoutIfNeeded()
        self.Dismiss_Panel_1.layer.opacity = 0.2
        self.Habit_Title_Field_1.layer.opacity = 1
        self.Routine_Field_1.layer.opacity = 1
        },completion: nil)
         let Tile_Count = Calculate_Percentage_Completed(Tile_Array: Panel_Grid_1)
        _ = Draw_Percentage_Circle(Graph_Canvas: Percentage_Circle_1, Count: Tile_Count.0, Card_Index_Value: 1)
        Count_Label_1.text = String(Tile_Count.0) + "/60 Tiles"
        Percentage_Label_1.text = Tile_Count.1 + "%"
    }
    
    @IBAction func Card_1_Swipe_Down(_ sender: Any) {
        Card_Constraint_1.constant = -370
        Card_Pop_Flag_1 = false
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {self.view.layoutIfNeeded()
        self.Dismiss_Panel_1.layer.opacity = 0
        self.Habit_Title_Field_1.layer.opacity = 0
        self.Routine_Field_1.layer.opacity = 0
        },completion: nil)
        _ = textFieldShouldReturn(Habit_Title_Field_1)
    }
    
    
    @IBAction func Dismiss_Card_1(_ sender: Any) {
        Card_Constraint_1.constant = -370
        Card_Pop_Flag_1 = false
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {self.view.layoutIfNeeded()
        self.Dismiss_Panel_1.layer.opacity = 0
        self.Habit_Title_Field_1.layer.opacity = 0
        self.Routine_Field_1.layer.opacity = 0
        },completion: nil)
        _ = textFieldShouldReturn(Habit_Title_Field_1)
    }
    
    
    @IBAction func Dismiss_Menu_1(_ sender: Any) {
        Left_Menu_Sliding_Constraint.constant = 0
        Right_Menu_Sliding_Constraint.constant = 0
        Menu_Slide_1 = false
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseIn, animations: {self.view.layoutIfNeeded()
        self.Card_1_Background_View.layer.shadowOpacity = 0
        self.Menu_Dismiss_Panel_1.layer.opacity = 0
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

        if(Panel_Grid_1[Tile_Array_Index] == 0){
            Panel_Grid_1[Tile_Array_Index] = 1;
            UIButton.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn, animations: {
            self.Tile_Collection_1[Tile_Array_Index].backgroundColor = UIColor.init(red:104/255, green:218/255, blue:(252-CGFloat(1.5 * Double((Day!))))/255, alpha: 1/1);}, completion: nil)
            self.Tile_Collection_1[Tile_Array_Index].setTitleColor(.white, for: .normal)
        }
        else{
            Panel_Grid_1[Tile_Array_Index] = 0;
            UIButton.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn, animations: {
            self.Tile_Collection_1[Tile_Array_Index].backgroundColor = .systemGray6}, completion: nil)
            let Tile_Text_Colour_1 = UIColor(red:104/255,green:218/255,blue:252/255,alpha:1/1)
            self.Tile_Collection_1[Tile_Array_Index].setTitleColor(Tile_Text_Colour_1, for: .normal)
        }
    }

    @IBAction func Habit_Title_1_Pressed(_ sender: Any) {
    Habit_Title_Field_1.layer.backgroundColor = UIColor.systemGray6.cgColor
    }
    
    let Keyboard_Dimiss = Notification.Name(rawValue: Swipe_And_Dismiss_Notification_Key)

    func Create_Keyboard_Observer_1(){
    NotificationCenter.default.addObserver(self, selector: #selector(Card_1_View_Controller.Dimiss_Keyboard_And_Text_Field_Editing), name: Keyboard_Dimiss, object: nil)
    }
    
    @objc func Dimiss_Keyboard_And_Text_Field_Editing(notification: NSNotification){
//    _ = textFieldShouldReturn(Habit_Title_Field_1)
    Habit_Title_Field_1.layer.backgroundColor = UIColor.white.cgColor
    }


    @IBAction func Reminder_1_Pressed(_ sender: UISwitch) {
        if(Reminder_Switch_State_1 == false){
            performSegue(withIdentifier: "Reminder_1", sender: nil)
            Reminder_Switch_State_1 = true
        }
        else{
            Reminder_Switch_State_1 = false
        }
       
    }

    @IBAction func Clear_Button_1_Pressed(_ sender: Any) {
    
    UIButton.animate(withDuration: 0.1,
    animations: {
    self.Clear_Button_1.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
    },
    completion: { _ in
    UIButton.animate(withDuration: 0.1) {
    self.Clear_Button_1.transform = CGAffineTransform.identity
    }
    })

    Card_Constraint_1.constant = -370
    Card_Pop_Flag_1 = false
    UIView.animate(withDuration: 1.0, delay: 0.2, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {self.view.layoutIfNeeded()
    self.Habit_Title_Field_1.layer.opacity = 0
    self.Routine_Field_1.layer.opacity = 0
    self.Dismiss_Panel_1.layer.opacity = 0
    self.Modal_Dismiss_1.layer.opacity = 0.5
    },completion: nil)
    _ = textFieldShouldReturn(Habit_Title_Field_1)

    UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {self.view.layoutIfNeeded()
    self.Clear_Habit_Panel_1.layer.opacity = 1
    },completion: nil)

}

    @IBAction func Clear_Modal_Dismiss_1(_ sender: Any) {
    UIView.animate(withDuration: 0.5, delay: 0.15, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {self.view.layoutIfNeeded()
    self.Clear_Habit_Panel_1.layer.opacity = 0
    self.Modal_Dismiss_1.layer.opacity = 0
    },completion: nil)
    }
    
    @IBAction func Cancel_Button_1(_ sender: UIButton) {
    UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseOut, animations: {
    sender.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
    self.Clear_Habit_Panel_1.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
    },
    completion: { _ in
    UIView.animate(withDuration: 0.1) {
    sender.transform = CGAffineTransform.identity
    self.Clear_Habit_Panel_1.transform = CGAffineTransform.identity
    }
    })
    }
    
    @IBAction func Confirm_Button_1(_ sender: UIButton) {
    UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseOut, animations: {
    sender.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
    self.Clear_Habit_Panel_1.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
    },
    completion: { _ in
    UIView.animate(withDuration: 0.1) {
    sender.transform = CGAffineTransform.identity
    self.Clear_Habit_Panel_1.transform = CGAffineTransform.identity
    self.Habit_Label_1.text = ""
    }
    })
    
    Habit_Title_Field_1.text = ""
    Refresh_Queue_1 = true
    
    Panel_Grid_1 = Array(repeating: 0, count: 60)
    Clear_Panel_Grid(Panel_Grid: Tile_Collection_1!,Habit_Card_Index: 1)
    
    UIView.animate(withDuration: 0.5, delay: 0.3, options: .curveEaseOut, animations: {
    self.view.layoutIfNeeded()
    self.Clear_Habit_Panel_1.layer.opacity = 0
    self.Modal_Dismiss_1.layer.opacity = 0
    },completion: nil)
    
    
    
    }
    

}

func Clear_Panel_Grid(Panel_Grid: [UIButton]!, Habit_Card_Index: Int){

var Tile_Text_Colour = UIColor.white

if(Habit_Card_Index == 1){
    Tile_Text_Colour = UIColor(red:104/255,green:218/255,blue:252/255,alpha:1/1)
}
if(Habit_Card_Index == 2){
    Tile_Text_Colour = UIColor(red:255/255,green:41/255,blue:130/255,alpha:0.7/1)
}
if(Habit_Card_Index == 3){
    Tile_Text_Colour = UIColor(red:75/255,green:237/255,blue:17/255,alpha:0.7/1)
}
if(Habit_Card_Index == 4){
    Tile_Text_Colour = UIColor(red:255/255,green:153/255,blue:0/255,alpha:0.7/1)
}
if(Habit_Card_Index == 5){
    Tile_Text_Colour = UIColor(red:98/255,green:41/255,blue:255/255,alpha:0.7/1)
}

    for Index in 0 ..< Panel_Grid.count{
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseOut, animations: {
        Panel_Grid[Index].pushTransition(0.5, Animation_From: "Top")
        Panel_Grid[Index].backgroundColor = UIColor.systemGray6
        Panel_Grid[Index].setTitleColor(Tile_Text_Colour, for: .normal)
        },completion: nil)
    }
}



