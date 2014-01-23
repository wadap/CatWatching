//
//  CatSighting.m
//  CatWatching
//
//  Created by shuichi.wada on 2014/01/20.
//  Copyright (c) 2014年 shuichi.wada. All rights reserved.
//

#import "CatSighting.h"

@implementation CatSighting

- (id)initWithName:(NSString *)name location:(NSString *)location date:(NSDate *)date
{
    self = [self init];
    if (self) {
        _name = name;
        _location = location;
        _date = date;
        return  self;
    }
    return  nil;
}

@end
