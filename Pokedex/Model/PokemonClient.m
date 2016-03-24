//
//  PokemonClient.m
//  Pokedex
//
//  Created by Nathan Johnson on 3/18/16.
//  Copyright © 2016 Nathan Johnson. All rights reserved.
//

#import "PokemonClient.h"
#import "PokemonRef.h"
#import "Pokemon.h"
#import "Sprite.h"
//#define BASE_URL @"http://pokeapi.co/api/v2/pokemon/" //V2
#define BASE_URL @"http://pokeapi.co/"

@implementation PokemonClient

// MARK: Methods


// creates a list of PokemonRef
- (void)getPokemonList {
//    NSURL *url = [NSURL URLWithString:[BASE_URL stringByAppendingString:@"?limit=151"]];  //V2
    NSURL *url = [NSURL URLWithString:[BASE_URL stringByAppendingString:@"api/v1/pokedex/1/"]];
    
    NSURLSessionDataTask *downloadTask = [[NSURLSession sharedSession] dataTaskWithURL:url
                                                                     completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        // add this operation to the main queue rather than the main UI thread (happens on UI thread by default)
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{

            if (error) {
                // check if delegate actually contains PokemonClientDelegate fail method
                if ([self.delegate respondsToSelector:@selector(client:getPokemonListFailedWithError:andMessage:)]) {
                    [self.delegate client:self getPokemonListFailedWithError:error andMessage:[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]];
                }
                
                return;
            }

            NSDictionary *responseDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
//            NSArray *resultsArray = responseDict[@"results"];               // array of dictionaries; each dictionary has name and url keys; V2
            NSArray *resultsArray = responseDict[@"pokemon"];
            NSMutableArray *pokemonList = [[NSMutableArray alloc] init];    // array of PokemonRef objects
            
            // iterate through all Pokemon to get the name and url needed to create a PokemonRef object
            for (NSDictionary *result in resultsArray) {
                [pokemonList addObject:[PokemonRef initWithDict:result]];
            }
            
            // check if delegate actually contains PokemonClientDelegate succeed method
            if ([self.delegate respondsToSelector:@selector(client:getPokemonListSucceeded:)]) {
                [self.delegate client:self getPokemonListSucceeded:pokemonList];
            }
        }]; // NSOperationQueue
    }]; // NSURLSessionDataTask
    
    [downloadTask resume];
}

// V1
- (void)getPokemonSpriteWithURL:(NSString *)urlStr {
    NSURL *url = [NSURL URLWithString:[BASE_URL stringByAppendingString:[urlStr substringFromIndex:1]]];
    
    NSURLSessionDataTask *downloadTask = [[NSURLSession sharedSession] dataTaskWithURL:url
                                                                     completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
         [[NSOperationQueue mainQueue] addOperationWithBlock:^{
             if (error) {
                 if ([self.delegate respondsToSelector:@selector(client:getPokemonSpriteWithURL:failedWithError:andMessage:)]) {
                     [self.delegate client:self getPokemonSpriteWithURL:urlStr failedWithError:error andMessage:[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]];
                 }
                 
                 return;
             }
             
             NSDictionary *responseDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
             
             // check if delegate actually contains PokemonClientDelegate succeed method
             if ([self.delegate respondsToSelector:@selector(client:getPokemonSpriteWithURL:succeeded:)]) {
                 [self.delegate client:self getPokemonSpriteWithURL:urlStr succeeded:[Sprite initWithDict:responseDict andResourceURI:urlStr]];
             }
         }]; // NSOperationQueue
     }]; // NSURLSessionDataTask
    
    [downloadTask resume];
}

// creates a Pokemon from a URL
- (void)getPokemonWithURL:(NSString *)urlStr {
    //    NSURL *url = [NSURL URLWithString:urlStr];  //V2
    NSURL *url = [NSURL URLWithString:[BASE_URL stringByAppendingString:urlStr]];
    
    NSURLSessionDataTask *downloadTask = [[NSURLSession sharedSession] dataTaskWithURL:url
                                                                     completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
         // add this operation to the main queue rather than the main UI thread (happens on UI thread by default)
         [[NSOperationQueue mainQueue] addOperationWithBlock:^{
             if (error) {
                 // check if delegate actually contains PokemonClientDelegate fail method
                 if ([self.delegate respondsToSelector:@selector(client:getPokemonWithURL:failedWithError:andMessage:)]) {
                     [self.delegate client:self getPokemonWithURL:urlStr failedWithError:error andMessage:[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]];
                 }
                 
                 return;
             }
             
             NSDictionary *responseDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
             
             // check if delegate actually contains PokemonClientDelegate succeed method
             if ([self.delegate respondsToSelector:@selector(client:getPokemonWithURL:succeeded:)]) {
                 [self.delegate client:self getPokemonWithURL:urlStr succeeded:[Pokemon initWithDict:responseDict]];
             }
         }]; // NSOperationQueue
     }]; // NSURLSessionDataTask
    
    [downloadTask resume];
}

@end
