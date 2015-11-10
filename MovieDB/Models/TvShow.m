//
//  TvShow.m
//  MovieDB
//
//  Created by Henri La on 08/11/15.
//  Copyright (c) 2015 HLA. All rights reserved.
//

#import "TvShow.h"

@interface TvShow (){
    
}
@end

static NSMutableArray *popularTvShows;
static NSMutableArray *onTheAirTvShows;
static NSMutableArray *airingTvShows;
static NSMutableArray *topRatedTvShows;

@implementation TvShow

+(TvShow *)tvShowFromJSON:(NSDictionary *)json{
    TvShow *tvShow = [[TvShow alloc]init];
    tvShow.backdrop_path = [NSString stringWithFormat:@"%@%@", KIMAGE_URL, [json objectForKey:@"backdrop_path"]];
    tvShow.first_air_date = [json objectForKey:@"first_air_date"];
    tvShow.genre_ids = [[NSMutableArray alloc] init];
    for (NSArray *ids in [json objectForKey:@"genre_ids"]) {
        [[tvShow genre_ids]addObject:ids];
    }
    tvShow.pk_id = [json objectForKey:@"id"];
    tvShow.original_language = [json objectForKey:@"original_language"];
    tvShow.original_title = [json objectForKey:@"original_title"];
    tvShow.overview = [json objectForKey:@"overview"];
    tvShow.original_country = [[NSMutableArray alloc] init];
    for (NSArray *obj in [json objectForKey:@"original_country"]) {
        [tvShow.original_country addObject:obj];
    }
    tvShow.poster_path = [NSString stringWithFormat:@"%@%@", KIMAGE_URL, [json objectForKey:@"poster_path"]];
    tvShow.popularity = [json objectForKey:@"popularity"];
    tvShow.name = [json objectForKey:@"name"];
    tvShow.vote_average = [json objectForKey:@"vote_average"];
    tvShow.vote_count = [json objectForKey:@"vote_count"];
    return tvShow;
}

+(void)addPopularTvShows:(NSDictionary *)json{
    if (popularTvShows == nil) popularTvShows = [[NSMutableArray alloc]init];
    if (popularTvShows == nil) return;
    [popularTvShows addObject:[self tvShowFromJSON:json]];
}

+(void)addOnTheAirTvShows:(NSDictionary *)json{
    if (onTheAirTvShows == nil) onTheAirTvShows = [[NSMutableArray alloc]init];
    if (onTheAirTvShows == nil) return;
    [onTheAirTvShows addObject:[self tvShowFromJSON:json]];
}

+(void)addAiringTodayTvShows:(NSDictionary *)json{
    if (airingTvShows == nil) airingTvShows = [[NSMutableArray alloc]init];
    if (airingTvShows == nil) return;
    [airingTvShows addObject:[self tvShowFromJSON:json]];
}

+(void)addTopRatedTvShows:(NSDictionary *)json{
    if (topRatedTvShows == nil) topRatedTvShows = [[NSMutableArray alloc]init];
    if (topRatedTvShows == nil) return;
    [topRatedTvShows addObject:[self tvShowFromJSON:json]];
}

+(NSArray *)getPopularTvShows{
    return popularTvShows;
}

+(NSArray *)getOnTheAirTvShows{
    return onTheAirTvShows;
}

+(NSArray *)getAiringTvShows{
    return airingTvShows;
}

+(NSArray *)getTopRatedTvShows{
    return topRatedTvShows;
}

@end
