//
//  Pokemon.h
//  Pokedex
//
//  Created by Nathan Johnson on 3/22/16.
//  Copyright © 2016 Nathan Johnson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Sprites.h"

@interface Pokemon : NSObject

@property (nonatomic) NSNumber *id;
@property (nonatomic) int height;    // decimeters (0.1m)
@property (nonatomic) NSString *name;
@property (nonatomic) int weight;    // hectograms (100g)
@property (nonatomic) Sprites *sprites;
@property (nonatomic) NSArray *typeOrders;

+ (Pokemon *) initWithDict:(NSDictionary *)dict;

@end
