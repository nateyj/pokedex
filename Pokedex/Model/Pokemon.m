//
//  Pokemon.m
//  Pokedex
//
//  Created by Nathan Johnson on 3/22/16.
//  Copyright © 2016 Nathan Johnson. All rights reserved.
//

#import "Pokemon.h"
#import "TypeOrder.h"

@implementation Pokemon

+ (Pokemon *) initWithDict:(NSDictionary *)dict {
    Pokemon *pokemon = [[Pokemon alloc] init];
    
    pokemon.id = dict[@"id"];
    pokemon.name = dict[@"name"];
    pokemon.height = [dict[@"height"] intValue];
    pokemon.weight = [dict[@"weight"] intValue];
    pokemon.sprites = [Sprites initWithDict:dict[@"sprites"]];
    
    NSMutableArray *typeOrderArray;
    
    for (NSDictionary *typeOrderDict in dict[@"types"]) {
        [typeOrderArray addObject:[TypeOrder initWithDict:typeOrderDict]];
    }
    
    pokemon.typeOrders = typeOrderArray;
    
    return pokemon;
}

@end
