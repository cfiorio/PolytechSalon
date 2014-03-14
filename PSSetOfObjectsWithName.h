//
//  PSSetOfObject.h
//  Polytech Salon
//
//  Created by Fiorio Christophe on 12/03/2014.
//  Copyright (c) 2014 Fiorio Christophe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PSSetOfObjectsWithName : NSObject
{
    @private NSMutableDictionary* dico;
}

- (id) init;
- (id) initWithArray:(NSArray*)anArray;
- (id) initWithSet:(NSSet*)aSet;

// add an object into the set (the private NSDictionnary instance variable), associated key is the object name
// register itself as an observer of name property of object inserted
// Exception thrown: object of this name already present in set
- (void)addObject:(id)object ofName:(NSString*)aName;

// remove object with the given name of the set, remove also self as observer of property name
// return object removed
// Exception thrown: object of this name not present in set
- (id)removeObjectOfName:(NSString*)aName;
// remove a given object with a given name of the set, remove also self as observer of property name
// return object removed
// Exception thrown: object of this name not present in set
// Exception thrown: object of this name present in set is not the one to remove
- (id)removeObject:(id)object ofName:(NSString*)aName;

// check if an object with a given name belongs to the set
- (BOOL)containsObjectOfName:(NSString*)aName;
// check if a given object with a given name belongs to the set
- (BOOL)containsObject:(id)object ofName:(NSString*)aName;

// return object of name aName contained in the set ; return nil no object of the set has this name
- (id) objectOfName:(NSString*)object;

// returns number of objects contained in the set
- (NSUInteger)count;
// return an array of all object names
- (NSArray *)allNames;


// return a new array containing objects of the set.
- (NSArray*) allObjects;
// return a new array containing objects of the set sorted by their name
- (NSArray*) sortedArrayByName;


@end
