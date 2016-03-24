//
//  PokemonClient.h
//  Pokedex
//
//  Created by Nathan Johnson on 3/18/16.
//  Copyright © 2016 Nathan Johnson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pokemon.h"
#import "PokemonRef.h"

// ensures that PokemonClient is in fact a class, since it is referenced in PokemonClientDelegate (chicken and egg; i.e., one has to be declared first since
// both rely on each other to exist)
@class PokemonClient;

// tells PokemonClient to do the work and PokemonClient uses the delegate's methods to inform the delegate when it's finished and the status
@protocol PokemonClientDelegate <NSObject>

@optional
- (void) client:(PokemonClient *)client getPokemonListSucceeded:(NSArray *)pokemon;
- (void) client:(PokemonClient *)client getPokemonListFailedWithError:(NSError *)error andMessage:(NSString *)message;
- (void) client:(PokemonClient *)client getPokemonWithURL:(NSString *)url succeeded:(Pokemon *)pokemon;
- (void) client:(PokemonClient *)client getPokemonWithURL:(NSString *)url failedWithError:(NSError *)error andMessage:(NSString *)message;

@end


@interface PokemonClient : NSObject

@property (weak, nonatomic) id <PokemonClientDelegate> delegate;

- (void)getPokemonList;
- (void)getPokemonWithURL:(NSString *)urlStr;

@end
