//
//  Polytech_SalonTests.m
//  Polytech SalonTests
//
//  Created by Fiorio Christophe on 09/03/2014.
//  Copyright (c) 2014 Fiorio Christophe. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <XCTest/XCTestAssertions.h>
#import "PSType.h"
#import "PSArea.h"
#import "PSDocument.h"
#import "PSPool.h"
#import "PSLibrary.h"
#import "PSSetIndexedByName.h"

@interface Polytech_SalonTests : XCTestCase

@end

@implementation Polytech_SalonTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testPSTypeCreation
{
    PSType* docType = [[PSType alloc] initWithName:@"URL type"];
    XCTAssertEqualObjects(docType.name, @"URL type");
}

- (void)testPSAreaCreation
{
    // initialization test
    PSArea* area1 = [[PSArea alloc] initWithName:@"IG"];
    XCTAssertEqualObjects(area1.name, @"IG");
    // initialization with set test
    PSType* aType = [[PSType alloc] initWithName:@"type"];
    NSArray* tabDocs = [NSArray arrayWithObjects:
                        [[PSDocument alloc] initWithName:@"Doc1" andType:aType],
                        [[PSDocument alloc] initWithName:@"Doc2" andType:aType],
                        [[PSDocument alloc] initWithName:@"Doc3" andType:aType],
                        nil];
    NSMutableSet* set = [NSMutableSet setWithArray:tabDocs];
    PSArea* area2 = [[PSArea alloc] initWithName:@"IG" andDocsSet:set];
    XCTAssertEqualObjects(area2.name, @"IG");
    XCTAssertEqualObjects(area2.docsList, set);
    XCTAssertEqualObjects([(PSDocument*)[tabDocs objectAtIndex:0] area],area2);
    XCTAssertEqualObjects([(PSDocument*)[tabDocs objectAtIndex:1] area],area2);
    XCTAssertEqualObjects([(PSDocument*)[tabDocs objectAtIndex:2] area],area2);
}

- (void)testPSDocumentCreation
{
    // initialization test
    PSType* type = [[PSType alloc] initWithName:@"URL"];
    PSDocument* doc1 = [[PSDocument alloc] initWithName:@"IG" andType:type];
    XCTAssertEqualObjects(doc1.name, @"IG");
    XCTAssertEqualObjects(doc1.type, type);
    // initialization with area test
    PSArea* area = [[PSArea alloc] initWithName:@"area"];
    PSDocument* doc2 = [[PSDocument alloc] initWithName:@"IG" type:type andArea:area];
    XCTAssertEqualObjects(doc2.name, @"IG");
    XCTAssertEqualObjects(doc1.type, type);
    XCTAssertEqualObjects(doc2.area, area);
}

- (void)testPSPoolCreation
{
    // initialization test
    PSPool* pool = [[PSPool alloc] initWithName:@"pool test"];
    XCTAssertEqualObjects(pool.name, @"pool test");
}

- (void)testPSPoolAddDelDoc
{
    // initialization test
    PSType* type = [[PSType alloc] initWithName:@"URL"];
    PSDocument* doc1 = [[PSDocument alloc] initWithName:@"IG1" andType:type];
    PSDocument* doc2 = [[PSDocument alloc] initWithName:@"IG2" andType:type];
    PSDocument* doc3 = [[PSDocument alloc] initWithName:@"IG3" andType:type];
    PSPool* pool = [[PSPool alloc] initWithName:@"pool test"];
    [pool addDoc:doc1];
    XCTAssertEqualObjects([pool.docsList member:doc1],doc1);
    [pool addDoc:doc2];
    [pool addDoc:doc3];
    XCTAssertEqualObjects([pool.docsList member:doc2],doc2);
    XCTAssertEqualObjects([pool.docsList member:doc3],doc3);
    [pool delDoc:doc2];
    XCTAssertNotEqualObjects([pool.docsList member:doc2],doc2);
}

- (void)testPSLibrary
{
    // initialization test
    PSLibrary* lib = [[PSLibrary alloc] init];
    XCTAssertEqualObjects([[lib.types typeOfName:@"URL"] name],@"URL");
    XCTAssertEqualObjects([[lib.areas areaOfName:@"IG"] name],@"IG");
    XCTAssertEqualObjects([[lib.areas areaOfName:@"ERII"] name],@"ERII");
    XCTAssertEqualObjects([[lib.areas areaOfName:@"Mat"] name],@"Mat");
    XCTAssertEqualObjects([[lib.areas areaOfName:@"M&I"] name],@"M&I");
    XCTAssertEqualObjects([[lib.areas areaOfName:@"STE"] name],@"STE");
    XCTAssertEqualObjects([[lib.areas areaOfName:@"STIA"] name],@"STIA");
    XCTAssertEqualObjects([[lib.areas areaOfName:@"MSI"] name],@"MSI");
    XCTAssertEqualObjects([[lib.areas areaOfName:@"EGC"] name],@"EGC");
    XCTAssertEqualObjects([[lib.areas areaOfName:@"SE"] name],@"SE");
    XCTAssert([lib.docs count]==6); // check if there is 6 members
    // IG docs
    NSSet* docs = [lib.docs objectsPassingTest:^(id obj, BOOL *stop){
        BOOL r = [[[(PSDocument*)obj area] name] isEqual:@"IG"];
        return r;
    }];
    XCTAssert([docs count]==2); // 2 docs of IG area
    for (PSDocument* doc in docs){ // check IG docs name
        XCTAssert([[doc name] isEqualToString:@"Plaquette IG"] || [[doc name] isEqualToString:@"Syllabus IG"]);
    }
    // ERII docs
    docs = [lib.docs objectsPassingTest:^(id obj, BOOL *stop){
        BOOL r = [[[(PSDocument*)obj area] name] isEqual:@"ERII"];
        return r;
    }];
    XCTAssert([docs count]==2); // 2 docs of ERII area
    for (PSDocument* doc in docs){ // check ERII docs name
        XCTAssert([[doc name] isEqualToString:@"Plaquette ERII"] || [[doc name] isEqualToString:@"Syllabus ERII"]);
    }
    // Mat docs
    docs = [lib.docs objectsPassingTest:^(id obj, BOOL *stop){
        BOOL r = [[[(PSDocument*)obj area] name] isEqual:@"Mat"];
        return r;
    }];
    XCTAssert([docs count]==1); // 1 doc of Mat area
    for (PSDocument* doc in docs){ // check Mat doc name
        XCTAssert([[doc name] isEqualToString:@"Plaquette Mat"]);
    }
    // M&I docs
    docs = [lib.docs objectsPassingTest:^(id obj, BOOL *stop){
        BOOL r = [[[(PSDocument*)obj area] name] isEqual:@"M&I"];
        return r;
    }];
    XCTAssert([docs count]==1); // 1 doc of Mat area
    for (PSDocument* doc in docs){ // check Mat doc name
        XCTAssert([[doc name] isEqualToString:@"Syllabus M&I"]);
    }
}

- (void)testPSSetOfObjectsWithNameInit
{
    PSSetIndexedByName* set = [[PSSetIndexedByName alloc] init];
    XCTAssert(set != nil);
    XCTAssert([set count]==0);
}

- (void)testPSSetOfObjectsWithNameInitWithArray
{
    NSArray* anArray = [NSArray arrayWithObjects:
                        [[PSType alloc] initWithName:@"type01"],
                        [[PSType alloc] initWithName:@"type02"],
                        [[PSType alloc] initWithName:@"type03"],
                        [[PSType alloc] initWithName:@"type04"], nil];
    PSSetIndexedByName* set = [[PSSetIndexedByName alloc] initWithArray:anArray];
    XCTAssert(set != nil);
    XCTAssert([set count]==4);
    NSArray* names = [set allNames];
    for (id str in names){
        NSLog(@"name=%@",str);
    }
    NSArray* objects = [set allObjects];
    XCTAssert([anArray containsObject:[objects objectAtIndex:0]]);
    XCTAssert([anArray containsObject:[objects objectAtIndex:1]]);
    XCTAssert([anArray containsObject:[objects objectAtIndex:2]]);
    XCTAssert([anArray containsObject:[objects objectAtIndex:3]]);
    id obj = [set objectForName:@"type03"];
    XCTAssert(obj==[anArray objectAtIndex:2]);
    XCTAssertEqualObjects(obj,[anArray objectAtIndex:2]);
    NSArray* sortedObjects = [set sortedArrayByName];
    for (id o in sortedObjects){
        XCTAssertTrue([o isKindOfClass:[PSType class]]);
    }
    for (id o in sortedObjects){
        NSLog(@"name = %@",[o name]);
    }
}

- (void)testPSSetOfObjectsWithNameInitWithSet
{
    NSSet* aSet = [NSSet setWithObjects:
                   [[PSType alloc] initWithName:@"type01"],
                   [[PSType alloc] initWithName:@"type02"],
                   [[PSType alloc] initWithName:@"type03"],
                   [[PSType alloc] initWithName:@"type04"], nil];
    PSSetIndexedByName* set = [[PSSetIndexedByName alloc] initWithSet:aSet];
    XCTAssert(set != nil);
    XCTAssert([set count]==4);
    NSArray* names = [set allNames];
    for (id str in names){
        NSLog(@"name=%@",str);
    }
    NSArray* objects = [set allObjects];
    XCTAssert([aSet containsObject:[objects objectAtIndex:0]]);
    XCTAssert([aSet containsObject:[objects objectAtIndex:1]]);
    XCTAssert([aSet containsObject:[objects objectAtIndex:2]]);
    XCTAssert([aSet containsObject:[objects objectAtIndex:3]]);
}

- (void)testPSSetOfObjectsWithName
{
    NSArray* anArray = [NSArray arrayWithObjects:
                        [[PSType alloc] initWithName:@"type01"],
                        [[PSType alloc] initWithName:@"type02"],
                        [[PSType alloc] initWithName:@"type03"],
                        [[PSType alloc] initWithName:@"type04"], nil];
    PSSetIndexedByName* set = [[PSSetIndexedByName alloc] init];
    XCTAssert(set != nil);
    XCTAssert([set count]==0);
    [set addObject:[anArray objectAtIndex:0] forName:@"type01"];
    XCTAssert([set count]==1);
    [set addObject:[anArray objectAtIndex:1] forName:@"type02"];
    XCTAssert([set count]==2);
    [set addObject:[anArray objectAtIndex:2] forName:@"type03"];
    XCTAssert([set count]==3);
    [set addObject:[anArray objectAtIndex:3] forName:@"type04"];
    XCTAssertTrue([set count]==4);
    XCTAssertTrue([set containsObject:[anArray objectAtIndex:0] forName:@"type01"]);
    XCTAssertTrue([set containsObject:[anArray objectAtIndex:1] forName:@"type02"]);
    XCTAssertTrue([set containsObject:[anArray objectAtIndex:2] forName:@"type03"]);
    XCTAssertTrue([set containsObject:[anArray objectAtIndex:3] forName:@"type04"]);
    XCTAssertFalse([set containsObject:[[PSType alloc] initWithName:@"type04"] forName:@"type04"]);
    XCTAssertTrue([set containsObjectForName:@"type01"]);
    XCTAssertTrue([set containsObjectForName:@"type02"]);
    XCTAssertTrue([set containsObjectForName:@"type03"]);
    XCTAssertTrue([set containsObjectForName:@"type04"]);
    XCTAssertFalse([set containsObjectForName:@"type05"]);
    id o=[set removeObject:[anArray objectAtIndex:1] forName:@"type02"];
    XCTAssertEqualObjects(o,[anArray objectAtIndex:1]);
    XCTAssertTrue(o==[anArray objectAtIndex:1]);
    XCTAssertFalse([set containsObject:[anArray objectAtIndex:1] forName:@"type02"]);
    XCTAssertFalse([set containsObjectForName:@"type02"]);
    XCTAssertThrows([set removeObjectForName:@"type02"], @"object of this name not present in set");
    XCTAssertThrows([set removeObject:[anArray objectAtIndex:1] forName:@"type02"],@"object of this name not present in set");
    o=[set removeObjectForName:@"type03"];
    XCTAssertFalse([set containsObject:[anArray objectAtIndex:1] forName:@"type02"]);
    XCTAssertTrue([set count]==2);
    o=[set removeObjectForName:@"type04"];
    o=[set removeObjectForName:@"type01"];
    XCTAssertTrue([set count]==0);
}

- (void)testPSSetOfObjectsWithNameKVO
{
    NSArray* anArray = [NSArray arrayWithObjects:
                        [[PSType alloc] initWithName:@"type01"],
                        [[PSType alloc] initWithName:@"type02"],
                        [[PSType alloc] initWithName:@"type03"],
                        [[PSType alloc] initWithName:@"type04"], nil];
    PSSetIndexedByName* set = [[PSSetIndexedByName alloc] init];
    XCTAssert(set != nil);
    XCTAssert([set count]==0);
    [set addObject:[anArray objectAtIndex:0] forName:@"type01"];
    XCTAssert([set count]==1);
    [set addObject:[anArray objectAtIndex:1] forName:@"type02"];
    XCTAssert([set count]==2);
    [set addObject:[anArray objectAtIndex:2] forName:@"type03"];
    XCTAssert([set count]==3);
    [set addObject:[anArray objectAtIndex:3] forName:@"type04"];
    XCTAssertTrue([set count]==4);
    [[anArray objectAtIndex:2] setName:@"new name!"];
    XCTAssertThrows([set removeObjectForName:@"type03"], @"object of this name not present in set");
    XCTAssertFalse([set containsObjectForName:@"type03"]);
    XCTAssertTrue([set containsObjectForName:@"new name!"]);
    XCTAssertTrue([set containsObject:[anArray objectAtIndex:2] forName:@"new name!"]);
    [set removeObjectForName:@"type01"];
    [set removeObjectForName:@"type02"];
    [set removeObjectForName:@"new name!"];
    [set removeObjectForName:@"type04"];
}

@end
