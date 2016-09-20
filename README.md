# ios-swift-practices
iOS practices with Swift language

## Practice 1: setup initial view controller programmatically
![Platform](https://img.shields.io/badge/platform-iOS-lightgrey.svg)
![Xcode 7.3](https://img.shields.io/badge/xcode-7.3-blue.svg)
![Swift 2.2](https://img.shields.io/badge/swift-2.2-orange.svg)

![Screenshot](screenshots/001.InitialViewController.png)

* Setup initial view controller programmatically
* Setup UITabBarController and its viewControllers programmatically

## Practice 2: show AlertView & ActionSheet by UIAlertController
![Platform](https://img.shields.io/badge/platform-iOS-lightgrey.svg)
![Xcode 7.3](https://img.shields.io/badge/xcode-7.3-blue.svg)
![Swift 2.2](https://img.shields.io/badge/swift-2.2-orange.svg)

![Screenshot](screenshots/002.AlertController-1.png)
![Screenshot](screenshots/002.AlertController-2.png)
![Screenshot](screenshots/002.AlertController-3.png)

Reference: [UIAlertController (NSHipster)](http://nshipster.com/uialertcontroller/)

* Setup UITableViewController as intial view controller
* Register cell: `tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)`
* Show 3 kinds of AlertView & 2 kinds of ActionSheet

## Practice 3: add reminder by UILocalNotification
![Platform](https://img.shields.io/badge/platform-iOS-lightgrey.svg)
![Xcode 7.3](https://img.shields.io/badge/xcode-7.3-blue.svg)
![Swift 2.2](https://img.shields.io/badge/swift-2.2-orange.svg)

![Screenshot](screenshots/003.LocalNotification-1.png)
![Screenshot](screenshots/003.LocalNotification-2.png)
![Screenshot](screenshots/003.LocalNotification-3.png)

* Register local notification with Swift 2 literal

  ```swift
  UIUserNotificationSettings(forTypes: .Alert | .Badge | .Sound], categories: nil)
      |
      v
  UIUserNotificationSettings(forTypes: [.Alert, .Badge, .Sound], categories: nil)
  ```

* Add a simple minutes reminder

  > **Reference:** http://jamesonquave.com/blog/local-notifications-in-ios-8-with-swift-part-1/

## Practice 4: Make a simple calculator
![Platform](https://img.shields.io/badge/platform-iOS-lightgrey.svg)
![Xcode 7.3](https://img.shields.io/badge/xcode-7.3-blue.svg)
![Swift 2.2](https://img.shields.io/badge/swift-2.2-orange.svg)

![Screenshot](screenshots/004.SimpleCalculator.png)

* Make a calculator layout like iOS native Calculator
* Practice MVC design pattern (Refer to 2015 CS193P Lecture 2 & 3)

## Practice 5: Make blur effect with UIVisualEffectView
![Platform](https://img.shields.io/badge/platform-iOS-lightgrey.svg)
![Xcode 7.3](https://img.shields.io/badge/xcode-7.3-blue.svg)

![Screenshot](screenshots/005.UIVisualEffectView.png)

* Show blur effect: Light / Light / Dark / Extra Light
* Show vibrancy effect: None / Light / Dark / Extra Light
* This practice is done by StoryBoard. (No source code included)
  - Blur effect UIVisualEffectView should be added in the same layer of target image view
  - Vibrancy effect is set by UIVisualEffectView and nested in another blur effect UIVisualEffectView
* Blur & vibrancy effect can be done by code, please see reference

  > **Reference:** https://github.com/ide/UIVisualEffects

## Practice 6: Make a horizontal photo list
![Platform](https://img.shields.io/badge/platform-iOS-lightgrey.svg)
![Xcode 7.3](https://img.shields.io/badge/xcode-7.3-blue.svg)
![Swift 2.2](https://img.shields.io/badge/swift-2.2-orange.svg)

| Normal | Right to Left (RTL) |
| :----: | :-----------------: |
| ![Screenshot](screenshots/006.HorizontalCollectionView-1.png) | ![Screenshot](screenshots/006.HorizontalCollectionView-2.png) |

* Make a horizontal photo list
* Fix RTL does not start from first item

## Practice 7: Make a collection view with auto centered cell
![Platform](https://img.shields.io/badge/platform-iOS-lightgrey.svg)
![Xcode 7.3](https://img.shields.io/badge/xcode-7.3-blue.svg)
![Swift 2.2](https://img.shields.io/badge/swift-2.2-orange.svg)

|        |        |        |
| :----: | :----: | :----: |
| ![Screenshot](screenshots/007.CenteredCellCollectionView-1.png) | ![Screenshot](screenshots/007.CenteredCellCollectionView-2.png) | ![Screenshot](screenshots/007.CenteredCellCollectionView-3.png) |

* Add a paging collection view
* Add center cell flow layout for collection view

