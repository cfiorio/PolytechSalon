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

- (id)initWithName:(NSString *)aName type:(PSType*)aType andArea:(PSArea*)anArea
{
    self = [super init];
    if (self) {
        _name = aName;
        _area = nil;
        _type = aType;
        if(anArea!=nil) self.area=anArea;
    }
    return self;
}

- (id)initWithName:(NSString *)name andType:(PSType*) type
{
    return [self initWithName:name type:type andArea:nil];
}

- (void) setArea:(PSArea *)area{
    if(self->_area!=nil){
        [self->_area removeDocument:self];
    }
    self->_area=area;
    [area addDocument:self];
}


@end
