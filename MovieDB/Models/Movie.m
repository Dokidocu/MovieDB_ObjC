//
//  Movie.m
//  MovieDB
//
//  Created by Henri La on 04/11/15.
//  Copyright (c) 2015 HLA. All rights reserved.
//

#import "Movie.h"

@interface Movie (){
    
}
@end

static NSMutableArray *topMovies;
static NSMutableArray *upcomingMovies;
static NSMutableArray *nowPlayingMovies;
static NSMutableArray *popularMovies;

@implementation Movie{
    
}

+(Movie *)movieFromJSON:(NSDictionary *)json{
    Movie *movie = [[Movie alloc]init];
    movie.adult = [[json objectForKey:@"adult"] boolValue];
    movie.backdrop_path = [NSString stringWithFormat:@"%@%@", KIMAGE_URL, [json objectForKey:@"backdrop_path"]];
    movie.genre_ids = [[NSMutableArray alloc] init];
    for (NSArray *ids in [json objectForKey:@"genre_ids"]) {
        [[movie genre_ids]addObject:ids];
    }
    movie.pk_id = [json objectForKey:@"id"];
    movie.original_language = [json objectForKey:@"original_language"];
    movie.original_title = [json objectForKey:@"original_title"];
    movie.overview = [json objectForKey:@"overview"];
    movie.release_date = [json objectForKey:@"release_date"];
    movie.poster_path = [NSString stringWithFormat:@"%@%@", KIMAGE_URL, [json objectForKey:@"poster_path"]];
    movie.popularity = [json objectForKey:@"popularity"];
    movie.title = [json objectForKey:@"title"];
    movie.video = [[json objectForKey:@"video"] boolValue];
    movie.vote_average = [json objectForKey:@"vote_average"];
    movie.vote_count = [json objectForKey:@"vote_count"];
    return movie;
}

+(void)addTopMovieJSON:(NSDictionary *)topMovie{
    if (topMovies == nil) topMovies = [[NSMutableArray alloc]init];
    if (topMovie == nil) return;
    [topMovies addObject:[self movieFromJSON:topMovie]];
}

+(void)addUpcomingMovieJSON:(NSDictionary *)upMovie{
    if (upcomingMovies == nil) upcomingMovies = [[NSMutableArray alloc] init];
    if (upMovie == nil) return;
    [upcomingMovies addObject:[self movieFromJSON:upMovie]];
}

+(void)addNowPlayingMovieJSON:(NSDictionary *)json{
    if (nowPlayingMovies == nil) nowPlayingMovies = [[NSMutableArray alloc] init];
    if (json == nil) return;
    [nowPlayingMovies addObject:[self movieFromJSON:json]];
}

+(void)addPopularMovieJSON:(NSDictionary *)json{
    if (popularMovies == nil) popularMovies = [[NSMutableArray alloc] init];
    if (json == nil) return;
    [popularMovies addObject:[self movieFromJSON:json]];
}

+(NSArray *)getTopMovies{
    return topMovies;
}

+(NSArray *)getUpcomingMovies{
    return upcomingMovies;
}

+(NSArray *)getNowPlayingMovies{
    return nowPlayingMovies;
}

+(NSArray *)getPopularMovies{
    return popularMovies;
}

-(NSString *)description{
    return [NSString stringWithFormat:@"id:%@ - poster_path:%@ -genre_ids:%@", self.pk_id, self.poster_path, self.genre_ids];
}

-(void)addDetailsJSON:(NSDictionary *)json{
    self.budget = [[json objectForKey:@"budget"]isEqual:[NSNull null]] ? [json objectForKey:@"budget"] : nil;
    self.genres = [[NSMutableArray alloc]init];
    if (![[json objectForKey:@"genres"] isEqual:[NSNull null]]) {
        for (NSDictionary *obj in [json objectForKey:@"genres"]) {
            [self.genres addObject:obj];
        }
    }
    self.homepage = [[json objectForKey:@"homepage"]isEqual:[NSNull null]] ? [json objectForKey:@"homepage"] : nil;
    self.imdb_id = [[json objectForKey:@"imdb_id"]isEqual:[NSNull null]] ? [json objectForKey:@"imdb_id"] : nil;
    self.production_companies = [[NSMutableArray alloc]init];
    if (![[json objectForKey:@"production_companies"] isEqual:[NSNull null]]) {
        for (NSDictionary *obj in [json objectForKey:@"production_companies"]) {
            [self.production_companies addObject:obj];
        }
    }
    self.production_countries = [[NSMutableArray alloc]init];
    if (![[json objectForKey:@"production_countries"]isEqual:[NSNull null]]) {
        for (NSDictionary *obj in [json objectForKey:@"production_countries"]) {
            [self.production_countries addObject:obj];
        }
    }
    self.revenue = [[json objectForKey:@"revenue"]isEqual:[NSNull null]] ? [json objectForKey:@"revenue"] : nil;
    self.status = [[json objectForKey:@"status"]isEqual:[NSNull null]] ? [json objectForKey:@"status"] : nil;
    self.tagline = [[json objectForKey:@"tagline"]isEqual:[NSNull null]] ? [json objectForKey:@"tagline"] : nil;
}

-(NSString *)stringGenres{
    if (self.genres.count == 0) {
        return @"";
    }
    NSMutableString *str = [[NSMutableString alloc]init];
    for (int i = 0; i < self.genres.count; i++) {
        [str appendString:[[self.genres objectAtIndex:i] objectForKey:@"name"]];
        [str appendString:@", "];
    }
    [str appendString:[[self.genres objectAtIndex:self.genres.count - 1] objectForKey:@"name"]];
    return str;
}

@end
