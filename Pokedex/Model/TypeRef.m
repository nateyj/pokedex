//
//  TypeRef.m
//  Pokedex
//
//  Created by Nathan Johnson on 3/22/16.
//  Copyright © 2016 Nathan Johnson. All rights reserved.
//

#import "TypeRef.h"

@implementation TypeRef

+ (TypeRef *) initWithDict:(NSDictionary *)dict {
    TypeRef *typeRef = [[TypeRef alloc] init];
    
    typeRef.name = dict[@"name"];
    typeRef.url = dict[@"url"];
    
    return typeRef;
}

@end
