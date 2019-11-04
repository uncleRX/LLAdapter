//
//  LLWaterCollectViewAdapter.m
//  LLAdapter
//
//  Created by renxun on 2019/11/1.
//

#import "LLWaterCollectViewAdapter.h"
#import "LLWaterFlowLayout.h"
#import "LLWaterCell.h"

@interface LLWaterCollectViewAdapter () <LLWaterFlowLayoutDelegate>

@end

@implementation LLWaterCollectViewAdapter

- (void)setCollectionView:(UICollectionView *)collectionView {
    [super setCollectionView:collectionView];
    [self initLayout];
}

- (void)initLayout {
    if (!self.flowLayout) {
        self.flowLayout = [[LLWaterFlowLayout alloc] init];
        self.flowLayout.delegate = self;
        [self.flowLayout buildNormalWaterFlow];
    }
    self.collectionView.collectionViewLayout = self.flowLayout;
}

#pragma mark - waterflowLayoutDelegate

- (CGFloat)waterflowLayout:(LLWaterFlowLayout *)waterflowLayout heightForIndexPath:(NSIndexPath *)indexPath itemWidth:(CGFloat)itemWidth {
    CGFloat aspectRatio = 1.0;
    LLCollectSection *section = self.sections[indexPath.section];
    LLWaterCell *cell = section.datas[indexPath.item];
    if (cell) {
        aspectRatio = cell.aspectRatio;
    }
    waterflowLayout.extraHeight = cell.extraHeight;
    return [LLWaterFlowLayout calculateCellHeightWithAspectRatio:aspectRatio itemWidth:itemWidth];
}

- (CGSize)collectionView:(UICollectionView *)collectionView folwLayout:(LLWaterFlowLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    LLCollectSection *collSection = self.sections[section];
    LLCollectCell *cell = collSection.headerCell;
    CGSize size = cell.cellSize;
    return size;
}

- (CGSize)collectionView:(UICollectionView *)collectionView folwLayout:(LLWaterFlowLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    LLCollectSection *collSection = self.sections[section];
    LLCollectCell *cell = collSection.footerCell;
    CGSize size = cell.cellSize;
    return size;
}


@end
