//
//  QTWaterflowLayout.m
//  DouPai2
//
//  Created by liaoshuhua on 16/12/17.
//  Copyright (c) 2016年 BHB. All rights reserved.
//

#import "LLWaterflowLayout.h"

/**每一列之间的间距*/
static const CGFloat kDefaultLineMargin = 5.0;
/**每一行之间的间距*/
static const CGFloat kDefaultRowMargin = 5.0;
/**边缘的间距*/
static const UIEdgeInsets kDefaultEdgeInsets = {16, 16, 10, 16};
/**瀑布流的列数*/
static const CGFloat kDefaultColumnCount = 3;

@interface LLWaterFlowLayout()

/**存放所有cell的布局属性*/
@property (nonatomic, strong) NSMutableArray * attrsArray;

/**存放所有列的当前高度*/
@property (nonatomic, strong) NSMutableArray * columnHeights;

/**内容的高度*/
@property (nonatomic, assign) CGFloat  contentHeight;

@end

@implementation LLWaterFlowLayout

- (instancetype)init {
    if (self=[super init]) {
        self.rowMargin = kDefaultRowMargin;
        self.lineMargin = kDefaultLineMargin;
        self.edgeInsets = kDefaultEdgeInsets;
        self.columnCount = kDefaultColumnCount;
    }
    return self;
}

- (void)buildNormalWaterFlow {
    self.lineMargin = 13.0;
    self.rowMargin = 10.0;
    self.columnCount = 2;
    self.extraHeight = 0;
}

#pragma mark - 懒加载
- (NSMutableArray *)attrsArray {
    if (!_attrsArray) {
        _attrsArray = [[NSMutableArray alloc] init];
    }
    return _attrsArray;
}

- (NSMutableArray *)columnHeights {
    if (!_columnHeights) {
        _columnHeights = [[NSMutableArray alloc] init];
    }
    return _columnHeights;
}

/*
 * 初始化
 */
- (void)prepareLayout {
    [super prepareLayout];
    
    self.contentHeight = 0;
    //清除以前计算的所以高度
    [self.columnHeights removeAllObjects];
    //默认高度
    for (NSInteger i = 0; i < self.columnCount; i++) {
        [self.columnHeights addObject:@(0)];
    }
    //清除之前所以的布局属性
    [self.attrsArray removeAllObjects];
    //数组 (存放所有cell的布局属性)
    //开始创建每一个cell对应的布局属性
    NSInteger section = [self.collectionView numberOfSections];
    for (NSInteger sectionIndex = 0 ;sectionIndex < section; sectionIndex++) {
        //创建位置
        NSIndexPath * indexPath = [NSIndexPath indexPathForItem:0 inSection:sectionIndex];
        //获取header的UICollectionViewLayoutAttributes
        UICollectionViewLayoutAttributes *headerAttrs = [self layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader atIndexPath:indexPath];
        if (headerAttrs) {
            [self.attrsArray addObject:headerAttrs];
        }
        NSInteger count = [self.collectionView numberOfItemsInSection:sectionIndex];
        for (int i = 0; i < count; i++) {
            //创建位置
            NSIndexPath * indexPath = [NSIndexPath indexPathForItem:i inSection:sectionIndex];
            //获取cell布局属性
            UICollectionViewLayoutAttributes * attrs = [self layoutAttributesForItemAtIndexPath:indexPath];
            
            [self.attrsArray addObject:attrs];
        }
        //获取footer的UICollectionViewLayoutAttributes
        UICollectionViewLayoutAttributes *footerAttrs = [self layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionFooter atIndexPath:indexPath];
        if (footerAttrs) {
            [self.attrsArray addObject:footerAttrs];
        }
    }
}

/**
 * 决定cell的布局
 */
-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    return self.attrsArray;
}

//根据特定索引路径返回布局属性实例。
//设置组头组委的布局属性
- (nullable UICollectionViewLayoutAttributes *)layoutAttributesForSupplementaryViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath{
    //header
    if ([UICollectionElementKindSectionHeader isEqualToString:elementKind]) {
        UICollectionViewLayoutAttributes *attri = [UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader withIndexPath:indexPath];
        //size
        CGSize size = CGSizeZero;
        if ([self.delegate respondsToSelector:@selector(collectionView:folwLayout:referenceSizeForHeaderInSection:)]) {
            size = [self.delegate collectionView:self.collectionView folwLayout:self referenceSizeForHeaderInSection:indexPath.section];
            if (CGSizeEqualToSize(size, CGSizeZero)) {
                return nil;
            }
        }else {
            return nil;
        }
        CGFloat x = 0;
        CGFloat y = self.contentHeight;
        //更新所有对应列的高度
        for (NSInteger i = 0; i < self.columnCount; i++) {
            self.columnHeights[i] = @(y+size.height);
        }
        attri.frame = CGRectMake(x , y, size.width, size.height);
        self.contentHeight = (y + size.height);
        return attri;
    } //footer
    else{
        UICollectionViewLayoutAttributes *attri = [UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionFooter withIndexPath:indexPath];
        //size
        CGSize size = CGSizeZero;
        if ([self.delegate respondsToSelector:@selector(collectionView:folwLayout:referenceSizeForFooterInSection:)]) {
            size = [self.delegate collectionView:self.collectionView folwLayout:self referenceSizeForFooterInSection:indexPath.section];
            if (CGSizeEqualToSize(size, CGSizeZero)) {
                return nil;
            }
        }else {
            return nil;
        }
        CGFloat x = 0;
        CGFloat y = self.contentHeight;
        self.contentHeight = (y + size.height);
        //更新所有对应列的高度
        for (NSInteger i = 0; i < self.columnCount; i++) {
            self.columnHeights[i] = @(y+size.height);
        }
        attri.frame = CGRectMake(x , y, size.width, size.height);
        return attri;
    }
}

//设置cell的布局属性
-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewLayoutAttributes * attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    //设置布局属性的frame
    CGFloat collectionViewW = self.collectionView.frame.size.width;
    CGFloat w = (collectionViewW - self.edgeInsets.left - self.edgeInsets.right - (self.columnCount - 1)*self.lineMargin) / self.columnCount;
    CGFloat h = [self.delegate waterflowLayout:self heightForIndexPath:indexPath itemWidth:w] + self.extraHeight;
    //找出高度最短的那一列
    NSInteger destColumn = 0;
    CGFloat minColumnHeight = [self.columnHeights[0] doubleValue];
    for (NSInteger i = 1; i < self.columnCount; i++) {
          CGFloat columnHeight = [self.columnHeights[i] doubleValue];
        if (minColumnHeight > columnHeight) {
            minColumnHeight = columnHeight;
            destColumn = i;
        }
    }
    CGFloat x = self.edgeInsets.left + destColumn * (w +self.lineMargin);
    CGFloat space = 0;
    if (indexPath.item < self.columnCount) {
        //第一行
        space = self.edgeInsets.top;
    }else{
        space = self.rowMargin;
    }
    CGFloat y = minColumnHeight+space;
    attrs.frame = CGRectMake(x, y, w, h);
    //更新最短那列的高度
    self.columnHeights[destColumn] = @(CGRectGetMaxY(attrs.frame));
    // 记录内容的高度
    CGFloat columnHeight = [self.columnHeights[destColumn] floatValue];
    if (self.contentHeight < columnHeight) {
        self.contentHeight = columnHeight;
    }
    return attrs;
}

- (CGSize)collectionViewContentSize {
    return CGSizeMake(0, self.contentHeight + self.edgeInsets.bottom);
}

+ (CGFloat)calculateCellHeightWithAspectRatio:(CGFloat)ratio itemWidth:(CGFloat)itemWidth {
    return itemWidth * ratio;
}

@end
