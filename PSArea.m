//
//  PSArea.m
//  Polytech Salon
//
//  Created by Fiorio Christophe on 09/03/2014.
//  Copyright (c) 2014 Fiorio Christophe. All rights reserved.
//

#import "PSArea.h"

@implementation PSArea

@synthesize name=_name;
@synthesize docsList=_docsList;

- (id)initWithName:(NSString *)name andDocsList:(NSMutableSet *)list
{
    self = [super init];
    if (self) {
        _name = [name copy];
        _docsList = list;
    }
    return self;
}
- (id)initWithName:(NSString *)name
{
    return [[PSArea alloc] initWithName:name andDocsList:[NSMutableSet setWithCapacity:10]];
}
@end
