//
//  PSDocument.m
//  Polytech Salon
//
//  Created by Fiorio Christophe on 09/03/2014.
//  Copyright (c) 2014 Fiorio Christophe. All rights reserved.
//

#import "PSDocument.h"

@implementation PSDocument

@synthesize name=_name;
@synthesize type=_type;
@synthesize area=_area;

- (id)initWithName:(NSString *)name type:(PSType*) type andArea:(PSArea*) area
{
    self = [super init];
    if (self) {
        _name = [name copy];
        _type = type;
        _area = area;
    }
    return self;
}

- (id)initWithName:(NSString *)name andType:(PSType*) type
{
    return [self initWithName:name type:type andArea:nil];
}

@end
