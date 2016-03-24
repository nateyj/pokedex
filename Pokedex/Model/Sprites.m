//
//  Sprites.m
//  Pokedex
//
//  Created by Nathan Johnson on 3/22/16.
//  Copyright © 2016 Nathan Johnson. All rights reserved.
//

#import "Sprites.h"

@implementation Sprites

+ (Sprites *) initWithDict:(NSDictionary *)dict {
    Sprites *sprites = [[Sprites alloc] init];
    
    sprites.backDefault = dict[@"back_default"];
    sprites.backFemale = dict[@"back_female"];
    sprites.backShiny = dict[@"back_shiny"];
    sprites.backShinyFemale = dict[@"back_shiny_female"];
    sprites.frontDefault = dict[@"front_default"];
    sprites.frontFemale = dict[@"front_female"];
    sprites.frontShiny = dict[@"front_shiny"];
    sprites.frontShinyFemale = dict[@"front_shiny_female"];
    
    return sprites;
}

@end
