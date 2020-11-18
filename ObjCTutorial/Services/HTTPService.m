//
//  HTTPService.m
//  ObjCTutorial
//
//  Created by Tanaka Mazivanhanga on 11/17/20.
//  Copyright © 2020 Tanaka Mazivanhanga. All rights reserved.
//

#import "HTTPService.h"
#define URL_BASE "http://localhost:8003"
#define VIDEOS_ENDPOINT "/videos"
@implementation HTTPService
+ (id)shared{
    //Singleton instance
    static HTTPService *sharedInstance = nil;
    @synchronized (self) {
        if(sharedInstance == nil)
            sharedInstance = [[self alloc]init];
    }
    return sharedInstance;
}

- (void)fetchDataWithUrl:(NSString*) urlString :(nullable onComplete)handler{
    NSURL * url = [NSURL URLWithString:urlString];
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            handler(error,nil);
        }
        if (data) {
            handler(nil,data);
        }
    }] resume] ;

}

- (void)getVideos:(nullable onComplete)handler{
    [self fetchDataWithUrl:[NSString stringWithFormat:@"%s%s", URL_BASE,VIDEOS_ENDPOINT] :handler];
}

@end
