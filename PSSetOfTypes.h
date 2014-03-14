//
//  PSSetOfTypes.h
//  Polytech Salon
//
//  Created by Fiorio Christophe on 12/03/2014.
//  Copyright (c) 2014 Fiorio Christophe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PSSetIndexedByName.h"
#import "PSType.h"

@interface PSSetOfTypes : PSSetIndexedByName

- (id) init;
- (id) initWithArray:(NSArray*)anArray;
- (id) initWithSet:(NSSet*)aSet;

// add a PSType into the set
- (void)addType:(PSType*) aType;
// add a newly created PSType of name aName into the set
// return the newly created PSType
- (PSType*) addTypeOfName:(NSString*)aName;


// remove PSType with the given name of the set
// return PSType removed
// Exception thrown: object of this name not present in set
- (PSType*) removeTypeOfName:(NSString*)aName;

// remove a given object of the set
// return PSType removed
// Exception thrown: object of this name not present in set - thrown if PSType with same name as the one in argument is not present in the set
// Exception thrown: object of this name present in set is not the one to remove - thrown if PSType with same name as the one in argument is not the on given in argument
- (PSType*)removeType:(PSType*) aType;


// check if a given PSType belongs to the set
- (BOOL)containsType:(PSType*) aType;
// check if a PSType with aName belongs to the set
- (BOOL)containsTypeOfName:(NSString*)aName;


// return PSType of name aName contained in the set ; return nil no PSType of the set has this name
- (PSType*) typeOfName:(NSString*)aName;

@end
