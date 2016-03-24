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
//    pokemon.url = dict[@"url"];   //V2
    pokemon.resourceURI = dict[@"resource_uri"];    // e.g. "api/v1/pokemon/1/"
    
    return pokemon;
}

@end
