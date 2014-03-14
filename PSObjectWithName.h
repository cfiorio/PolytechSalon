//
//  PSObjectWithName.h
//  Polytech Salon
//
//  Created by Fiorio Christophe on 14/03/2014.
//  Copyright (c) 2014 Fiorio Christophe. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PSObjectWithName <NSObject>

- (id) initWithName:(NSString*)aName;
- (NSString*) name;
- (void) setName:(NSString*)aName;
@end
