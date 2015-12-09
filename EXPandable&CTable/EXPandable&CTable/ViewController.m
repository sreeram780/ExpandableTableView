//
//  ViewController.m
//  EXPandable&CTable
//
//  Created by SreenivasulaReddy on 09/12/15.
//  Copyright © 2015 SreenivasulaReddy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView * myTable;
    NSMutableArray *originalArray,*typesArray,*imageArrray;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    originalArray = [[NSMutableArray alloc]initWithObjects:@[@"one"],@[@"two"],
                     @[@"three"],@[@"four"],@[@"five"],
                     @[@"six"],@[@"seven"],nil];
    typesArray = [NSMutableArray arrayWithArray:originalArray];
    imageArrray = [[NSMutableArray alloc]initWithObjects:
  @[@"one",@"1",@"one"],
  @[@"two",@"2",@"two"],
  @[@"three",@"3",@"three"],
  @[@"four",@"4",@"four"],
  @[@"five",@"5",@"two"],
  @[@"six",@"6",@"six"],
  @[@"seven",@"7",@"two"], nil];
    
    
    myTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width,  self.view.bounds.size.height) style:UITableViewStylePlain];
    myTable.delegate = self;
    myTable.dataSource = self;
    [myTable registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:myTable];
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return typesArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[typesArray objectAtIndex:section]count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = [[typesArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    

    cell.backgroundColor = [UIColor clearColor];
    return  cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
       if ([self.selectedId isEqual:indexPath]) {
        self.selectedId = nil;
       typesArray = [NSMutableArray arrayWithArray:originalArray];
        [myTable reloadSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:UITableViewRowAnimationFade];
        
    }else{
        
        if (indexPath.row == 0) {
           typesArray = [NSMutableArray arrayWithArray:originalArray];
            [myTable reloadData];
            [typesArray removeObjectAtIndex:indexPath.section];
            [typesArray insertObject:[imageArrray objectAtIndex:indexPath.section] atIndex:indexPath.section];
            [myTable reloadSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:UITableViewRowAnimationFade];
            self.selectedId = indexPath;
        }else{
            
            NSLog(@"seleted row %ld in section %ld",(long)indexPath.row,(long)indexPath.section);

        }
    }
    
    
}

@end






//    id data = [typesArray objectAtIndex:indexPath.section];
//    NSMutableArray *arrData = nil;
//    if([data isKindOfClass:[NSString class]])
//        NSLog(@"its string");
//    else if([data isKindOfClass:[NSMutableArray class]])
//    {
//        arrData = (NSMutableArray *)data;
//    }
//    else if([data isKindOfClass:[NSArray class]])
//    {
//        arrData = (NSMutableArray *)data;
//    }
//    else {
//        NSLog(@"its something %@",data);
//    }
//
//    NSString *cellData = @"";
//    if(arrData)
//        cellData = [arrData objectAtIndex:indexPath.row];
//
//    cell.textLabel.text = cellData;
