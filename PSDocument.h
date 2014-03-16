//
//  PSDocument.h
//  Polytech Salon
//
//  Created by Fiorio Christophe on 09/03/2014.
//  Copyright (c) 2014 Fiorio Christophe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PSType.h"
#import "PSArea.h"

@interface PSDocument : NSObject

@property (nonatomic,copy) NSString* name;
@property (nonatomic,weak) PSType* type;
@property (nonatomic,weak) PSArea* area;

- (id) initWithName:(NSString*)name andType:(PSType*) type;
- (id) initWithName:(NSString*)name type:(PSType*) type andArea:(PSArea*) area;

@end
