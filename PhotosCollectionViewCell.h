//
//  PhotosCollectionViewCell.h
//  InstaKilo
//
//  Created by Ali Barış Öztekin on 2017-02-22.
//  Copyright © 2017 Ali Barış Öztekin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Photos.h"
@interface PhotosCollectionViewCell : UICollectionViewCell

@property (nonatomic,strong) Photos* photo;
@property (nonatomic, strong) IBOutlet UIImageView* image;

@end
