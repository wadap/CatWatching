//
//  CatsDetailViewController.m
//  CatWatching
//
//  Created by shuichi.wada on 2014/01/20.
//  Copyright (c) 2014年 shuichi.wada. All rights reserved.
//

#import "CatsDetailViewController.h"
#import "CatSighting.h"

@interface CatsDetailViewController ()
- (void)configureView;
@end

@implementation CatsDetailViewController

#pragma mark - Managing the detail item

- (void) setSighting:(CatSighting *) newSighting
{
    if (_sighting != newSighting) {
        _sighting = newSighting;
    }
    [self configureView];
    
}

- (void) configureView
{
    CatSighting *theSighting = self.sighting;
    
    static NSDateFormatter *formatter = nil;
    
    if (formatter == nil) {
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterMediumStyle];
    }
    
    if (theSighting) {
        self.birdNameLabel.text = theSighting.name;
        self.locationLabel.text = theSighting.location;
        self.dateLabel.text     = [formatter stringFromDate:(NSDate *)theSighting.date];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
