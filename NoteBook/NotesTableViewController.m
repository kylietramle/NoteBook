//
//  NotesTableViewController.m
//  NoteBook
//
//  Created by Kylie Tram Le on 9/22/16.
//  Copyright © 2016 Kylie Tram Le. All rights reserved.


// Implementation file: code to implement header methods

#import "NotesTableViewController.h"
#import "Note.h"
#import "AddNoteViewController.h"

@interface NotesTableViewController () <AddNoteViewControllerDelegate>
@property (copy, nonatomic) NSArray *notes; // array to store data
@end

@implementation NotesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // register reusablecell identifer
    [self.tableView registerClass: [UITableViewCell class] forCellReuseIdentifier:@"NoteCell"];
    
    if([Note readNotesFromFile] == nil) {
        self.notes = @[];
    } else {
        self.notes = [Note readNotesFromFile];
    }
    
    // add cancel button
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemAdd target:self action:@selector(addButtonTapped:)];
    
    UIBarButtonItem *deleteButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemTrash target:self action:@selector(deleteButtonTapped:)];
    
    self.navigationItem.leftBarButtonItem = addButton;
    self.navigationItem.rightBarButtonItem = deleteButton;
}

    // method that triggered when button is pressed
    - (void)addButtonTapped: (id)sender {
    AddNoteViewController *addNoteVC = [[AddNoteViewController alloc] initWithNibName:@"AddNoteViewController" bundle: [NSBundle mainBundle]];
        addNoteVC.delegate = self; // this is the delegate that accepts
        
        [self presentViewController:addNoteVC animated:YES completion:nil];
}

    - (void)deleteButtonTapped:(id)sender {
     // delete archive file from disk
        [Note removeArchiveFile];
        
        self.notes = nil; // delete from memory
        [self.tableView reloadData];
}

- (void)saveNote:(Note *)note; {
    NSLog(@"saveNote called: %@", note.noteText);
    
    // after note is saved, view is dismissed
    [self dismissViewControllerAnimated:YES completion:nil];
    
    // create an array which can add data (original is NSArray)
    NSMutableArray *mutableNotes = [[NSMutableArray alloc] initWithArray:self.notes];
    [mutableNotes addObject:note];
    self.notes = [mutableNotes copy];
    
    [Note saveNotesToFile:self.notes];
    
    // reload tableView so info can refresh
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.notes.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NoteCell" forIndexPath:indexPath];
    
    // create a Note object
    Note *note = self.notes[indexPath.row];
                  
    // pass noteText method into the object that is returned
    cell.textLabel.text = note.noteText;
    
    return cell;
    
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

@end
