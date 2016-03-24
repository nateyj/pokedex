//
//  TypeRef.h
//  Pokedex
//
//  Created by Nathan Johnson on 3/22/16.
//  Copyright © 2016 Nathan Johnson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TypeRef : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *url;

+ (TypeRef *) initWithDict:(NSDictionary *)dict;

@end
