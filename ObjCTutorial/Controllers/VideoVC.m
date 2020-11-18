//
//  VideoVC.m
//  ObjCTutorial
//
//  Created by Tanaka Mazivanhanga on 11/18/20.
//  Copyright © 2020 Tanaka Mazivanhanga. All rights reserved.
//

#import "VideoVC.h"
#import <WebKit/WebKit.h>

@interface VideoVC ()
@property (weak, nonatomic) IBOutlet WKWebView *webView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *videoDescriptionLabel;

@end

@implementation VideoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleLabel.text = self.video.title;
    self.videoDescriptionLabel.text = self.video.videoDescription;
    self.webView.navigationDelegate = self;
    [self.webView loadHTMLString:self.video.iframe baseURL:nil];
    // Do any additional setup after loading the view.
}

/*
 #pragma mark - Navigation

 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    NSString * css = @".container {position: relative; width: 100%; height: 0; padding-bottom: 56.25%;} .video {position:absolute; top: 0; left:0; width: 100%; height:100%;} ";
    NSString *js = [NSString stringWithFormat:@"var styleNode = document.createElement('style'); \n""styleNode.type = \"text/css\";\n"
                    "var styleText = document.createTextNode('%@');\n"
                    "styleNode.appendChild(styleText);\n"
                    "document.getElementsByTagName('head')[0].appendChild(styleNode);\n", css];
    NSLog(@"js: \n%@",js);
    [self.webView evaluateJavaScript:js completionHandler:nil];
}
- (IBAction)doneButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
