//
//  TvShowsVC.m
//  MovieDB
//
//  Created by Henri La on 08/11/15.
//  Copyright (c) 2015 HLA. All rights reserved.
//

#import "TvShowsVC.h"

@interface TvShowsVC (){
    NSArray *values;
}
@end

@implementation TvShowsVC

#pragma mark - Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    values = [[NSArray alloc]init];
    [[AppManager sharedAppManager]retrievePopularTvShows:self];
    [_segControl addTarget:self action:@selector(didChangeSegValue:) forControlEvents:UIControlEventValueChanged];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Private methods
-(void)didChangeSegValue:(id)sender{
    UISegmentedControl *seg = (UISegmentedControl *)sender;
    switch ([seg selectedSegmentIndex]) {
        case 0:{
            if ([TvShow getPopularTvShows] == nil) {
                [[AppManager sharedAppManager]retrievePopularTvShows:self];
            }else{
                values = [TvShow getPopularTvShows];
                [self.collectionView reloadData];
            }
            break;
        }
        case 1:{
            if ([TvShow getOnTheAirTvShows] == nil) {
                [[AppManager sharedAppManager]retrieveOnTheAirTvShows:self];
            }else{
                values = [TvShow getOnTheAirTvShows];
                [self.collectionView reloadData];
            }
            break;
        }
        case 2:{
            if ([TvShow getAiringTvShows] == nil) {
                [[AppManager sharedAppManager]retrieveAiringTvShows:self];
            }else{
                values = [TvShow getAiringTvShows];
                [self.collectionView reloadData];
            }
            break;
        }
        case 3:{
            if ([TvShow getTopRatedTvShows] == nil) {
                [[AppManager sharedAppManager]retrieveTopRatedTvShows:self];
            }else{
                values = [TvShow getTopRatedTvShows];
                [self.collectionView reloadData];
            }
            break;
        }
            
        default:
            break;
    }
}

#pragma mark - AppRequestProtocol
-(void)didRetrieveResponse:(id)response forRequest:(int)request{
    if (request == RETRIEVE_POPULAR_TVSHOWS) {
        values = [TvShow getPopularTvShows];
    }
    if (request == RETRIEVE_ONTHEAIR_TVSHOWS) {
        values = [TvShow getOnTheAirTvShows];
    }
    if (request == RETRIEVE_AIRING_TVSHOWS) {
        values = [TvShow getAiringTvShows];
    }
    if (request == RETRIEVE_TOPRATED_TVSHOWS) {
        values = [TvShow getTopRatedTvShows];
    }
    [self.collectionView reloadData];
}

-(void)didFailRetrieveResponse:(id)response forRequest:(int)request{
    NSLog(@"didFailRetrieveResponse:%@", response);
}

#pragma mark - UICollectionViewDataSource, UICollectionViewDelegate
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [values count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"TvShowCell";
    TvShowCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    [cell configureCellWithTvShow:[values objectAtIndex:indexPath.row]];
    return cell;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"TvShowDetailsVC" sender:[values objectAtIndex:indexPath.row]];
}

#pragma mark - Navigation
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    TvShowDetailsVC *dest = [segue destinationViewController];
    [dest setTvShow:sender];
}

@end
