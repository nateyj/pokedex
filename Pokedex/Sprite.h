//
//  Sprite.h
//  Pokedex
//
//  Created by Nathan Johnson on 3/24/16.
//  Copyright © 2016 Nathan Johnson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Sprite : NSObject

@property (nonatomic) int id;
@property (nonatomic) NSString *image;
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *resourceURI;

+ (Sprite *) initWithDict:(NSDictionary *)dict andResourceURI:(NSString *)resourceURI;

@end
