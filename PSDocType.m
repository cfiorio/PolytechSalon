//
//  PSDocType.m
//  Polytech Salon
//
//  Created by Fiorio Christophe on 09/03/2014.
//  Copyright (c) 2014 Fiorio Christophe. All rights reserved.
//

#import "PSDocType.h"

@implementation PSDocType

@synthesize name=_name;

- (id)initWithName:(NSString*)aName{
    self = [super init];
    if (self) {
        _name = [aName copy];
    }
    return self;
}
@end
