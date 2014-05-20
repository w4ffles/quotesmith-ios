// This is another concept for the quote game
//  have quote sorting take place inside a UITableView or a UICollectionView
//  this is a bit nicer on a phone sized device
//
//
//  GameInsideTableViewController.m
//  QuoteSmith
//
//  Created by waffles on 5/13/14.
//  Copyright (c) 2014 Anthony LaMantia. All rights reserved.
//

#import "GameInsideTableViewController.h"

@interface GameInsideTableViewController () {
    UITableView *tableView;
}
@end

@implementation GameInsideTableViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
