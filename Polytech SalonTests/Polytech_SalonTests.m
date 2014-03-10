//
//  Polytech_SalonTests.m
//  Polytech SalonTests
//
//  Created by Fiorio Christophe on 09/03/2014.
//  Copyright (c) 2014 Fiorio Christophe. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <XCTest/XCTestAssertions.h>
#import "PSDocType.h"
#import "PSArea.h"
#import "PSDocument.h"
#import "PSPool.h"
#import "PSLibrary.h"

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

- (void)testPSDocTypeCreation
{
    PSDocType* docType = [[PSDocType alloc] initWithName:@"URL type"];
    XCTAssertEqualObjects(docType.name, @"URL type");
}

- (void)testPSAreaCreation
{
    // initialization test
    PSArea* area1 = [[PSArea alloc] initWithName:@"IG"];
    XCTAssertEqualObjects(area1.name, @"IG");
    // initialization with set test
    NSMutableSet* set = [NSMutableSet setWithObjects:@"Doc1",@"Doc2",@"Doc3", nil];
    PSArea* area2 = [[PSArea alloc] initWithName:@"IG" andDocsList:set];
    XCTAssertEqualObjects(area2.name, @"IG");
    XCTAssertEqualObjects(area2.docsList, set);
}

- (void)testPSDocumentCreation
{
    // initialization test
    PSDocType* type = [[PSDocType alloc] initWithName:@"URL"];
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
    PSDocType* type = [[PSDocType alloc] initWithName:@"URL"];
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
    XCTAssertEqualObjects([[lib.types objectForKey:@"URL"] name],@"URL");
    XCTAssertEqualObjects([[lib.areas objectForKey:@"IG"] name],@"IG");
    XCTAssertEqualObjects([[lib.areas objectForKey:@"ERII"] name],@"ERII");
    XCTAssertEqualObjects([[lib.areas objectForKey:@"Mat"] name],@"Mat");
    XCTAssertEqualObjects([[lib.areas objectForKey:@"M&I"] name],@"M&I");
    XCTAssertEqualObjects([[lib.areas objectForKey:@"STE"] name],@"STE");
    XCTAssertEqualObjects([[lib.areas objectForKey:@"STIA"] name],@"STIA");
    XCTAssertEqualObjects([[lib.areas objectForKey:@"MSI"] name],@"MSI");
    XCTAssertEqualObjects([[lib.areas objectForKey:@"EGC"] name],@"EGC");
    XCTAssertEqualObjects([[lib.areas objectForKey:@"SE"] name],@"SE");
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

@end
