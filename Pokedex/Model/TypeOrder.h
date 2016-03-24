//
//  TypeOrder.h
//  Pokedex
//
//  Created by Nathan Johnson on 3/22/16.
//  Copyright © 2016 Nathan Johnson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TypeRef.h"

@interface TypeOrder : NSObject

@property (nonatomic) int slot;
@property (nonatomic) TypeRef *typeRef;

+ (TypeOrder *) initWithDict:(NSDictionary *)dict;

@end
