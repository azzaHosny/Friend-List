//
//  dbManager.m
//  SQLITE
//
//  Created by JETS on 2/25/18.
//  Copyright (c) 2018 JETS. All rights reserved.
//

#import "dbManager.h"
#import "JETSViewController.h"
#import "UserBean.h"
@implementation dbManager

-(void)createDatabase{
    NSString *docsDir;
    NSArray *dirPaths;
    // Get the documents directory
    dirPaths = NSSearchPathForDirectoriesInDomains(
                                                   NSDocumentDirectory, NSUserDomainMask, YES);
    
    docsDir = dirPaths[0];
    
    // Build the path to the database file
     _databasePath= [[NSString alloc]
                       initWithString: [docsDir stringByAppendingPathComponent:
                                        @"contacts.db"]];
    
    //printf("%s",[_databasePath UTF8String]);
    const char *dbpath = [_databasePath UTF8String];
    
    if (sqlite3_open(dbpath, &_contactDB) == SQLITE_OK)
    {
        char *errMsg;
        const char *sql_stmt =
        "CREATE TABLE IF NOT EXISTS user (ID INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, email TEXT, phone TEXT, image TEXT, latuid DOUBLE, longtuid DOUBLE)";
        
        if (sqlite3_exec(_contactDB, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK)
        {
            printf("Failed to create table\n");
        }
        else{
            printf("created");
        }
        sqlite3_close(_contactDB);
    } else {
        printf("Failed to open/create database\n");
    }
    
}

-(void)saveData:(NSString *)uname :(NSString *)uemail :(NSString *)uphone :(NSString *)uimage :(double)ulat :(double)ulog{
    

    sqlite3_stmt *statement;
    const char *dbpath = [_databasePath UTF8String];

    if (sqlite3_open(dbpath, &_contactDB) == SQLITE_OK)
    {
        
        NSString *insertSQL = [NSString stringWithFormat:
                               @"INSERT INTO user (name, email, phone, image, latuid, longtuid ) VALUES (\"%@\", \"%@\", \"%@\", \"%@\", \"%lf\", \"%lf\")", uname, uemail, uphone, uimage,ulat,ulog];
        const char *insert_stmt = [insertSQL UTF8String];
        sqlite3_prepare_v2(_contactDB, insert_stmt,
                           -1, &statement, NULL);
        
        if (sqlite3_step(statement) ==SQLITE_DONE)
        {
            printf("data inserted");
          
            
        } else {
            
            NSLog(@"%s",sqlite3_errmsg(_contactDB));
        }
        sqlite3_finalize(statement);
        sqlite3_close(_contactDB);
    }
 
}

-(NSMutableArray*)retrieveData{
    
    NSMutableArray *myFriends= [NSMutableArray new];
    UserBean *user;
    const char *dbpath = [_databasePath UTF8String];
    sqlite3_stmt    *statement;
    
    if (sqlite3_open(dbpath, &_contactDB) == SQLITE_OK)
    {
        NSString *querySQL = [NSString stringWithFormat:
                              @"SELECT *FROM user"];
        
        const char *query_stmt = [querySQL UTF8String];
        
        if (sqlite3_prepare_v2(_contactDB,
                               query_stmt, -1, &statement, NULL) == SQLITE_OK)
        {
            while (sqlite3_step(statement) == SQLITE_ROW)
            {
                
                
                user =[UserBean new];
                
                
               [ user setName : [[NSString alloc]
                                          initWithUTF8String:
                                          (const char *) sqlite3_column_text(
                                                                             statement, 1)]];
             //   _address.text = addressField;
                [user setEmail:[[NSString alloc]
                                        initWithUTF8String:(const char *)
                                        sqlite3_column_text(statement, 2)]];
                [user setPhone:[[NSString alloc]
                                initWithUTF8String:(const char *)
                                sqlite3_column_text(statement, 3)]];
                [user setImg:[[NSString alloc]
                                initWithUTF8String:(const char *)
                                sqlite3_column_text(statement, 4)]];
                [user setLat:[[NSString alloc]
                              initWithUTF8String:(const char *)
                              sqlite3_column_text(statement, 5)]];
                [user setLog:[[NSString alloc]
                                                                                 initWithUTF8String:(const char *)
                                                                                 sqlite3_column_text(statement, 6)]];
                
                [myFriends addObject:user];
                
             //   _phone.text = phoneField;
                printf("Match found");
            }             sqlite3_finalize(statement);
        }
        sqlite3_close(_contactDB);
    }
    
    
    return  myFriends;
}


@end
