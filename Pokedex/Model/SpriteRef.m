//
//  SpriteRef.m
//  Pokedex
//
//  Created by Nathan Johnson on 3/24/16.
//  Copyright © 2016 Nathan Johnson. All rights reserved.
//

#import "SpriteRef.h"

@implementation SpriteRef

+ (SpriteRef *) initWithDict:(NSDictionary *)dict {
    SpriteRef *spriteRef = [[SpriteRef alloc] init];
    
    spriteRef.name = dict[@"name"];
    spriteRef.resourceURI = dict[@"resource_uri"];  // begins with / (e.g. "/api/v1/sprite/20/")
    
    return spriteRef;
}

@end
