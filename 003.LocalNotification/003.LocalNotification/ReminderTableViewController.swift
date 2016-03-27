//
//  ReminderTableViewController.swift
//  003.LocalNotification
//
//  Created by Richard Ting on 2/24/16.
//  Copyright © 2016 Richard Ting. All rights reserved.
//

import UIKit

class ReminderTableViewController: UITableViewController {

    private let cellReuseIdentifier = "ReminderItemCell"
    private let reminderItemKey = "ReminderItems"
    private var reminderItems = [Reminder]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        title = "Reminder"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: #selector(ReminderTableViewController.addReminder))

        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        reminderItems = allItems()
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func addReminder() {
        self.navigationController?.pushViewController(AddReminderViewController(), animated: true)
    }

    func allItems() -> [Reminder] {
        let reminderDictionary = NSUserDefaults.standardUserDefaults().dictionaryForKey(reminderItemKey) ?? [:]
        let items = Array(reminderDictionary.values)
        return items.map({Reminder(deadline: $0["deadline"] as! NSDate, UUID: $0["UUID"] as! String!)})
            .sort({ $0.deadline.compare($1.deadline) == .OrderedDescending })
    }
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reminderItems.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellReuseIdentifier, forIndexPath: indexPath)

        // Configure the cell...
        let dateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale.currentLocale()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ssZZZ"
        dateFormatter.timeZone = NSTimeZone.systemTimeZone()
        cell.textLabel?.text = "\(dateFormatter.stringFromDate(reminderItems[indexPath.row].deadline))"

        return cell
    }

    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            let item = reminderItems.removeAtIndex(indexPath.row)

            // Cancel LocalNotification
            for notification in UIApplication.sharedApplication().scheduledLocalNotifications! {
                if notification.userInfo!["UUID"] as! String == item.UUID {
                    UIApplication.sharedApplication().cancelLocalNotification(notification)
                    break
                }
            }
            // Remove item from NSUserDefaults
            if var reminderDictionary = NSUserDefaults.standardUserDefaults().dictionaryForKey(reminderItemKey) {
                reminderDictionary.removeValueForKey(item.UUID)
                NSUserDefaults.standardUserDefaults().setValue(reminderDictionary, forKey: reminderItemKey)
            }
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
