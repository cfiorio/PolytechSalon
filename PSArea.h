//
//  PSArea.h
//  Polytech Salon
//
//  Created by Fiorio Christophe on 09/03/2014.
//  Copyright (c) 2014 Fiorio Christophe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PSArea : NSObject{
}

@property (nonatomic,copy) NSString* name;
@property (nonatomic,readonly,strong) NSMutableSet*  docsList;

- (id) initWithName:(NSString*)name;
- (id) initWithName:(NSString*)name andDocsList:(NSMutableSet*) list;

@end
