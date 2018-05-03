//
//  secondViewController.h
//  SQLITE
//
//  Created by JETS on 2/25/18.
//  Copyright (c) 2018 JETS. All rights reserved.
//
#import "UserBean.h"
#import "SetImag.h"
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
@interface secondViewController : UIViewController <MKMapViewDelegate>

@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *email;
@property (strong, nonatomic) IBOutlet UILabel *phone;
@property (strong, nonatomic) IBOutlet UIImageView *uimg;
- (IBAction)renderMap:(id)sender;

@property   UserBean* details;
@property (strong, nonatomic) IBOutlet MKMapView *map;


@end
