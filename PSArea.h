//
//  PSArea.h
//  Polytech Salon
//
//  Created by Fiorio Christophe on 09/03/2014.
//  Copyright (c) 2014 Fiorio Christophe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSMutableSet+PSSet.h"
#import "PSObjectWithName.h"

@class PSDocument;

@interface PSArea : NSObject<PSObjectWithName>

@property (nonatomic,copy) NSString* name;
@property (nonatomic,readonly,strong) NSMutableSet*  docsList;

- (id) initWithName:(NSString*)name;
- (id) initWithName:(NSString*)name andDocsSet:(NSMutableSet*) list;

// add a document to this area
// if doc hasn't yet an area, add self as area of this doc
// Exception thrown: Add document in area failed if document added has another are
- (id) addDocument:(PSDocument*)doc;
// remove a document from this area
// remove also this area as area of this document
- (id) removeDocument:(PSDocument*)doc;
// get an area of all documents of this area
- (NSArray*) allDocuments;
// get a sorted by document name of all documents of this area
- (NSArray*) allDocumentsSortedByName;

@end
