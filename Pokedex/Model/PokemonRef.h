//
//  Pokemon.h
//  Pokedex
//
//  Created by Nathan Johnson on 3/18/16.
//  Copyright © 2016 Nathan Johnson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PokemonRef : NSObject

@property (nonatomic) NSString *name;
//@property (nonatomic) NSString *url;    //V2
@property (nonatomic) NSString *resourceURI;

+ (PokemonRef *) initWithDict:(NSDictionary *)dict;

@end
