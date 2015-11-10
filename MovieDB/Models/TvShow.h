//
//  TvShow.h
//  MovieDB
//
//  Created by Henri La on 08/11/15.
//  Copyright (c) 2015 HLA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entertainment.h"

@interface TvShow : Entertainment

@property (nonatomic) NSString *first_air_date;
@property (nonatomic) NSMutableArray *original_country;
@property (nonatomic) NSString *name;


+(void)addPopularTvShows:(NSDictionary *)json;
+(void)addOnTheAirTvShows:(NSDictionary *)json;
+(void)addAiringTodayTvShows:(NSDictionary *)json;
+(void)addTopRatedTvShows:(NSDictionary *)json;

+(NSArray *)getPopularTvShows;
+(NSArray *)getOnTheAirTvShows;
+(NSArray *)getAiringTvShows;
+(NSArray *)getTopRatedTvShows;

@end
