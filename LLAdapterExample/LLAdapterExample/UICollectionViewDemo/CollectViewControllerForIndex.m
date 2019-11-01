//
//  CollectViewControllerForIndex.m
//  LLAdapterExample
//
//  Created by renxun on 2019/11/1.
//  Copyright © 2019 ylin.yang. All rights reserved.
//

#import "CollectViewControllerForIndex.h"
#import <LLAdapter/LLAdapter.h>
#import <Masonry.h>
#import "CollectionController.h"

@interface CollectViewControllerForIndex ()

@property (strong, nonatomic) UITableView *simpleTable;
@property (strong, nonatomic) LLTableViewAdapter *adapter;

@end

@implementation CollectViewControllerForIndex

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initUI];
}

- (void)initUI {
    self.simpleTable = [UITableView new];
    [self.view addSubview:self.simpleTable];
    [self.simpleTable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    LLTableViewAdapter *adapter = [[LLTableViewAdapter alloc] initWithTableView:self.simpleTable];
    self.adapter = adapter;
    self.simpleTable.estimatedRowHeight = 44;
    self.simpleTable.rowHeight = UITableViewAutomaticDimension;
    
    ///设置数据
    LLTableSection *section = self.adapter.sections.firstObject;
    if (!section) {
        section = [self.adapter buildAddNewSection];
    }
   
    LLTableCell *simpleCell = [section buildAddCell];
    simpleCell.cellClick = ^(LLTableCell *cell, NSIndexPath *indexPath) {
        
    };
    simpleCell.loadType = LLCellLoadTypeInner;
    simpleCell.text = @"简单";
    
    LLTableCell *customCell = [section buildAddCell];
    customCell.cellClick = ^(LLTableCell *cell, NSIndexPath *indexPath) {
        
    };
    customCell.loadType = LLCellLoadTypeInner;
    customCell.text = @"自定义";
    
    LLTableCell *collectCell = [section buildAddCell];
    collectCell.cellClick = ^(LLTableCell *cell, NSIndexPath *indexPath) {
        CollectionController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"CollectionController"];
        [self.navigationController pushViewController:vc animated:true];
    };
    collectCell.loadType = LLCellLoadTypeInner;
    collectCell.text = @"collectCell";

    
    [self.adapter reloadData];
}

@end
