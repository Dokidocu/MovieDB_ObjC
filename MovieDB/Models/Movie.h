//
//  Movie.h
//  MovieDB
//
//  Created by Henri La on 04/11/15.
//  Copyright (c) 2015 HLA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entertainment.h"

@interface Movie : Entertainment

@property (nonatomic) BOOL adult;
//@property (nonatomic) NSString *backdrop_path;
//@property (nonatomic, strong) NSMutableArray *genre_ids;
//@property (nonatomic) NSString *pk_id;
//@property (nonatomic) NSString *original_language;
//@property (nonatomic) NSString *original_title;
//@property (nonatomic) NSString *overview;
@property (nonatomic) NSString *release_date;
//@property (nonatomic) NSString *poster_path;
//@property (nonatomic) NSNumber *popularity;
@property (nonatomic) NSString *title;
@property (nonatomic) BOOL video;
//@property (nonatomic) NSNumber *vote_average;
//@property (nonatomic) NSNumber *vote_count;
//Details
@property (nonatomic, strong) NSMutableArray *belongs_to_collection;
@property (nonatomic) NSNumber *budget;
@property (nonatomic) NSMutableArray *genres;
@property (nonatomic) NSString *homepage;
@property (nonatomic) NSString *imdb_id;
@property (nonatomic, strong) NSMutableArray *production_companies;
@property (nonatomic) NSMutableArray *production_countries;
@property (nonatomic) NSNumber *revenue;
@property (nonatomic) NSString *status;
@property (nonatomic) NSString *tagline;

+(void)addTopMovieJSON:(NSDictionary *)topMovie;
+(void)addUpcomingMovieJSON:(NSDictionary *)upMovie;
+(void)addNowPlayingMovieJSON:(NSDictionary *)json;
+(void)addPopularMovieJSON:(NSDictionary *)json;
+(NSArray *)getTopMovies;
+(NSArray *)getUpcomingMovies;
+(NSArray *)getNowPlayingMovies;
+(NSArray *)getPopularMovies;

-(void)addDetailsJSON:(NSDictionary *)json;
-(NSString *)stringGenres;

@end
