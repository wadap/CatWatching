//
//  CatsMasterViewController.m
//  CatWatching
//
//  Created by shuichi.wada on 2014/01/20.
//  Copyright (c) 2014年 shuichi.wada. All rights reserved.
//

#import "CatsMasterViewController.h"
#import "CatsDetailViewController.h"
#import "CatSightingDataController.h"
#import "CatSighting.h"
#import "AddSightingViewController.h"

//@interface CatsMasterViewController () {
//    NSMutableArray *_objects;
//}
//@end

@implementation CatsMasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.dataController = [[CatSightingDataController alloc] init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataController countOfList];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifer = @"CatSightingCell";
    static NSDateFormatter *formatter = nil;
    if (formatter == nil) {
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterMediumStyle];
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifer];
    CatSighting *sightingAtIndex = [self.dataController objectListAtIndex:indexPath.row];
    
    [[cell textLabel] setText:sightingAtIndex.name];
    [[cell detailTextLabel] setText:[formatter stringFromDate:(NSDate *)sightingAtIndex]];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ShowSightingDetails"]) {
        CatsDetailViewController *detailViewController = [segue destinationViewController];
        detailViewController.sighting = [self.dataController objectListAtIndex:[self.tableView indexPathForSelectedRow].row];
    }

}

- (IBAction)done:(UIStoryboardSegue *)segue
{
    if ([[segue identifier] isEqualToString:@"ReturnInput"]) {
        AddSightingViewController *addController = [segue sourceViewController];
        if (addController.catSighting) {
            [self.dataController addCatSightingWithSighting:addController.catSighting];
            [[self tableView] reloadData];
        }
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
}

- (IBAction)cancel:(UIStoryboardSegue *)segue
{
    if ([[segue identifier] isEqualToString:@"CancelInput"]){
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
}

@end
