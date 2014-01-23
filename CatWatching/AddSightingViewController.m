//
//  AddSightingViewController.m
//  CatWatching
//
//  Created by shuichi.wada on 2014/01/21.
//  Copyright (c) 2014年 shuichi.wada. All rights reserved.
//

#import "AddSightingViewController.h"
#import "CatSighting.h"

@interface AddSightingViewController ()

@end

@implementation AddSightingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if ((textField == self.catNameInput) || (textField == self.locationInput)) {
        [textField resignFirstResponder];
    }
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ReturnInput"]) {
        if ([self.catNameInput.text length] || [self.locationInput.text length]) {
            CatSighting *sighting;
            NSDate *today = [NSDate date];
            sighting = [[CatSighting alloc] initWithName:self.catNameInput.text location:self.locationInput.text date:today];
            self.catSighting = sighting;
        }
    }
}
@end
