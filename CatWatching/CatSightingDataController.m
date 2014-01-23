//
//  CatSightingDataController.m
//  CatWatching
//
//  Created by shuichi.wada on 2014/01/20.
//  Copyright (c) 2014年 shuichi.wada. All rights reserved.
//

#import "CatSightingDataController.h"
#import "CatSighting.h"

@interface CatSightingDataController ()
- (void) initializeDefaultDataList;
@end

@implementation CatSightingDataController

// Objectが初期化されるときに呼ばれる処理
// これにより、配列の初期化を実行し最初の値が渡ってくる
- (id) init
{
    if (self = [super init]) {
        [self initializeDefaultDataList];
        return self;
    }
    return nil;
}

// 配列を初期化し、最初の値を渡すための処理
- (void) initializeDefaultDataList
{
    NSMutableArray *sightingList = [[NSMutableArray alloc] init];
    self.masterCatSightingList = sightingList;
    CatSighting *sighting;
    NSDate *today = [NSDate date];
    sighting = [[CatSighting alloc] initWithName:@"三毛猫" location:@"代々木" date:today];
    [self addCatSightingWithSighting:sighting];
}

- (void) setMasterCatSightingList:(NSMutableArray *) newList
{
    if (_masterCatSightingList != newList) {
        _masterCatSightingList = [newList mutableCopy];
    }
}

// 配列の件数を返す処理
- (NSUInteger)countOfList
{
    return [self.masterCatSightingList count];
}

// 配列から指定のindexのデータを返す処理
- (CatSighting *)objectListAtIndex:(NSUInteger)theIndex;
{
    return [self.masterCatSightingList objectAtIndex:theIndex];
}

// objectを追加する処理
- (void)addCatSightingWithSighting:(CatSighting *)sighting
{
    [self.masterCatSightingList addObject:sighting];
}

@end
