//
//  PSSetOfAreas.h
//  Polytech Salon
//
//  Created by Fiorio Christophe on 12/03/2014.
//  Copyright (c) 2014 Fiorio Christophe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PSSetOfObjectsWithName.h"
#import "PSArea.h"

@interface PSSetOfAreas : PSSetOfObjectsWithName

- (id) init;
- (id) initWithArray:(NSArray*)anArray;
- (id) initWithSet:(NSSet*)aSet;

// add a PSArea into the set
- (void)addArea:(PSArea*) anArea;
// add a newly created PSArea of name aName into the set
// return the newly created PSArea
- (PSArea*) addAreaOfName:(NSString*)anArea;


// remove PSArea with the given name of the set
// return PSArea removed
// Exception thrown: object of this name not present in set
- (PSArea*) removeAreaOfName:(NSString*)aName;

// remove a given object of the set
// return PSArea removed
// Exception thrown: object of this name not present in set - thrown if PSArea with same name as the one in argument is not present in the set
// Exception thrown: object of this name present in set is not the one to remove - thrown if PSArea with same name as the one in argument is not the on given in argument
- (PSArea*)removeArea:(PSArea*) anArea;


// check if a given PSArea belongs to the set
- (BOOL)containsArea:(PSArea*) anArea;
// check if a PSArea with aName belongs to the set
- (BOOL)containsAreaOfName:(NSString*)aName;


// return PSType of name aName contained in the set ; return nil no PSType of the set has this name
- (PSArea*) areaOfName:(NSString*)aName;


@end
