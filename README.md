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
* Register cell from Nib
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
