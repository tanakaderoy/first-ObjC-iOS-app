//
//  main.m
//  ObjCTutorial
//
//  Created by Tanaka Mazivanhanga on 11/17/20.
//  Copyright © 2020 Tanaka Mazivanhanga. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
