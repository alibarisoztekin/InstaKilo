//
//  ViewController.m
//  InstaKilo
//
//  Created by Ali Barış Öztekin on 2017-02-22.
//  Copyright © 2017 Ali Barış Öztekin. All rights reserved.
//

#import "ViewController.h"
#import "Photos.h"
#import "PhotosCollectionViewCell.h"
#import "PhotosCollectionReusableView.h"

@interface ViewController () <UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong) NSArray* photosArray;
@property (nonatomic,strong) NSMutableArray* subjects;
@property (nonatomic,strong) NSMutableArray* locations;

@property (nonatomic,strong) NSMutableDictionary* photosCollection;
@property (nonatomic,assign) NSUInteger currentSegmentIndex;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupPhotos];
    [self setupSections];
    self.currentSegmentIndex = 0;
    self.photosCollection = [self sortSectionsWithSet:self.subjects segmentIndex:self.currentSegmentIndex];
    NSLog(@"View Loaded");
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource -

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    if(self.currentSegmentIndex == 0)
    {
             NSLog(@"numberofsections called");
        return self.subjects.count;
   
    }
    
    else if(self.currentSegmentIndex == 1){
        NSLog(@"numberofsections called");

        return self.locations.count;
        }
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if(self.currentSegmentIndex == 0){
        NSString* sectionKey = [self.subjects objectAtIndex:section];
        NSLog(@"numberofitemscalled");
        return [[self.photosCollection objectForKey:sectionKey] count];
        
    }
    else if(self.currentSegmentIndex == 1){
        NSString* sectionKey = [self.locations objectAtIndex:section];
        NSLog(@"numberofitemscalled");
        return [[self.photosCollection objectForKey:sectionKey] count];
       
    }
    NSLog(@"numberofitemscalled");

    return 0;
}


- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    PhotosCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"photoCell" forIndexPath:indexPath];
    if(self.currentSegmentIndex == 0){
        NSString* sectionKey = [self.subjects objectAtIndex:indexPath.section];
        cell.photo = [[self.photosCollection objectForKey:sectionKey] objectAtIndex:indexPath.row];
        cell.backgroundColor = [UIColor redColor];
    }
    else if(self.currentSegmentIndex == 1){
        NSString* sectionKey = [self.locations objectAtIndex:indexPath.section];
        cell.photo = [[self.photosCollection objectForKey:sectionKey] objectAtIndex:indexPath.row];
    }
    NSLog(@"deque callled");

    return cell;
    
}

//-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
//    
//    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
//        PhotosCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"sectionHeader" forIndexPath:indexPath];
//        if(self.currentSegmentIndex == 0){
//            NSString* sectionKey = [self.subjects objectAtIndex:indexPath.section];
//            headerView.sectionName.text = sectionKey;
//        }
//        else if(self.currentSegmentIndex == 1){
//            NSString* sectionKey = [self.locations objectAtIndex:indexPath.section];
//            headerView.sectionName.text = sectionKey;
//        }
//
//        return headerView;
//    }
//    return nil;
//}


#pragma mark - Setup Data -

-(void) setupPhotos
{
    Photos* photo1 = [[Photos alloc] initWithImage:[UIImage imageNamed:@"cypress1"] subject:@"@People" location:@"Cypress"];
    Photos* photo2 = [[Photos alloc] initWithImage:[UIImage imageNamed:@"cypress2"] subject:@"@Nature" location:@"Cypress"];
    Photos* photo3 = [[Photos alloc] initWithImage:[UIImage imageNamed:@"cypress3"] subject:@"Landscape" location:@"Cypress"];
    Photos* photo4 = [[Photos alloc] initWithImage:[UIImage imageNamed:@"cypress4"] subject:@"Landscape" location:@"Cypress"];
    Photos* photo5 = [[Photos alloc] initWithImage:[UIImage imageNamed:@"dentrys1"] subject:@"People" location:@"Dentrys"];
    Photos* photo6 = [[Photos alloc] initWithImage:[UIImage imageNamed:@"dentrys2"] subject:@"People" location:@"Dentrys"];
    Photos* photo7 = [[Photos alloc] initWithImage:[UIImage imageNamed:@"dentrys3"] subject:@"People" location:@"Dentrys"];
    Photos* photo8 = [[Photos alloc] initWithImage:[UIImage imageNamed:@"wreck1"] subject:@"People" location:@"Wreck"];
    Photos* photo9 = [[Photos alloc] initWithImage:[UIImage imageNamed:@"wreck2"] subject:@"People" location:@"Wreck"];
    Photos* photo10 = [[Photos alloc] initWithImage:[UIImage imageNamed:@"wreck3"] subject:@"People" location:@"Wreck"];
    self.photosArray =  @[photo1,photo2,photo3,photo4,photo5,photo6,photo7,photo8,photo9,photo10];
}

-(void) setupSections
{
    self.subjects = [NSMutableArray new];
    for (Photos* photo in self.photosArray) {
        if(![self.subjects containsObject:photo.subject])
        [self.subjects addObject:photo.subject];
    }
    self.locations = [NSMutableArray new];
    for (Photos* photo in self.photosArray) {
        if(![self.locations containsObject:photo.location])
        [self.locations addObject:photo.location];
    }

}

#pragma mark - IndexPath Logic -


-(NSMutableDictionary*) sortSectionsWithSet:(NSMutableArray*) set segmentIndex:(NSUInteger) index{
    NSMutableDictionary* tempDictionary = [NSMutableDictionary new];
    if(index == 0)
    {
        for (NSString* category in set)
        {
            NSMutableArray* categoryArray = [NSMutableArray new];
            for (Photos* photo in self.photosArray)
            {
                if([category isEqualToString:photo.subject])
                {
                    [categoryArray addObject:photo];
                }
            }
            [tempDictionary setObject:categoryArray forKey:category];
        }
        return tempDictionary;
    }else if(index == 1)
    {
        for (NSString* category in set)
        {
            NSMutableArray* categoryArray = [NSMutableArray new];
            for (Photos* photo in self.photosArray)
            {
                if([category isEqualToString:photo.location])
                {
                    [categoryArray addObject:photo];
                }
            }
            [tempDictionary setObject:categoryArray forKey:category];
        }
        return tempDictionary;
    }
    return nil;
}




- (IBAction)segmentChanged:(UISegmentedControl *)sender {
    
    NSUInteger segmentIndex = sender.selectedSegmentIndex;
    if(segmentIndex == 0)
        self.photosCollection =[self sortSectionsWithSet:self.subjects segmentIndex:segmentIndex];
    else if (segmentIndex == 1)
        self.photosCollection =[self sortSectionsWithSet:self.locations segmentIndex:segmentIndex];
    self.currentSegmentIndex = segmentIndex;
    NSLog(@"segment changed");
    [self.collectionView reloadData];

}



@end
