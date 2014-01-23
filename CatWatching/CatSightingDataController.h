//
//  CatSightingDataController.h
//  CatWatching
//
//  Created by shuichi.wada on 2014/01/20.
//  Copyright (c) 2014年 shuichi.wada. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CatSighting;

@interface CatSightingDataController : NSObject

@property (nonatomic, copy) NSMutableArray *masterCatSightingList;

- (NSUInteger) countOfList;
- (CatSighting *)objectListAtIndex:(NSUInteger) theIndex;
- (void)addCatSightingWithSighting:(CatSighting *)sighting;

@end
