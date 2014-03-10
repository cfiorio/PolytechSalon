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
    NSArray* tabAreaKeys = [NSArray arrayWithObjects:@"IG", @"ERII", @"Mat", @"M&I", @"STE", @"STIA", @"ENR", @"MSI", @"EGC", @"SE", nil];
    NSArray* tabTypes = [NSArray arrayWithObjects:[[PSDocType alloc] initWithName:@"URL"], nil];
    NSArray* tabTypeKeys = [NSArray arrayWithObjects:@"URL", nil];
    self = [super init];
    if (self) {
        _types = [NSDictionary dictionaryWithObjects:tabTypes forKeys:tabTypeKeys];
        _areas = [NSDictionary dictionaryWithObjects:tabAreas forKeys:tabAreaKeys];
        _docs = [NSSet setWithObjects:
                      [[PSDocument alloc] initWithName:@"Plaquette IG" type:[self.types objectForKey:@"URL"] andArea:[self.areas objectForKey:@"IG"]],
                      [[PSDocument alloc] initWithName:@"Syllabus IG" type:[self.types objectForKey:@"URL"] andArea:[self.areas objectForKey:@"IG"]],
                      [[PSDocument alloc] initWithName:@"Plaquette ERII" type:[self.types objectForKey:@"URL"] andArea:[self.areas objectForKey:@"ERII"]],
                      [[PSDocument alloc] initWithName:@"Syllabus ERII" type:[self.types objectForKey:@"URL"] andArea:[self.areas objectForKey:@"ERII"]],
                      [[PSDocument alloc] initWithName:@"Plaquette Mat" type:[self.types objectForKey:@"URL"] andArea:[self.areas objectForKey:@"Mat"]],
                      [[PSDocument alloc] initWithName:@"Syllabus M&I" type:[self.types objectForKey:@"URL"] andArea:[self.areas objectForKey:@"M&I"]],nil];
        _pools = [NSMutableSet setWithCapacity:10];
    }
    return self;
}

- (void) addPool:(PSPool *)pool{
    [self.pools addObject:pool];
}

@end
