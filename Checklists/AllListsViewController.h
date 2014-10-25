//
//  AllListsViewController.h
//  Checklists
//
//  Created by 朱里达 on 14/9/18.
//  Copyright (c) 2014年 朱里达. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListDetailViewController.h"

@class DataModel;

@interface AllListsViewController : UITableViewController
<ListDetailViewControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong)DataModel *dataModel;

@end
