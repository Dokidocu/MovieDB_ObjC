//
//  AppManager.h
//  MovieDB
//
//  Created by Henri La on 04/11/15.
//  Copyright (c) 2015 HLA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppRequestProtocol.h"
#import "Movie.h"
#import "TvShow.h"

typedef NS_ENUM(NSInteger, REQUESTS) {
    RETRIEVE_TOP_MOVIES,
    RETRIEVE_UPCOMING_MOVIES,
    RETRIEVE_NOW_MOVIES,
    RETRIEVE_POPULAR_MOVIES,
    RETRIEVE_MOVIE,
    RETRIEVE_POPULAR_TVSHOWS,
    RETRIEVE_ONTHEAIR_TVSHOWS,
    RETRIEVE_AIRING_TVSHOWS,
    RETRIEVE_TOPRATED_TVSHOWS
};

@interface AppManager : NSObject

+(instancetype)sharedAppManager;

#pragma mark - Movies
-(void)retrieveTopMovies:(id<AppRequestProtocol>)delegate;
-(void)retrieveUpcomingMovies:(id<AppRequestProtocol>)delegate;
-(void)retrieveNowMovies:(id<AppRequestProtocol>)delegate;
-(void)retrievePopularMovies:(id<AppRequestProtocol>)delegate;
-(void)retrieveMovie:(Movie *)movie withDelegate:(id<AppRequestProtocol>)delegate;

#pragma mark - TvShows
-(void)retrievePopularTvShows:(id<AppRequestProtocol>)delegate;
-(void)retrieveOnTheAirTvShows:(id<AppRequestProtocol>)delegate;
-(void)retrieveAiringTvShows:(id<AppRequestProtocol>)delegate;
-(void)retrieveTopRatedTvShows:(id<AppRequestProtocol>)delegate;

@end
