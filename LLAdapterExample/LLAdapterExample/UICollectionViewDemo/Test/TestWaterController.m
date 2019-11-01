//
//  TestWaterController.m
//  LLAdapterExample
//
//  Created by renxun on 2019/11/1.
//  Copyright © 2019 ylin.yang. All rights reserved.
//

#import "TestWaterController.h"
#import "TestAPI.h"

#import <LLAdapter.h>
#import "TestFlowCell1.h"
#import "TestFlowCell2.h"


@interface TestWaterController ()

@property (nonatomic, strong) LLWaterCollectViewAdapter *adapter;
@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation TestWaterController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initAdapter];
    [self requestData];
}

- (void)initAdapter {
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[UICollectionViewLayout new]];
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    [self.view addSubview:collectionView];
    self.collectionView = collectionView;
    
    self.adapter = [[LLWaterCollectViewAdapter alloc] initWithCollection:self.collectionView];
    [self.adapter buildAddNewSection]; //创建一组
}

- (void)requestData {
    [TestAPI getDataSuccess:^(NSArray *dataArr) {
        LLCollectSection *section = self.adapter.sections.firstObject;
        for (NSDictionary *dic in dataArr) {
            CGFloat height = [dic[@"height"] doubleValue];
            CGFloat width = [dic[@"width"] doubleValue];
            NSString *typeStr = dic[@"type"];
            LLWaterCell *cell = [LLWaterCell new];
            cell.aspectRatio = height/width;
            cell.extraHeight = 0;
            cell.data = dic[@"imageUrl"];
            if ([typeStr isEqualToString:@"video"]) {
                cell.cellClazz = [TestFlowCell1 class];
                cell.loadType = LLCellLoadTypeOri;
            }else if ([typeStr isEqualToString:@"poster"]) {
                cell.cellClazz = [TestFlowCell2 class];
                cell.loadType = LLCellLoadTypeOri;
            }else {
                cell.cellClazz = [TestFlowCell1 class];
                cell.loadType = LLCellLoadTypeOri;
            }
            //cellClick
            cell.cellClick = ^(__kindof LLCollectCell *model, NSIndexPath *index) {
                NSLog(@"=====index:%ld",index.item);
            };
            [section addCell:cell];
        }
        [self.adapter reloadData];
    }];
}

@end
