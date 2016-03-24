//
//  Pokemon.m
//  Pokedex
//
//  Created by Nathan Johnson on 3/22/16.
//  Copyright © 2016 Nathan Johnson. All rights reserved.
//

#import "Pokemon.h"
//#import "TypeOrder.h"   //V2
#import "SpriteRef.h"
#import "TypeRef.h"

@implementation Pokemon

+ (Pokemon *) initWithDict:(NSDictionary *)dict {
    Pokemon *pokemon = [[Pokemon alloc] init];
    
    // V2
//    pokemon.id = dict[@"id"];
//    pokemon.name = dict[@"name"];
//    pokemon.height = [dict[@"height"] intValue];
//    pokemon.weight = [dict[@"weight"] intValue];
//    pokemon.sprites = [Sprites initWithDict:dict[@"sprites"]];
//    
//    NSMutableArray *typeOrderArray;
//    
//    for (NSDictionary *typeOrderDict in dict[@"types"]) {
//        [typeOrderArray addObject:[TypeOrder initWithDict:typeOrderDict]];
//    }
//    
//    pokemon.typeOrders = typeOrderArray;
    
    pokemon.id = dict[@"national_id"];
    pokemon.name = dict[@"name"];
    pokemon.height = dict[@"height"];
    pokemon.weight = dict[@"weight"];
    
    NSMutableArray *sprites = [[NSMutableArray alloc] init];
    
    for (NSDictionary *sprite in dict[@"sprites"]) {
        [sprites addObject:[SpriteRef initWithDict:sprite]];
    }
    
    NSMutableArray *types = [[NSMutableArray alloc] init];
    
    for (NSDictionary *type in dict[@"types"]) {
        [types addObject:[TypeRef initWithDict:type]];
    }
    
    pokemon.sprites = sprites;
    pokemon.types = types;
    
    return pokemon;
}

@end
