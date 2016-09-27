//
//  NotesTableViewController.m
//  NoteBook
//
//  Created by Kylie Tram Le on 9/22/16.
//  Copyright © 2016 Kylie Tram Le. All rights reserved.


// Implementation file: code to implement header methods

#import "NotesTableViewController.h"

@interface NotesTableViewController ()
@property (copy, nonatomic) NSArray *notes; // array to store data
@end

@implementation NotesTableViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // register reusablecell identifer
    [self.tableView registerClass: [UITableViewCell class] forCellReuseIdentifier:@"NoteCell"];
    
    self.notes = @[@"Wilbur", @"Wilbee", @"Willy", @"Willy-kun"];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.notes.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NoteCell" forIndexPath:indexPath];
    
    cell.textLabel.text = self.notes[indexPath.row];
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
