//
//  NSArray+Safe.h
//  HSKCommon
//
//  Created by Carl on 2016/11/23.
//  Copyright © 2016年 Carl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray<__covariant ObjectType> (Safe)

- (ObjectType)safeObjectAtIndex:(NSInteger)index;

- (NSInteger)safeIndexOfObject:(id)anObject;

@end


@interface NSMutableArray (Safe)

- (void)safeAddObject:(id)object;

- (void)safeInsertObject:(id)object atIndex:(NSInteger)index;

- (void)safeInsertObjects:(NSArray *)objects atIndexes:(NSIndexSet *)indexs;

- (void)safeRemoveObjectAtIndex:(NSInteger)index;

- (void)safeRemoveObjectsInRange:(NSRange)range;

@end
