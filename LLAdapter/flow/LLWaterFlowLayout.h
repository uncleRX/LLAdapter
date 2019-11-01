//
//  LLWaterFlowLayout.h
//  DouPai2
//
//  Created by liaoshuhua on 16/12/17.
//  Copyright (c) 2016年 BHB. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LLWaterFlowLayout;

@protocol LLWaterFlowLayoutDelegate <NSObject>

@required

/**
 获取cell的高度
 @param waterflowLayout 流水布局对象
 @param index 下标
 @param itemWidth 宽度
 @return  cell的高度
 */
- (CGFloat)waterflowLayout:(LLWaterFlowLayout *)waterflowLayout heightForItemAtIndex:(NSUInteger)index itemWidth:(CGFloat)itemWidth;

@optional
/**组头 size*/
- (CGSize)collectionView:(UICollectionView *)collectionView folwLayout:(LLWaterFlowLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section;
/**组尾 size*/
- (CGSize)collectionView:(UICollectionView *)collectionView folwLayout:(LLWaterFlowLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section;

@end

@interface LLWaterFlowLayout : UICollectionViewFlowLayout

@property (nonatomic, weak) id<LLWaterFlowLayoutDelegate> delegate;
/*边缘的间距*/
@property(nonatomic, assign)UIEdgeInsets edgeInsets;
/**每一列之间的间距*/
@property(nonatomic, assign)CGFloat lineMargin;
/**每一行之间的间距*/
@property(nonatomic, assign)CGFloat rowMargin;
/**列数*/
@property(nonatomic, assign)CGFloat columnCount;
/**cell额外高度-代理计算完高度之后会额外加上这个高度*/
@property (nonatomic, assign) CGFloat extraHeight;

/**默认的布局位置*/
- (void)buildNormalWaterFlow;

/**传入高宽比 返回cell的所需要的高度 */
+ (CGFloat)calculateCellHeightWithAspectRatio:(CGFloat)ratio itemWidth:(CGFloat)itemWidth;

@end

