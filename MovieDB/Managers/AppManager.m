//
//  AppManager.m
//  MovieDB
//
//  Created by Henri La on 04/11/15.
//  Copyright (c) 2015 HLA. All rights reserved.
//

#import "AppManager.h"
#import <AFNetworking.h>
#import "Movie.h"

static NSString *const kAPI_KEY =@"api_key=ff743742b3b6c89feb59dfc138b4c12f";
static NSString *const kBASE_URL = @"http://api.themoviedb.org/3/";

@implementation AppManager{
    
}
#pragma mark - Singleton
+(instancetype)sharedAppManager{
    static AppManager *sharedAppManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedAppManager = [[self alloc]init];
    });
    return sharedAppManager;
}

#pragma mark - Movies
-(void)retrieveTopMovies:(id<AppRequestProtocol>)delegate{
    NSString *url = [NSString stringWithFormat:@"%@movie/top_rated?%@", kBASE_URL, kAPI_KEY];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        for (NSDictionary *obj in [responseObject objectForKey:@"results"]) {
            [Movie addTopMovieJSON:obj];
        }
        [delegate didRetrieveResponse:responseObject forRequest:RETRIEVE_TOP_MOVIES];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [delegate didFailRetrieveResponse:operation forRequest:RETRIEVE_TOP_MOVIES];
    }];
}

-(void)retrieveUpcomingMovies:(id<AppRequestProtocol>)delegate{
    NSString *url = [NSString stringWithFormat:@"%@movie/upcoming?%@", kBASE_URL, kAPI_KEY];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        for (NSDictionary *obj in [responseObject objectForKey:@"results"]) {
            [Movie addUpcomingMovieJSON:obj];
        }
        [delegate didRetrieveResponse:responseObject forRequest:RETRIEVE_UPCOMING_MOVIES];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [delegate didFailRetrieveResponse:operation forRequest:RETRIEVE_UPCOMING_MOVIES];
    }];
}

-(void)retrieveNowMovies:(id<AppRequestProtocol>)delegate{
    NSString *url = [NSString stringWithFormat:@"%@movie/now_playing?%@", kBASE_URL, kAPI_KEY];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        for (NSDictionary *obj in [responseObject objectForKey:@"results"]) {
            [Movie addNowPlayingMovieJSON:obj];
        }
        [delegate didRetrieveResponse:responseObject forRequest:RETRIEVE_NOW_MOVIES];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [delegate didFailRetrieveResponse:operation forRequest:RETRIEVE_NOW_MOVIES];
    }];
}

-(void)retrievePopularMovies:(id<AppRequestProtocol>)delegate{
    NSString *url = [NSString stringWithFormat:@"%@movie/popular?%@", kBASE_URL, kAPI_KEY];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        for (NSDictionary *obj in [responseObject objectForKey:@"results"]) {
            [Movie addPopularMovieJSON:obj];
        }
        [delegate didRetrieveResponse:responseObject forRequest:RETRIEVE_POPULAR_MOVIES];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [delegate didFailRetrieveResponse:operation forRequest:RETRIEVE_POPULAR_MOVIES];
    }];
}

-(void)retrieveMovie:(Movie *)movie withDelegate:(id<AppRequestProtocol>)delegate{
    NSString *url = [NSString stringWithFormat:@"%@movie/%@?%@", kBASE_URL, movie.pk_id, kAPI_KEY];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [movie addDetailsJSON:responseObject];
        [delegate didRetrieveResponse:responseObject forRequest:RETRIEVE_MOVIE];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [delegate didFailRetrieveResponse:operation forRequest:RETRIEVE_MOVIE];
    }];
}

#pragma mark - TvShows
-(void)retrievePopularTvShows:(id<AppRequestProtocol>)delegate{
    NSString *url = [NSString stringWithFormat:@"%@tv/popular?%@", kBASE_URL, kAPI_KEY];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        for (NSDictionary *obj in [responseObject objectForKey:@"results"]) {
            [TvShow addPopularTvShows:obj];
        }
        [delegate didRetrieveResponse:responseObject forRequest:RETRIEVE_POPULAR_TVSHOWS];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [delegate didFailRetrieveResponse:operation forRequest:RETRIEVE_POPULAR_TVSHOWS];
    }];
}

-(void)retrieveOnTheAirTvShows:(id<AppRequestProtocol>)delegate{
    NSString *url = [NSString stringWithFormat:@"%@tv/on_the_air?%@", kBASE_URL, kAPI_KEY];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        for (NSDictionary *obj in [responseObject objectForKey:@"results"]) {
            [TvShow addOnTheAirTvShows:obj];
        }
        [delegate didRetrieveResponse:responseObject forRequest:RETRIEVE_ONTHEAIR_TVSHOWS];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [delegate didFailRetrieveResponse:operation forRequest:RETRIEVE_ONTHEAIR_TVSHOWS];
    }];
}

-(void)retrieveAiringTvShows:(id<AppRequestProtocol>)delegate{
    NSString *url = [NSString stringWithFormat:@"%@tv/airing_today?%@", kBASE_URL, kAPI_KEY];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        for (NSDictionary *obj in [responseObject objectForKey:@"results"]) {
            [TvShow addAiringTodayTvShows:obj];
        }
        [delegate didRetrieveResponse:responseObject forRequest:RETRIEVE_AIRING_TVSHOWS];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [delegate didFailRetrieveResponse:operation forRequest:RETRIEVE_AIRING_TVSHOWS];
    }];
}

-(void)retrieveTopRatedTvShows:(id<AppRequestProtocol>)delegate{
    NSString *url = [NSString stringWithFormat:@"%@tv/top_rated?%@", kBASE_URL, kAPI_KEY];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        for (NSDictionary *obj in [responseObject objectForKey:@"results"]) {
            [TvShow addTopRatedTvShows:obj];
        }
        [delegate didRetrieveResponse:responseObject forRequest:RETRIEVE_TOPRATED_TVSHOWS];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [delegate didFailRetrieveResponse:operation forRequest:RETRIEVE_TOPRATED_TVSHOWS];
    }];
}


@end
