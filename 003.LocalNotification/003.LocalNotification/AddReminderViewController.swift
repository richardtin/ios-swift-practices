//
//  AddReminderViewController.swift
//  003.LocalNotification
//
//  Created by Richard Ting on 2/24/16.
//  Copyright © 2016 Richard Ting. All rights reserved.
//

import UIKit

class AddReminderViewController: UIViewController {

    private let reminderItemKey = "ReminderItems"

    @IBOutlet weak var deadlinePicker: UIDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Add Reminder"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Save, target: self, action: "saveReminder")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func saveReminder() {
        let reminderItem = Reminder(deadline: deadlinePicker.date, UUID: NSUUID().UUIDString)
        var reminderDictionary = NSUserDefaults.standardUserDefaults().dictionaryForKey(reminderItemKey) ?? Dictionary()
        reminderDictionary[reminderItem.UUID] = ["deadline": reminderItem.deadline, "UUID": reminderItem.UUID]
        NSUserDefaults.standardUserDefaults().setObject(reminderDictionary, forKey: reminderItemKey)

        // create a corresponding local notification
        let notification = UILocalNotification()
        let dateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale.currentLocale()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ssZZZ"
        dateFormatter.timeZone = NSTimeZone.systemTimeZone()
        notification.alertBody = "\"\(dateFormatter.stringFromDate(reminderItem.deadline))\" Is Overdue"
        notification.alertAction = "open"
        notification.fireDate = reminderItem.deadline
        notification.soundName = UILocalNotificationDefaultSoundName
        notification.userInfo = ["UUID": reminderItem.UUID]
        notification.category = "REMINDER_CATEGORY"
        UIApplication.sharedApplication().scheduleLocalNotification(notification)

        self.navigationController?.popViewControllerAnimated(true)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
