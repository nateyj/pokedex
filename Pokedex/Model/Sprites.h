//
//  Sprites.h
//  Pokedex
//
//  Created by Nathan Johnson on 3/22/16.
//  Copyright © 2016 Nathan Johnson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Sprites : NSObject

@property (nonatomic) NSString *backDefault;
@property (nonatomic) NSString *backFemale;
@property (nonatomic) NSString *backShiny;
@property (nonatomic) NSString *backShinyFemale;
@property (nonatomic) NSString *frontDefault;
@property (nonatomic) NSString *frontFemale;
@property (nonatomic) NSString *frontShiny;
@property (nonatomic) NSString *frontShinyFemale;

+ (Sprites *) initWithDict:(NSDictionary *)dict;

@end
