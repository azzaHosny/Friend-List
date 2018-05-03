//
//  dbManager.h
//  SQLITE
//
//  Created by JETS on 2/25/18.
//  Copyright (c) 2018 JETS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "JETSViewController.h"
#import "UserBean.h"
@interface dbManager : NSObject
@property (strong , nonatomic) NSString *databasePath;
@property (nonatomic) sqlite3 *contactDB;
//@property NSString*name;
//@property NSString*email;
//@property NSString*phone;
//@property NSString*img;

-(void)saveData:(NSString*)uname :(NSString*)uemail :(NSString*)uphone :(NSString*)uimage :(double)ulat :(double)ulog ;
-(void)createDatabase;
-(UserBean*)retrieveData;
@end
