//
//  Pokemon.m
//  Pokedex
//
//  Created by Nathan Johnson on 3/18/16.
//  Copyright © 2016 Nathan Johnson. All rights reserved.
//

#import "PokemonRef.h"

@implementation PokemonRef

+ (PokemonRef *) initWithDict:(NSDictionary *)dict {
    PokemonRef *pokemon = [[PokemonRef alloc] init];
    pokemon.name = dict[@"name"];
    pokemon.url = dict[@"url"];
    
    return pokemon;
}

@end
