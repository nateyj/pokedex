//
//  TypeOrder.m
//  Pokedex
//
//  Created by Nathan Johnson on 3/22/16.
//  Copyright © 2016 Nathan Johnson. All rights reserved.
//

#import "TypeOrder.h"
#import "TypeRef.h"

@implementation TypeOrder

+ (TypeOrder *) initWithDict:(NSDictionary *)dict {
    TypeOrder *typeOrder = [[TypeOrder alloc] init];
    
    typeOrder.slot = [dict[@"slot"] intValue];
    typeOrder.typeRef = [TypeRef initWithDict:dict[@"type"]];
    
    return typeOrder;
}

@end
