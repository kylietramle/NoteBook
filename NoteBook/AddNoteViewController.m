//
//  AddNoteViewController.m
//  NoteBook
//
//  Created by Kylie Tram Le on 9/27/16.
//  Copyright © 2016 Kylie Tram Le. All rights reserved.
//

#import "AddNoteViewController.h"
#import "Note.h"

@interface AddNoteViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation AddNoteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)cancelButtonTapped: (id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder]; // make keyboard go away
    
    Note *note = [[Note alloc] init];
    note.noteText = textField.text;
    
    [self.delegate saveNote:note];
    
    NSLog(@"textField text: %@", textField.text);
    
    return YES;
}

@end
