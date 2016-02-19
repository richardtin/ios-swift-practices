//
//  ReminderViewController.swift
//  003.LocalNotification
//
//  Created by Richard Ting on 2/19/16.
//  Copyright © 2016 Richard Ting. All rights reserved.
//

import UIKit

class ReminderViewController: UIViewController {

    @IBOutlet weak var minutesField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Reminder"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addReminder() {
        if let minutes = Int(minutesField.text!) {
            let localNotification = UILocalNotification()
            localNotification.timeZone = NSTimeZone.defaultTimeZone()
            localNotification.fireDate = NSDate(timeIntervalSinceNow: 60 * Double(minutes))
            localNotification.alertBody = "\(minutes) minute reminder"
            localNotification.soundName = UILocalNotificationDefaultSoundName
            UIApplication.sharedApplication().scheduleLocalNotification(localNotification)

            showAlert(localNotification.alertBody!, isSuccess: true)
        } else {
            showAlert("reminder", isSuccess: false)
        }
        minutesField.resignFirstResponder()
    }

    func showAlert(title: String, isSuccess: Bool) {
        let alertController = UIAlertController(title: isSuccess ? "Success" : "Failure",
            message: "Add \(title)", preferredStyle: .Alert)

        let closeAction = UIAlertAction(title: "Close", style: isSuccess ? .Default : .Destructive, handler: nil)
        alertController.addAction(closeAction)

        presentViewController(alertController, animated: true) { [unowned self] () -> Void in
            self.minutesField.text = ""
        }
    }

}
