//
//  PSDataDocuments.m
//  Polytech Salon
//
//  Created by Fiorio Christophe on 14/03/2014.
//  Copyright (c) 2014 Fiorio Christophe. All rights reserved.
//

#import "PSDataDocuments.h"

@implementation PSDataDocuments

- (id)initWithAreas:(PSSetOfAreas *)aSetOfAreas
{
    self = [super init];
    if (self) {
        self->_areas = [aSetOfAreas sortedArrayByName];
        self->_docsByAreas = [NSMutableArray arrayWithCapacity:[self.areas count]];
        for (int i=0; i<[self.areas count]; i++) {
            [self.docsByAreas insertObject:[NSArray arrayWithArray:[[self.areas objectAtIndex:i] allDocumentsSortedByName]] atIndex:i];
        }
    }
    return self;
}

-(PSArea*) getAreaForSection:(NSInteger)aSection{
    return [self.areas objectAtIndex:aSection];
}
-(PSDocument*) getDocumentForSection:(NSInteger) aSection andForRow:(NSInteger)aRow{
    return [[self.docsByAreas objectAtIndex:aSection] objectAtIndex:aRow];
}
-(NSString*) getAreaNameForSection:(NSInteger)aSection{
    return [(PSArea*)[self getAreaForSection:aSection] name];
}
-(NSString*) getDocumentNameForSection:(NSInteger) aSection andForRow:(NSInteger)aRow{
    return [[self getDocumentForSection:aSection andForRow:aRow] name];
}

-(NSInteger) numberOfSections{
    return [self.areas count];
}
-(NSInteger) numberOfRowsForSection:(NSInteger)aSection{
    return [[self.areas objectAtIndex:aSection] numberOfDocuments];
}


@end
