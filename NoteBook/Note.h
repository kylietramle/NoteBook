//
//  Note.h
//  NoteBook
//
//  Created by Kylie Tram Le on 9/27/16.
//  Copyright © 2016 Kylie Tram Le. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Note : NSObject <NSCoding>

@property (strong, nonatomic) NSString *noteText;

+ (BOOL)saveNotesToFile:(NSArray *)notes;
+ (NSArray *)readNotesFromFile; // read file that is saved
+ (void)removeArchiveFile;

@end
