//
//  ViewController.m
//  Pokedex
//
//  Created by Nathan Johnson on 3/18/16.
//  Copyright © 2016 Nathan Johnson. All rights reserved.
//

#import "PokemonListViewController.h"
#import "PokemonViewController.h"
#import "PokemonRef.h"
#import "PokemonClient.h"

// this VC is an implementation of PokemonClientDelegate
@interface PokemonListViewController () <UITableViewDelegate, UITableViewDataSource, PokemonClientDelegate>

// MARK: Properties

@property (nonatomic) NSArray *pokemon;
@property (nonatomic) PokemonClient *client;


// MARK: Outlets

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end


@implementation PokemonListViewController

// MARK: Constants

//NSString *const POKEMON_SEQUE = @"showPokemon";




// MARK: View controller lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.client = [[PokemonClient alloc] init];
    self.client.delegate = self;    // set this VC as the PokemonClientDelegate
    
    [self.activityIndicator startAnimating];
    [self.client getPokemonList];
}


// MARK: Table view data source

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    PokemonRef *pokemon = self.pokemon[indexPath.row];
    cell.textLabel.text = [pokemon.name capitalizedString]; // capitalizes first letter of Pokemon name
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.pokemon.count;
}


// MARK: Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


// MARK: Pokemon client delegate

- (void)client:(PokemonClient *)client getPokemonListSucceeded:(NSArray *)pokemon {
    [self.activityIndicator stopAnimating];
    
    self.pokemon = pokemon;
    [self.tableView reloadData];
}

- (void)client:(PokemonClient *)client getPokemonListFailedWithError:(NSError *)error andMessage:(NSString *)message {
    [self.activityIndicator stopAnimating];
    
    NSLog(@"%@", error);
    NSLog(@"%@", message);
}


// MARK: Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showPokemon"]) {
        PokemonViewController *vc = segue.destinationViewController;

        int row = (int)[self.tableView indexPathForCell:sender].row;
        vc.pokemonRef = self.pokemon[row];
    }
}

@end
