//
//  PSDocument.h
//  Polytech Salon
//
//  Created by Fiorio Christophe on 09/03/2014.
//  Copyright (c) 2014 Fiorio Christophe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PSDocType.h"
#import "PSArea.h"

@interface PSDocument : NSObject

@property (nonatomic,copy) NSString* name;
@property (nonatomic,weak) PSDocType* type;
@property (nonatomic,weak) PSArea* area;

- (id) initWithName:(NSString*)name andType:(PSDocType*) type;
- (id) initWithName:(NSString*)name type:(PSDocType*) type andArea:(PSArea*) area;

@end
