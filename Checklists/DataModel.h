//
//  DataModel.h
//  Checklists
//
//  Created by 朱里达 on 14/9/24.
//  Copyright (c) 2014年 朱里达. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataModel : NSObject

@property (nonatomic, strong) NSMutableArray *lists;

- (void)saveChecklists;
- (NSInteger)indexOfSelectedChecklist;
- (void)setIndexOfSelectedChecklist:(NSInteger)index;
- (void)sortChecklists;

+ (NSInteger)nextChecklistItemId;

@end
