//
//  MapController.h
//  SQLITE
//
//  Created by JETS on 2/28/18.
//  Copyright (c) 2018 JETS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "MyAnnotation.h"
#import "SetImag.h"
@interface MapController : UIViewController <MKMapViewDelegate>
@property (strong, nonatomic) IBOutlet MKMapView *map;
- (IBAction)mapClicked:(id)sender;
@property id<SetImag>mapview;



@end
