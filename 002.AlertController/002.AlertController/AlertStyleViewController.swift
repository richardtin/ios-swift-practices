//
//  AlertStyleViewController.swift
//  002.AlertController
//
//  Created by Richard Ting on 2/18/16.
//  Copyright © 2016 Richard Ting. All rights reserved.
//

import UIKit

class AlertStyleViewController: UITableViewController {

    let cellReuseIdentifier = "AlertStyleItemCell"

    let sectionTitles = ["Alert", "ActionSheet"]
    let rowTitles = [
        ["Alert with 2 buttons", "Alert with 4 buttons", "Alert for login form"],
        ["ActionSheet with 2 buttons", "ActionSheet with 4 buttons"]]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()

        title = "UIAlertController"
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sectionTitles.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowTitles[section].count
    }

    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellReuseIdentifier, forIndexPath: indexPath) as UITableViewCell?
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: cellReuseIdentifier)
        }

        // Configure the cell...
        cell!.textLabel?.text = rowTitles[indexPath.section][indexPath.row]

        return cell!
    }

    // MARK: Table view delegate

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        switch rowTitles[indexPath.section][indexPath.row] {
        case "Alert with 2 buttons":
            let alertController = UIAlertController(title: sectionTitles[indexPath.section], message: rowTitles[indexPath.section][indexPath.row], preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alertController.addAction(okAction)
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
            alertController.addAction(cancelAction)

            presentViewController(alertController, animated: true, completion: nil)
            break
        case "Alert with 4 buttons":
            let alertController = UIAlertController(title: sectionTitles[indexPath.section], message: rowTitles[indexPath.section][indexPath.row], preferredStyle: .Alert)
            let defaultAction1 = UIAlertAction(title: "Default1", style: .Default, handler: nil)
            alertController.addAction(defaultAction1)
            let defaultAction2 = UIAlertAction(title: "Default2", style: .Default, handler: nil)
            alertController.addAction(defaultAction2)
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
            alertController.addAction(cancelAction)
            let destructiveAction = UIAlertAction(title: "Destroy", style: .Destructive, handler: nil)
            alertController.addAction(destructiveAction)

            presentViewController(alertController, animated: true, completion: nil)
            break
        case "Alert for login form":
            let alertController = UIAlertController(title: sectionTitles[indexPath.section], message: rowTitles[indexPath.section][indexPath.row], preferredStyle: .Alert)
            let loginAction = UIAlertAction(title: "Login", style: .Default, handler: nil)
            loginAction.enabled = false
            alertController.addAction(loginAction)
            let forgetPasswordAction = UIAlertAction(title: "Forget password", style: .Destructive, handler: nil)
            alertController.addAction(forgetPasswordAction)
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
            alertController.addAction(cancelAction)

            alertController.addTextFieldWithConfigurationHandler { (textField) in
                textField.placeholder = "Login"

                NSNotificationCenter.defaultCenter().addObserverForName(UITextFieldTextDidChangeNotification, object: textField, queue: NSOperationQueue.mainQueue()) { (notification) in
                    loginAction.enabled = textField.text != ""
                }
            }

            alertController.addTextFieldWithConfigurationHandler { (textField) in
                textField.placeholder = "Password"
                textField.secureTextEntry = true
            }

            presentViewController(alertController, animated: true, completion: nil)
            break
        case "ActionSheet with 2 buttons":
            let alertController = UIAlertController(title: sectionTitles[indexPath.section], message: rowTitles[indexPath.section][indexPath.row], preferredStyle: .ActionSheet)
            let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alertController.addAction(okAction)
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
            alertController.addAction(cancelAction)

            presentViewController(alertController, animated: true, completion: nil)
            break
        case "ActionSheet with 4 buttons":
            let alertController = UIAlertController(title: sectionTitles[indexPath.section], message: rowTitles[indexPath.section][indexPath.row], preferredStyle: .ActionSheet)
            let defaultAction1 = UIAlertAction(title: "Default1", style: .Default, handler: nil)
            alertController.addAction(defaultAction1)
            let defaultAction2 = UIAlertAction(title: "Default2", style: .Default, handler: nil)
            alertController.addAction(defaultAction2)
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
            alertController.addAction(cancelAction)
            let destructiveAction = UIAlertAction(title: "Destroy", style: .Destructive, handler: nil)
            alertController.addAction(destructiveAction)

            presentViewController(alertController, animated: true, completion: nil)
            break
        default:
            break
        }

        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

}
