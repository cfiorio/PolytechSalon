//
//  PSLibrary.m
//  Polytech Salon
//
//  Created by Fiorio Christophe on 09/03/2014.
//  Copyright (c) 2014 Fiorio Christophe. All rights reserved.
//

#import "PSLibrary.h"

@implementation PSLibrary

@synthesize types=_types;
@synthesize areas=_areas;
@synthesize docs=_docs;
@synthesize pools=_pools;

- (id)init
{
    NSArray* tabAreas = [NSArray arrayWithObjects:[[PSArea alloc] initWithName:@"IG"],[[PSArea alloc] initWithName:@"ERII"],[[PSArea alloc] initWithName:@"Mat"],[[PSArea alloc] initWithName:@"M&I"],[[PSArea alloc] initWithName:@"STE"],[[PSArea alloc] initWithName:@"STIA"],[[PSArea alloc] initWithName:@"ENR"],[[PSArea alloc] initWithName:@"MSI"],[[PSArea alloc] initWithName:@"EGC"],[[PSArea alloc] initWithName:@"SE"], nil];
    NSArray* tabTypes = [NSArray arrayWithObjects:[[PSType alloc] initWithName:@"URL"], nil];
    self = [super init];
    if (self) {
        _types = [[PSSetOfTypes alloc]initWithArray:tabTypes];
        _areas = [[PSSetOfAreas alloc]initWithArray:tabAreas];
        _docs = [[NSMutableSet alloc] initWithSet:
                 [NSSet setWithObjects:
                      [[PSDocument alloc] initWithName:@"Plaquette IG" type:[self.types typeOfName:@"URL"] andArea:[self.areas areaOfName:@"IG"]],
                      [[PSDocument alloc] initWithName:@"Syllabus IG" type:[self.types typeOfName:@"URL"] andArea:[self.areas areaOfName:@"IG"]],
                      [[PSDocument alloc] initWithName:@"Plaquette ERII" type:[self.types typeOfName:@"URL"] andArea:[self.areas areaOfName:@"ERII"]],
                      [[PSDocument alloc] initWithName:@"Syllabus ERII" type:[self.types typeOfName:@"URL"] andArea:[self.areas areaOfName:@"ERII"]],
                      [[PSDocument alloc] initWithName:@"Plaquette Mat" type:[self.types typeOfName:@"URL"] andArea:[self.areas areaOfName:@"Mat"]],
                      [[PSDocument alloc] initWithName:@"Syllabus M&I" type:[self.types typeOfName:@"URL"] andArea:[self.areas areaOfName:@"M&I"]],nil]];
//        _pools = [[NSMutableSet alloc] initWithCapacity:10];
        _pools = [NSMutableSet setWithCapacity:10];
    }
    return self;
}

- (void) addPool:(PSPool *)pool{
    [self.pools addObject:pool];
}

@end
