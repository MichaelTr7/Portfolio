//
//  Reminder_Panel_2.swift
//  Habit 60 Refactor 2
//
//  Created by MichaelTr on 2020-09-07.
//  Copyright © 2020 Michael Troeung. All rights reserved.
//

import UIKit
var Reminder_2_State = false

class Reminder_Panel_2: UIViewController {

    @IBOutlet weak var Set_Reminder_Button_2: UIButton!
    @IBOutlet var Reminder_Background_2: UIView!
    @IBOutlet weak var Routine_Frequency_Value: UILabel!
    @IBOutlet weak var Reminder_Time_Value: UILabel!
    @IBOutlet weak var Day_Of_The_Week_Value: UILabel!
    @IBOutlet weak var Reminder_Card_2B: Reminder_Cards!
    @IBOutlet weak var Reminder_Card_2C: Reminder_Cards!
    @IBOutlet weak var No_Thanks_Button_2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Set_Reminder_Button_2.layer.cornerRadius = 25
        Set_Reminder_Button_2.layer.shadowColor = UIColor.black.cgColor
        Set_Reminder_Button_2.layer.shadowOpacity = 0.5
        Set_Reminder_Button_2.layer.shadowOffset = CGSize(width: 0, height: 6.0)
        Set_Reminder_Button_2.layer.shadowRadius = 5
        Set_Reminder_Button_2.layer.backgroundColor = UIColor.clear.cgColor
        Set_Reminder_Button_2.layer.borderWidth = 3
        Set_Reminder_Button_2.layer.borderColor = UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.6/1).cgColor
        // Do any additional setup after loading the view.
        let Gradient: CAGradientLayer = CAGradientLayer()
        let Colour_1 = UIColor(red:255/255,green:41/255,blue:130/255,alpha:1/1).cgColor
        let Colour_2 = UIColor(red:135/255, green:41/255, blue:130/255,alpha:1/1).cgColor
        Gradient.colors = [Colour_1, Colour_2]
        Gradient.locations = [0.0 , 1.0]
        Gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        Gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
        Gradient.frame = Reminder_Background_2.bounds
        Reminder_Background_2.layer.insertSublayer(Gradient, at: 0)
        Reminder_Card_2B.layer.opacity = 0
        Reminder_Card_2C.layer.opacity = 0
        No_Thanks_Button_2.layer.opacity = 0
    }
    
    @IBAction func Reminder_2_Done_Pressed(_ sender: UIButton) {
    dismiss(animated: true, completion: nil)
        if let Button_Title = sender.title(for: .normal){
        if(String(Button_Title) == "Done"){
        Reminder_2_State = false
        print(Reminder_2_State)
        }
        if(String(Button_Title) == "Set Reminders"){
        Reminder_2_State = true
        print(Reminder_2_State)
        }
    }
    }
    
    @IBAction func No_Thanks_2(_ sender: Any) {
    dismiss(animated: true, completion: nil)
        Reminder_2_State = false
        print(Reminder_2_State)
    }
    
    @IBAction func Routine_Frequency_Slider_2(_ Slider: UISlider) {
    var Routine_Slider_Value = Slider.value
    Routine_Slider_Value = round(Routine_Slider_Value)
    let Routine_Frequency_Token = ["No Schedule","Monthly","Weekly","Daily"]
    
    let Previous_Value = String(Routine_Frequency_Value.text!)
    let Writing_Value = String(Routine_Frequency_Token[Int(Routine_Slider_Value)])
        
    
        
    if(Previous_Value != Writing_Value){
        Routine_Frequency_Value.fadeTransition(0.2)
        Routine_Frequency_Value.text = Routine_Frequency_Token[Int(Routine_Slider_Value)]
    }
    
    }

    @IBAction func Routine_Frequency_Slider_Snap_2(_ Slider: UISlider) {
    Slider.value = round(Slider.value)
    let Card_1_String = String(Routine_Frequency_Value.text!);
    
    if(Card_1_String != "No Schedule"){
    Set_Reminder_Button_2.pushTransition(0.4, Animation_From: "Top")
    self.Set_Reminder_Button_2.setTitle("Set Reminders", for: .normal)
    }
    
    if(Card_1_String == "No Schedule"){
    Set_Reminder_Button_2.pushTransition(0.4, Animation_From: "Top")
    self.Set_Reminder_Button_2.setTitle("Done", for: .normal)
    }
    
    UIView.animate(withDuration: 0.4, animations: {
    Slider.layoutIfNeeded()
    if(Card_1_String != "No Schedule"){
    self.Reminder_Card_2B.layer.opacity = 1
    self.Set_Reminder_Button_2.setTitle("Set Reminders", for: .normal)
    }
    if(Card_1_String == "No Schedule"){
    self.Reminder_Card_2B.layer.opacity = 0
    self.Set_Reminder_Button_2.setTitle("Done", for: .normal)
    }
    if(Card_1_String == "Weekly"){
    self.Reminder_Card_2C.layer.opacity = 1
    }
    if(Card_1_String != "Weekly"){
    self.Reminder_Card_2C.layer.opacity = 0
    }
    let Button_Title = String(self.Set_Reminder_Button_2.currentTitle!);
    if(Button_Title == "Done"){
    self.No_Thanks_Button_2.layer.opacity = 0
    }
    if(Button_Title != "Done"){
    self.No_Thanks_Button_2.layer.opacity = 1
    }
    })
    
    }
    
    @IBAction func Reminder_Time_Slider_2(_ Slider: UISlider) {
    let Reminder_Time_Tokens = [
    "12:00 AM",
    "1:00 AM",
    "2:00 AM",
    "3:00 AM",
    "4:00 AM",
    "5:00 AM",
    "6:00 AM",
    "7:00 AM",
    "8:00 AM",
    "9:00 AM",
    "10:00 AM",
    "11:00 AM",
    "12:00 PM",
    "1:00 PM",
    "2:00 PM",
    "3:00 PM",
    "4:00 PM",
    "5:00 PM",
    "6:00 PM",
    "7:00 PM",
    "8:00 PM",
    "9:00 PM",
    "10:00 PM",
    "11:00 PM",
    ]
    let Reminder_Key_Index = round(Slider.value)
    let Previous_Value = String(Reminder_Time_Value.text!)
    let Writing_Value = String(Reminder_Time_Tokens[Int(Reminder_Key_Index)])
        
    if(Previous_Value != Writing_Value){
        Reminder_Time_Value.fadeTransition(0.2)
        Reminder_Time_Value.text = Reminder_Time_Tokens[Int(Reminder_Key_Index)]
    }
    }
    
    @IBAction func Reminder_Time_Slider_Snap_2(_ Slider: UISlider) {
    Slider.value = round(Slider.value)
    UIView.animate(withDuration: 0.5, animations: {
    Slider.layoutIfNeeded()
    })
    }
    
    
    @IBAction func Day_Of_The_Week_Slider_2(_ Slider: UISlider) {
    let Day_Of_The_Week_Token = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"
    ]
    let Day_Of_The_Week_Index = round(Slider.value)
    let Previous_Value = String(Day_Of_The_Week_Value.text!)
    let Writing_Value = String(Day_Of_The_Week_Token[Int(Day_Of_The_Week_Index)])
        
    if(Previous_Value != Writing_Value){
        Day_Of_The_Week_Value.fadeTransition(0.2)
        Day_Of_The_Week_Value.text = Day_Of_The_Week_Token[Int(Day_Of_The_Week_Index)]
    }
    
    }
    
    
    @IBAction func Day_Of_The_Week_Slider_Snap_2(_ Slider: UISlider) {
    Slider.value = round(Slider.value)
    UIView.animate(withDuration: 0.5, animations: {
    Slider.layoutIfNeeded()
    })
    }
    
    
    
    
    
    
    
    
}
