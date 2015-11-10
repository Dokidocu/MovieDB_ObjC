//
//  MoviesVC.m
//  MovieDB
//
//  Created by Henri La on 04/11/15.
//  Copyright (c) 2015 HLA. All rights reserved.
//

#import "MoviesVC.h"

static float heightCell = 160;

@interface MoviesVC (){
    NSArray *values;
}

@end

@implementation MoviesVC

- (void)viewDidLoad {
    [super viewDidLoad];
    values = [[NSArray alloc]init];
    [[AppManager sharedAppManager]retrieveTopMovies:self];
    [_segControl addTarget:self action:@selector(didChangeSegValue:) forControlEvents:UIControlEventValueChanged];
    //self.tableView.rowHeight = UITableViewAutomaticDimension;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private methods
-(void)didChangeSegValue:(id)sender{
    UISegmentedControl *seg = (UISegmentedControl *)sender;
    switch ([seg selectedSegmentIndex]) {
        case 0:{
            if ([Movie getTopMovies] == nil) {
                [[AppManager sharedAppManager]retrieveTopMovies:self];
            }else{
                values = [Movie getTopMovies];
                [self.tableView reloadData];
            }
            break;
        }
        case 1:{
            if ([Movie getUpcomingMovies] == nil) {
                [[AppManager sharedAppManager]retrieveUpcomingMovies:self];
            }else{
                values = [Movie getUpcomingMovies];
                [self.tableView reloadData];
            }
            break;
        }
        case 2:{
            if ([Movie getNowPlayingMovies] == nil) {
                [[AppManager sharedAppManager]retrieveNowMovies:self];
            }else{
                values = [Movie getNowPlayingMovies];
                [self.tableView reloadData];
            }
            break;
        }
        case 3:{
            if ([Movie getPopularMovies] == nil) {
                [[AppManager sharedAppManager]retrievePopularMovies:self];
            }else{
                values = [Movie getPopularMovies];
                [self.tableView reloadData];
            }
            break;
        }
            
        default:
            break;
    }
}

#pragma mark - AppRequestProtocol
-(void)didRetrieveResponse:(id)response forRequest:(int)request{
    if (request == RETRIEVE_TOP_MOVIES) {
        values = [Movie getTopMovies];
    }
    if (request == RETRIEVE_UPCOMING_MOVIES) {
        values = [Movie getUpcomingMovies];
    }
    if (request == RETRIEVE_NOW_MOVIES) {
        values = [Movie getNowPlayingMovies];
    }
    if (request == RETRIEVE_POPULAR_MOVIES) {
        values = [Movie getPopularMovies];
    }
    [self.tableView reloadData];
}

-(void)didFailRetrieveResponse:(id)response forRequest:(int)request{
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier]isEqualToString:@"MovieDetailsVC"]) {
        MovieDetailsVC *dest = [segue destinationViewController];
        [dest setMovie:sender];
    }
}

#pragma mark - UITableViewDataSource, UITableViewDelegate
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"MovieCell";
    MovieCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    [cell configureTopMovieCell:[values objectAtIndex:indexPath.row]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"MovieDetailsVC" sender:[values objectAtIndex:indexPath.row]];
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [values count];
}

/*-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return heightCell+100;
}*/

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return heightCell;
}

@end
