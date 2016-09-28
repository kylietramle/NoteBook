//
//  AddNoteViewController.h
//  NoteBook
//
//  Created by Kylie Tram Le on 9/27/16.
//  Copyright © 2016 Kylie Tram Le. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Note; // no need to import in header

@protocol AddNoteViewControllerDelegate <NSObject> // NSObject: class or protocol

- (void)saveNote:(Note *)note;

@end

@interface AddNoteViewController : UIViewController

@property (weak, nonatomic) id<AddNoteViewControllerDelegate> delegate;

@end
