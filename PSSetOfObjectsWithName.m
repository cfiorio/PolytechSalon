//
//  PSSetOfObject.m
//  Polytech Salon
//
//  Created by Fiorio Christophe on 12/03/2014.
//  Copyright (c) 2014 Fiorio Christophe. All rights reserved.
//

#import "PSSetOfObjectsWithName.h"

@implementation PSSetOfObjectsWithName

- (id)init
{
    self = [super init];
    if (self) {
        self->dico = [NSMutableDictionary dictionary];
    }
    return self;
}
- (id)initWithArray:(NSArray *)anArray
{
    self = [super init];
    if (self) {
        NSMutableArray* keys = [NSMutableArray arrayWithCapacity:[anArray count]];
        for (int i=0;i<[anArray count];i++){
            [keys insertObject:[(id)[anArray objectAtIndex:i] name] atIndex:i];
        }
        self->dico = [NSMutableDictionary dictionaryWithObjects:anArray forKeys:keys];
    }
    return self;
}
- (id)initWithSet:(NSSet *)aSet
{
    NSArray* anArray = [aSet allObjects];
    return [self initWithArray:anArray];
}

// *************************************************************************************
// Add/remove object in set


// add an object into the set (the private NSDictionnary instance variable), associated key is the object name
// register itself as an observer of name property of object inserted
// Exception thrown: object of this name already present in set
- (void)addObject:(id)object ofName:(NSString *)aName{
    
    if([self->dico objectForKey:aName]!=nil){
        @throw [NSException
                exceptionWithName:@"add object in set failed" reason:@"object of this name already present in set" userInfo:nil];
    }
    else{
        [self->dico setObject:object forKey:aName];
        [object addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionOld context:nil];
    }
}
// if name property of an object belonging to the set is changed, then key is changed accordingly the new name
- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if ([keyPath isEqual:@"name"]) { // check if change has been done into name property
        // no way to change key, just remove and reinsert object into dictionnary
        [self->dico removeObjectForKey:[change objectForKey:NSKeyValueChangeOldKey]];
        [self->dico setObject:object forKey:[object name]];
    }
}
// remove object with the given name of the set, remove also self as observer of property name
// Exception thrown: object of this name not present in set
- (id)removeObjectOfName:(NSString *)aName{
    id obj=[self->dico objectForKey:aName];
    if(obj==nil){
        @throw [NSException exceptionWithName:@"remove object from set failed" reason:@"object of this name not present in set" userInfo:nil];
    }
    else{
        [self->dico removeObjectForKey:aName];
        [obj removeObserver:self forKeyPath:@"name"];
    }
    return obj;
}
// remove a given object with a given name of the set, remove also self as observer of property name
// Exception thrown: object of this name not present in set
// Exception thrown: object of this name present in set is not the one to remove
- (id)removeObject:(id)object ofName:(NSString *)aName{
    id obj=[self->dico objectForKey:aName];
    if(obj==nil){
        @throw [NSException exceptionWithName:@"remove object from set failed" reason:@"object of this name not present in set" userInfo:nil];
    }
    else if (obj!=object){
        @throw [NSException exceptionWithName:@"remove object from set failed" reason:@"object of this name present in set is not the one to remove" userInfo:nil];
    }
    else{
        [self->dico removeObjectForKey:aName];
        [obj removeObserver:self forKeyPath:@"name"];
    }
    return obj;
}
// check if an object with a given name belongs to the set
- (BOOL)containsObjectOfName:(NSString *)aName{
    return ([self->dico objectForKey:aName] != nil);
}
// check if a given object with a given name belongs to the set
- (BOOL)containsObject:(id)object ofName:(NSString *)aName{
    return ([self->dico objectForKey:aName] == object);
}
// return object of name aName contained in the set ; return nil no object of the set has this name
- (id) objectOfName:(NSString*)aName{
    return [self->dico objectForKey:aName];
}

// *************************************************************************************

// returns number of objects contained in the set
- (NSUInteger)count{
    return [self->dico count];
}
// return an array of all object names
- (NSArray *)allNames{
    return [self->dico allKeys];
}

// *************************************************************************************

// return a new array containing objects of the set.
- (NSArray*) allObjects{
    return [self->dico allValues];
}
// return a new array containing objects of the set sorted by their name
- (NSArray*) sortedArrayByName{
    NSArray* anArray = [[self allObjects] sortedArrayUsingComparator:^(id obj1, id obj2){
        if ([obj1 name]>[obj2 name]){
            return (NSComparisonResult)NSOrderedDescending;
        }
        else if ([obj1 name]<[obj2 name]){
            return (NSComparisonResult)NSOrderedAscending;
        }
        else{
            return (NSComparisonResult)NSOrderedSame;
        }
    }];
    return anArray;
}

@end
