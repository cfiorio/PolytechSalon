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
#import "PSDocType.h"
#import "PSPool.h"

@interface PSLibrary : NSObject

@property (nonatomic,readonly,strong) NSDictionary* types;
@property (nonatomic,readonly,strong) NSDictionary* areas;
@property (nonatomic,readonly,strong) NSSet* docs;
@property (nonatomic,readonly,strong) NSMutableSet* pools;

- (id) init;
- (void) addPool:(PSPool*)pool;

@end
