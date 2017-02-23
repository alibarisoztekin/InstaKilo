//
//  PhotosCollectionViewCell.m
//  InstaKilo
//
//  Created by Ali Barış Öztekin on 2017-02-22.
//  Copyright © 2017 Ali Barış Öztekin. All rights reserved.
//

#import "PhotosCollectionViewCell.h"

@implementation PhotosCollectionViewCell

-(void) setPhoto:(Photos *)photo{
    _photo= photo;
    [self configureCell];
}

-(void)configureCell{
    self.image.image = self.photo.image;
}

@end
