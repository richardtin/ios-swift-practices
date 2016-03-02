# ios-swift-practices
iOS practices with Swift language

## Practice 1: setup initial view controller programmatically
Language: `Swift 2.1`

* Setup initial view controller programmatically
* Setup UITabBarController and its viewControllers programmatically

## Practice 2: show AlertView & ActionSheet by UIAlertController
Language: `Swift 2.1`

Reference: [UIAlertController (NSHipster)](http://nshipster.com/uialertcontroller/)

* Setup UITableViewController as intial view controller
* Register cell: `tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)`
* Show 3 kinds of AlertView & 2 kinds of ActionSheet

## Practice 3: add reminder by UILocalNotification
Language: `Swift 2.1`

* Register local notification with Swift 2 literal

  ```swift
  UIUserNotificationSettings(forTypes: .Alert | .Badge | .Sound], categories: nil)
      |
      v
  UIUserNotificationSettings(forTypes: [.Alert, .Badge, .Sound], categories: nil)
  ```

* Add a simple minutes reminder

## Practice 4: Make a simple calculator
Language: `Swift 2.1`

![Screenshot](screenshots/004.SimpleCalculator.png)

* Make a calculator layout like iOS native Calculator
* Practice MVC design pattern (Refer to 2015 CS193P Lecture 2 & 3)

## Practice 5: Make blur effect with UIVisualEffectView

![Screenshot](screenshots/005.UIVisualEffectView.png)

* Show blur effect: Light / Dark / Extra Light
* Show vibrancy effect: None / Light / Dark / Extra Light
* This practice is done by StoryBoard.

> **Reference:** https://github.com/ide/UIVisualEffects
