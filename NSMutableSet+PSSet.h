//
//  NSMutableSet+PSSet.h
//  Polytech Salon
//
//  Created by Fiorio Christophe on 13/03/2014.
//  Copyright (c) 2014 Fiorio Christophe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableSet (PSSet)

- (NSArray*) sortedArrayByPropertyName:(NSString*)propertyName;

@end
