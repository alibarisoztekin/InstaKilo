//
//  Photos.h
//  InstaKilo
//
//  Created by Ali Barış Öztekin on 2017-02-22.
//  Copyright © 2017 Ali Barış Öztekin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Photos : NSObject

@property (nonatomic,strong) UIImage* image;
@property (nonatomic,strong) NSString* subject;
@property (nonatomic,strong) NSString* location;

- (instancetype)initWithImage:(UIImage*)image subject:(NSString*)subject location: (NSString*) location;


@end
