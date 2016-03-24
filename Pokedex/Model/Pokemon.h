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
//@property (nonatomic) int height;    // decimeters (0.1m); V2
@property (nonatomic) NSString *height;
@property (nonatomic) NSString *name;
//@property (nonatomic) int weight;    // hectograms (100g); V2
@property (nonatomic) NSString *weight;
//@property (nonatomic) Sprites *sprites; //V2
@property (nonatomic) NSArray *sprites;
//@property (nonatomic) NSArray *typeOrders;  //V2
@property (nonatomic) NSArray *types;

+ (Pokemon *) initWithDict:(NSDictionary *)dict;

@end
