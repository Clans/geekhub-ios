//
//  CollectionCell.m
//  gh-ios-8
//
//  Created by Dmitry on 06.12.14.
//  Copyright (c) 2014 Dmitry Tarianyk. All rights reserved.
//

#import "CollectionCell.h"
#import "ViewController.h"

@interface CollectionCell()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation CollectionCell

- (void)awakeFromNib {
    // Initialization code
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"CollectionCell" owner:self options:nil];
        
        if ([arrayOfViews count] < 1) {
            return nil;
        }
        
        if (![[arrayOfViews objectAtIndex:0] isKindOfClass:[UICollectionViewCell class]]) {
            return nil;
        }
        
        self = [arrayOfViews objectAtIndex:0];
    }
    
    return self;
}

- (void)setImage:(NSString *)imageName {
    NSString *sourcePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:IMAGES_FOLDER];
    NSString *filename = [NSString stringWithFormat:@"%@/%@", sourcePath, imageName];
    
    UIImage *image = [UIImage imageWithContentsOfFile:filename];
    
    [self.imageView setImage:image];
    [self.imageView setContentMode:UIViewContentModeScaleAspectFit];
}

@end
