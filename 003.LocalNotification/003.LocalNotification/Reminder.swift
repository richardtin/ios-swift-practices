//
//  Reminder.swift
//  003.LocalNotification
//
//  Created by Richard Ting on 2/24/16.
//  Copyright © 2016 Richard Ting. All rights reserved.
//

import Foundation

struct Reminder {
    var deadline: NSDate
    var UUID: String

    var isOverdue: Bool {
        return (NSDate().compare(self.deadline) == NSComparisonResult.OrderedDescending) // deadline is earlier than current date
    }
}