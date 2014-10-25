//
//  Checklist.h
//  Checklists
//
//  Created by 朱里达 on 14/9/18.
//  Copyright (c) 2014年 朱里达. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Checklist : NSObject <NSCoding>

@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSMutableArray *items;
@property (nonatomic, copy) NSString *iconName;

- (int)countUncheckedItems;

@end
