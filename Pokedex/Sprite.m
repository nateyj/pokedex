//
//  Sprite.m
//  Pokedex
//
//  Created by Nathan Johnson on 3/24/16.
//  Copyright © 2016 Nathan Johnson. All rights reserved.
//

#import "Sprite.h"

@implementation Sprite

+ (Sprite *) initWithDict:(NSDictionary *)dict andResourceURI:(NSString *)resourceURI {
    Sprite *sprite = [[Sprite alloc] init];
    
    sprite.id = [dict[@"id"] intValue];
    sprite.image = dict[@"image"];
    sprite.name = dict[@"name"];
    sprite.resourceURI = resourceURI;
    
    return sprite;
}

@end
