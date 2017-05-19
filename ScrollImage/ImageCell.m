//
//  ImageCell.m
//  ScrollImage
//
//  Created by 武国斌 on 2017/5/19.
//  Copyright © 2017年 武国斌. All rights reserved.
//

#import "ImageCell.h"

@implementation ImageCell

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.imageView setFrame:self.contentView.bounds];
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithImage:nil];
        [_imageView setContentMode:UIViewContentModeScaleAspectFit];
        [self.contentView addSubview:_imageView];
    }
    return _imageView;
}

@end
