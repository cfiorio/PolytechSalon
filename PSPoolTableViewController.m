//
//  PSPoolTableViewController.m
//  Polytech Salon
//
//  Created by Fiorio Christophe on 10/03/2014.
//  Copyright (c) 2014 Fiorio Christophe. All rights reserved.
//

#import "PSPoolTableViewController.h"
#import "PSPoolCell.h"
#import "PSAppDelegate.h"

@interface PSPoolTableViewController ()

@end

@implementation PSPoolTableViewController

@synthesize library=_library;

static NSArray* areaKeys=nil;

- (NSSet*) getDocsOfAreaName:(NSString*) areaName{
    NSSet* docs = [self.library.docs objectsPassingTest:^(id obj, BOOL *stop){
        BOOL r = [[[(PSDocument*)obj area] name] isEqual:areaName];
        return r;
    }]; // create a set of only docs of current section keys
    return docs;
}

- (NSArray*) getSortedDocsOfSet:(NSSet*) docsSet{
    NSSortDescriptor* sortDesc = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES
                                                   selector:@selector(caseInsensitiveCompare:)];
    NSArray* docsTab = [docsSet sortedArrayUsingDescriptors:[NSArray arrayWithObject:sortDesc]];
    return docsTab;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

//    self->_library=[(PSAppDelegate*)[[UIApplication sharedApplication] delegate] library];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [self.library.areas count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (areaKeys==nil) { // get keys of areas and sort them alphabetically
        areaKeys = [[self.library.areas allKeys] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    }
    //NSLog(@"section=%d - key=%@",section,[areaKeys objectAtIndex:section]);
    // count docs of section with name corresponding to section'th keys of areas
    return [[self getDocsOfAreaName:[areaKeys objectAtIndex:section]] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"PSPoolCell";
    PSPoolCell* cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    // Configure the cell...
    //[NSString stringWithFormat:@"area %d - %d",indexPath.row,indexPath.item];
    // get set of docs corresponding to area name, then get a sorted array of this set, then get objecct at item index
    cell.nameLabel.text= [[[self getSortedDocsOfSet:[self getDocsOfAreaName:[areaKeys objectAtIndex:indexPath.section]]]
                                                    objectAtIndex:indexPath.item] name];
    // get area with key corresponding to section, then get its name
    cell.areaLabel.text= [[self.library.areas objectForKey:[areaKeys objectAtIndex:indexPath.section]] name];
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
