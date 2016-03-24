//
//  PokemonViewController.m
//  Pokedex
//
//  Created by Nathan Johnson on 3/18/16.
//  Copyright © 2016 Nathan Johnson. All rights reserved.
//

#import "PokemonViewController.h"
#import "PokemonClient.h"

@interface PokemonViewController () <PokemonClientDelegate>

// MARK: Properties

@property (nonatomic) PokemonClient *client;

// MARK: Outlets

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblHeight;

@end

@implementation PokemonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = [self.pokemonRef.name capitalizedString];
    
    self.client = [[PokemonClient alloc] init];
    self.client.delegate = self;    // set this VC as the PokemonClientDelegate
    
    [self.activityIndicator startAnimating];
    [self.client getPokemonWithURL:self.pokemonRef.url];
}

- (void)client:(PokemonClient *)client getPokemonWithURL:(NSString *)url succeeded:(Pokemon *)pokemon {
    [self.activityIndicator stopAnimating];
    
    self.lblName.text = [pokemon.name capitalizedString];
    self.lblHeight.text = [NSString stringWithFormat:@"%i", pokemon.height];
}

- (void)client:(PokemonClient *)client getPokemonWithURL:(NSString *)url failedWithError:(NSError *)error andMessage:(NSString *)message {
    [self.activityIndicator stopAnimating];
    
    NSLog(@"%@", url);
    NSLog(@"%@", error);
    NSLog(@"%@", message);
}

@end
