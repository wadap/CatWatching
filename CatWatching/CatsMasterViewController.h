//
//  CatsMasterViewController.h
//  CatWatching
//
//  Created by shuichi.wada on 2014/01/20.
//  Copyright (c) 2014年 shuichi.wada. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CatSightingDataController;

@interface CatsMasterViewController : UITableViewController

@property (strong, nonatomic) CatSightingDataController *dataController;

- (IBAction)done:(UIStoryboardSegue *) segue;
- (IBAction)cancel:(UIStoryboardSegue *) segue;

@end
