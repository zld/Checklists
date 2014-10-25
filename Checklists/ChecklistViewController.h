//
//  ViewController.h
//  Checklists
//
//  Created by 朱里达 on 14/9/12.
//  Copyright (c) 2014年 朱里达. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemDetailViewController.h"

@class Checklist;

@interface ChecklistViewController : UITableViewController
<ItemDetailViewControllerDelegate>

@property (nonatomic, strong) Checklist *checklist;

@end

