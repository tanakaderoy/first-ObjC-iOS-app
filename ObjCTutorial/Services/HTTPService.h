//
//  HTTPService.h
//  ObjCTutorial
//
//  Created by Tanaka Mazivanhanga on 11/17/20.
//  Copyright © 2020 Tanaka Mazivanhanga. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HTTPService : NSObject
typedef void (^onComplete)(NSError* _Nullable error, NSData* _Nullable data);
+ (id) shared;

- (void)fetchDataWithUrl:(NSString*) urlString :(nullable onComplete)handler;

-(void)getVideos:(nullable onComplete)handler;
@end

NS_ASSUME_NONNULL_END
