//
//  VideoTableViewCell.h
//  ObjCTutorial
//
//  Created by Tanaka Mazivanhanga on 11/17/20.
//  Copyright © 2020 Tanaka Mazivanhanga. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ObjCTutorial-Swift.h"

NS_ASSUME_NONNULL_BEGIN

@interface VideoTableViewCell : UITableViewCell
+(NSString*)cellIdentifier;

-(void) configureWithVideo:(nonnull Video *)video;
@end

NS_ASSUME_NONNULL_END
