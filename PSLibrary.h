//
//  PSLibrary.h
//  Polytech Salon
//
//  Created by Fiorio Christophe on 09/03/2014.
//  Copyright (c) 2014 Fiorio Christophe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PSDocument.h"
#import "PSArea.h"
#import "PSType.h"
#import "PSPool.h"
#import "PSSetOfAreas.h"
#import "PSSetOfTypes.h"
#import "NSMutableSet+PSSet.h"

@interface PSLibrary : NSObject

@property (nonatomic,readonly,strong) PSSetOfTypes* types;
@property (nonatomic,readonly,strong) PSSetOfAreas* areas;
@property (nonatomic,readonly,strong) NSMutableSet* docs;
@property (nonatomic,readonly,strong) NSMutableSet* pools;

- (id) init;
- (void) addPool:(PSPool*)pool;

@end
