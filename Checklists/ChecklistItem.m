//
//  ChecklistItem.m
//  Checklists
//
//  Created by 朱里达 on 14/9/15.
//  Copyright (c) 2014年 朱里达. All rights reserved.
//

#import "ChecklistItem.h"
#import "DataModel.h"
#import <UIKit/UIKit.h>

@implementation ChecklistItem

- (id)init {
    if (self = [super init]) {
        self.itemId = [DataModel nextChecklistItemId];
    }
    return self;
}

- (void)toggleChecked
{
    self.checked = !self.checked;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super init])) {
        self.text = [aDecoder decodeObjectForKey:@"Text"];
        self.checked = [aDecoder decodeObjectForKey:@"Checked"];
        self.dueDate = [aDecoder decodeObjectForKey:@"DueDate"];
        self.shouldRemind = [aDecoder decodeBoolForKey:@"ShouldRemind"];
        self.itemId = [aDecoder decodeIntegerForKey:@"ItemId"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.text forKey:@"Text"];
    [aCoder encodeBool:self.checked forKey:@"Checked"];
    [aCoder encodeObject:self.dueDate forKey:@"DueDate"];
    [aCoder encodeBool:self.shouldRemind forKey:@"ShouldRemind"];
    [aCoder encodeInteger:self.itemId forKey:@"ItemId"];
}

- (void)scheduleNotification
{
    UILocalNotification *existingNotification = [self notificationForThisItem];
    if (existingNotification != nil) {
        NSLog(@"Found an existing notification %@", existingNotification);
        [[UIApplication sharedApplication] cancelLocalNotification:existingNotification];
    }
    
    if (self.shouldRemind &&
        [self.dueDate compare:[NSDate date]] != NSOrderedAscending)
    {
        UILocalNotification *localNotification = [[UILocalNotification alloc] init];
        localNotification.fireDate = self.dueDate;
        localNotification.timeZone = [NSTimeZone defaultTimeZone];
        localNotification.alertBody = self.text;
        localNotification.soundName = UILocalNotificationDefaultSoundName;
        localNotification.userInfo = @{@"ItemId": @(self.itemId)};
        [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
        NSLog(@"Scheduled notification %@ for itemId %ld", localNotification, (long)self.itemId);
    }
}

- (UILocalNotification *)notificationForThisItem
{
    NSArray *allNotifications = [[UIApplication sharedApplication] scheduledLocalNotifications];
    for (UILocalNotification *notification in allNotifications) {
        NSNumber *number = [notification.userInfo objectForKey:@"ItemId"];
        if (number != nil && [number integerValue] == self.itemId) {
            return notification;
        }
    }
    return nil;
}

- (void)dealloc
{
    UILocalNotification *existingNotification = [self notificationForThisItem];
    if (existingNotification != nil) {
        NSLog(@"Removing existing notification %@", existingNotification);
        [[UIApplication sharedApplication] cancelLocalNotification:existingNotification];
    }
}

@end
