//
//  SpriteRef.h
//  Pokedex
//
//  Created by Nathan Johnson on 3/24/16.
//  Copyright © 2016 Nathan Johnson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SpriteRef : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *resourceURI;

+ (SpriteRef *) initWithDict:(NSDictionary *)dict;

@end
