//
//  VideoTableViewCell.m
//  ObjCTutorial
//
//  Created by Tanaka Mazivanhanga on 11/17/20.
//  Copyright © 2020 Tanaka Mazivanhanga. All rights reserved.
//

#import "VideoTableViewCell.h"
#import "UIColor+CustomColor.h"
#import "ObjCTutorial-Swift.h"
@interface VideoTableViewCell ()
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UIImageView *thumbnailImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property(nonatomic, strong) NSCache *imageCache;
//-(UIImage*) resizeImage: (UIImage*) image toTheSize: (CGSize) size;

@end

@implementation VideoTableViewCell

+ (NSString *)cellIdentifier{
    return @"VideoTableVIewCell";
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.imageCache = [[NSCache alloc]init];
    // Initialization code
    self.layer.cornerRadius = 2.0;
    self.layer.shadowColor = [UIColor colorWithRed:157 green:157 blue:157 opacity: 0.8].CGColor;
    self.layer.shadowOpacity = 0.8;
    self.layer.shadowOffset = CGSizeMake(0, 2);



}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configureWithVideo:(nonnull Video *)video{
    self.titleLabel.text = video.title;
    self.descriptionLabel.text = video.videoDescription;
    UIImage *cacheImage = [self.imageCache objectForKey:video.thumbnail];
    if (cacheImage) {
        self.thumbnailImageView.image = cacheImage;
    }else{
    UIImage * image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:video.thumbnail]]];
        self.thumbnailImageView.image = image;//[self resizeImage:image toTheSize:self.thumbnailImageView.bounds.size];
        [self.imageCache setObject:image forKey:video.thumbnail];
    }


}

//- (UIImage *)resizeImage:(UIImage *)image toTheSize:(CGSize)size{
//    CGFloat scale = MAX(size.width/image.size.width, size.height/image.size.height);
//    CGFloat width = image.size.width * scale;
//    CGFloat height = image.size.height * scale;
//    CGRect rr = CGRectMake(0, 0, width, height);
//    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
//    [image drawInRect:rr];
//    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    return newImage;
//}


/*static func resizeImage(image:UIImage, toTheSize size:CGSize) -> UIImage{
    let scale = CGFloat(max(size.width/image.size.width,
    size.height/image.size.height))
    let width:CGFloat  = image.size.width * scale
    let height:CGFloat = image.size.height * scale;

    let rr:CGRect = CGRectMake( 0, 0, width, height);

    UIGraphicsBeginImageContextWithOptions(size, false, 0);
    image.drawInRect(rr)
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext();
    return newImage
 }
 */

@end
