//
//  Root_Page_View_Controller.swift
//  Habit 60 Refactor
//
//  Created by MichaelTr on 2020-08-27.
//  Copyright © 2020 Michael Troeung. All rights reserved.
//

import UIKit

// Global variables

// Number of habit view controllers/pages
var Number_Of_Habit_Pages = 5

// Swipe and dismiss keyboard notification keys
let Swipe_And_Dismiss_Notification_Key = "co.MichaelTr7.Dismiss_Key"

    
class Root_Page_View_Controller: UIPageViewController, UIPageViewControllerDataSource {

    lazy var View_Controller_List: [UIViewController] = {
    var Card_Index = 0 // Initial card index upon loading
    let Storyboard = UIStoryboard(name: "Main", bundle: nil)
    let View_Controller_1 = Storyboard.instantiateViewController(identifier: "Card_1")
    let View_Controller_2 = Storyboard.instantiateViewController(identifier: "Card_2")
    let View_Controller_3 = Storyboard.instantiateViewController(identifier: "Card_3")
    let View_Controller_4 = Storyboard.instantiateViewController(identifier: "Card_4")
    let View_Controller_5 = Storyboard.instantiateViewController(identifier: "Card_5")
    let View_Controller_Array:[UIViewController] = [View_Controller_1,View_Controller_2,View_Controller_3,View_Controller_4,View_Controller_5]
    return View_Controller_Array
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        if let First_View_Controller = View_Controller_List.first{
        self.setViewControllers([First_View_Controller], direction: .forward, animated: true, completion: nil)
        self.view.backgroundColor = UIColor.white
        }
    }
    
    
// Function to seque to the left view controller
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let Notification_Name = Notification.Name(rawValue: Swipe_And_Dismiss_Notification_Key)
        NotificationCenter.default.post(name: Notification_Name, object: nil)
        

        // Grabbing the index of the current view controller displayed
        guard let View_Controller_Index = View_Controller_List.firstIndex(of: viewController) else {return nil}
        // Evaluating the index of the view controller to the left
        var Left_Index = View_Controller_Index - 1
        // Guard statements to ensure the "Left_Index" is within the bounds of the
        if(Left_Index < 0){
        Left_Index = Number_Of_Habit_Pages - 1
        }
        guard Left_Index >= 0 else{return nil}
        guard View_Controller_List.count > Left_Index else {return nil}
        return View_Controller_List[Left_Index]
    }
    
// Function to seque to the right view controller
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let Notification_Name = Notification.Name(rawValue: Swipe_And_Dismiss_Notification_Key)
        NotificationCenter.default.post(name: Notification_Name, object: nil)
                
        //Grabbing the index of the current view controller displayed
        guard let View_Controller_Index = View_Controller_List.firstIndex(of: viewController) else {return nil}
        // Evaluating the index of the view controller to the right
        var Right_Index = View_Controller_Index + 1
        // Guard statements to ensure the "Left_Index" is within the bounds of the "View_Controller_List"
        Right_Index = Right_Index%Number_Of_Habit_Pages
        guard View_Controller_List.count != Right_Index else {return nil}
        guard View_Controller_List.count > Right_Index else {return nil}
        return View_Controller_List[Right_Index]
        }

}
