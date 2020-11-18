//
//  ViewController.m
//  ObjCTutorial
//
//  Created by Tanaka Mazivanhanga on 11/17/20.
//  Copyright © 2020 Tanaka Mazivanhanga. All rights reserved.
//

#import "ViewController.h"
#import "HTTPService.h"
#import "ObjCTutorial-Swift.h"
#import "VideoTableViewCell.h"
#import "VideoVC.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSString * urlString;
@property (strong, nonatomic) NSMutableArray<Video*> * videos;
@end

@implementation ViewController

- (NSString *)urlString{
    return @"http://localhost:8003/videos";
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.videos = [[NSMutableArray alloc] init];

    [HTTPService.shared getVideos:^(NSError * _Nullable error, NSData * _Nullable data) {
          if (error) {
                  NSLog(@"Error: %@", error.description);
              }
              if (data) {
                  [self.videos addObjectsFromArray:[Video createFrom:data]];

                  for (Video * video in self.videos) {
                      NSLog(@"%@", video.title);
                  }
                  [self updateTableData];

              }
    }];

    // Do any additional setup after loading the view.
}

- (void)updateTableData {
    dispatch_async(dispatch_get_main_queue(), ^{

        [self.tableView reloadData];
    });
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{


}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Video *video = [self.videos objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"showVideoVC" sender:video];

}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    Video *video = [self.videos objectAtIndex:indexPath.row];
    VideoTableViewCell *cell = (VideoTableViewCell*) [tableView dequeueReusableCellWithIdentifier:[VideoTableViewCell cellIdentifier]];

    [cell configureWithVideo: video];


    if(cell){
        return cell;
    }else{
        return [[UITableViewCell alloc]init];
    }
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
        return self.videos.count;

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    VideoVC* vc =(VideoVC*) [segue destinationViewController];
    vc.modalPresentationStyle = UIModalPresentationFullScreen;
    vc.video =(Video*) sender;
}


@end
