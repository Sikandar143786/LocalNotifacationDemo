//
//  ViewController.swift
//  LocalNotifacationDemo
//
//  Created by Akash Technolabs on 13/11/17.
//  Copyright © 2017 Akash Technolabs. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController
{

    var isNotificationAllow:Bool = false
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.sound, .alert],
        completionHandler:
        {
            (isAllow, error) in
            self.isNotificationAllow = isAllow
        })
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func btnNoticationAction(_ sender: UIButton)
    {
        
        if isNotificationAllow
        {
        let notification = UNMutableNotificationContent()
        notification.title = "Akash Technolabs"
        notification.subtitle = "Local Notification Demo"
        notification.body = "This is best place for learnig programming"
        
        //create the trigger
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3.0, repeats: false)
        let request = UNNotificationRequest(identifier: "This is Notification Demo", content: notification, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        }
        
    }
    

}

