//
//  Photos.m
//  InstaKilo
//
//  Created by Ali Barış Öztekin on 2017-02-22.
//  Copyright © 2017 Ali Barış Öztekin. All rights reserved.
//

#import "Photos.h"

@implementation Photos


- (instancetype)initWithImage:(UIImage*)image subject:(NSString*)subject location: (NSString*) location
{
    self = [super init];
    if (self) {
        _image = image;
        _subject = subject;
        _location = location;
    }
    return self;
}

@end
