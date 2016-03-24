//
//  PokemonViewController.m
//  Pokedex
//
//  Created by Nathan Johnson on 3/18/16.
//  Copyright © 2016 Nathan Johnson. All rights reserved.
//

#import "PokemonViewController.h"
#import "PokemonClient.h"
#import "SpriteRef.h"
#define BASE_URL @"http://pokeapi.co"

@interface PokemonViewController () <PokemonClientDelegate>

// MARK: Properties

@property (nonatomic) PokemonClient *client;


// MARK: Outlets

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UIImageView *imgViewSprite;
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblHeight;
@property (weak, nonatomic) IBOutlet UILabel *lblPokemonID;

@end


@implementation PokemonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self decimetersToInches:15];
    
    self.title = [self.pokemonRef.name capitalizedString];
    
    self.client = [[PokemonClient alloc] init];
    self.client.delegate = self;    // set this VC as the PokemonClientDelegate
    
    [self.activityIndicator startAnimating];
//    [self.client getPokemonWithURL:self.pokemonRef.url];    //V2
    [self.client getPokemonWithURL:self.pokemonRef.resourceURI];
}


// MARK: Pokemon client delegate

- (void)client:(PokemonClient *)client getPokemonSpriteWithURL:(NSString *)url succeeded:(Sprite *)sprite {
    [self.activityIndicator stopAnimating];
    
    // get actual image from URL
    NSURL *imageURL = [NSURL URLWithString:[BASE_URL stringByAppendingString:sprite.image]];
    NSData *data = [NSData dataWithContentsOfURL:imageURL];
    UIImage *image = [UIImage imageWithData:data];
    
    self.imgViewSprite.image = image;
}

- (void)client:(PokemonClient *)client getPokemonSpriteWithURL:(NSString *)url failedWithError:(NSError *)error andMessage:(NSString *)message {
    [self.activityIndicator stopAnimating];
    
    NSLog(@"%@", url);
    NSLog(@"%@", error);
    NSLog(@"%@", message);
}

- (void)client:(PokemonClient *)client getPokemonWithURL:(NSString *)url succeeded:(Pokemon *)pokemon {
    SpriteRef *spriteRef = pokemon.sprites[0];
    
    [self.client getPokemonSpriteWithURL:spriteRef.resourceURI];
//    [self.activityIndicator stopAnimating];
    
    self.lblName.text = [pokemon.name uppercaseString];
//    self.lblHeight.text = [NSString stringWithFormat:@"%i", pokemon.height];    //V2
//    [self decimetersToInches:pokemon.height];
    self.lblHeight.text = [NSString stringWithFormat:@"%@", pokemon.height];
    
    NSString *formattedID = [NSString stringWithFormat:@"%03i", [pokemon.id intValue]];
    
    self.lblPokemonID.text = [self.lblPokemonID.text stringByAppendingString:formattedID];
}

- (void)client:(PokemonClient *)client getPokemonWithURL:(NSString *)url failedWithError:(NSError *)error andMessage:(NSString *)message {
    [self.activityIndicator stopAnimating];
    
    NSLog(@"%@", url);
    NSLog(@"%@", error);
    NSLog(@"%@", message);
}


// MARK: Methods

- (void) decimetersToInches:(int)dm {
    NSLog(@"%i", dm);
}

@end
