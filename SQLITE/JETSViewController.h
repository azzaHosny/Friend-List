//
//  JETSViewController.h
//  SQLITE
//
//  Created by JETS on 2/25/18.
//  Copyright (c) 2018 JETS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>
#import "SetImag.h"
@interface JETSViewController : UIViewController <SetImag>
@property (strong, nonatomic) IBOutlet UITextField *name;
@property (strong, nonatomic) IBOutlet UITextField *phone;
@property (strong, nonatomic) IBOutlet UITextField *email;
- (IBAction)nextView:(id)sender;
- (IBAction)openGalary:(id)sender;
@property NSString* imgsrc;
@property id<SetImag> names;

@property (strong, nonatomic) IBOutlet UITextField *img;
- (IBAction)openMap:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *latuid;

@property (strong, nonatomic) IBOutlet UITextField *longtuid;


@end
