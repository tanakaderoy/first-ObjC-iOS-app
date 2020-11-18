//
//  VideoVC.h
//  ObjCTutorial
//
//  Created by Tanaka Mazivanhanga on 11/18/20.
//  Copyright © 2020 Tanaka Mazivanhanga. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ObjCTutorial-Swift.h"
#import <WebKit/WebKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface VideoVC : UIViewController  <WKNavigationDelegate>
@property(strong, nonatomic) Video* video;
@end

NS_ASSUME_NONNULL_END
