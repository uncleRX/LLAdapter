//
//  TestFlowCell1.m
//  DTTemplateListControllerExample
//
//  Created by renxun on 2018/8/15.
//  Copyright © 2018年 renxun. All rights reserved.
//

#import "TestFlowCell1.h"
#import <LLAdapter.h>
#import <Masonry/Masonry.h>
#import <SDWebImage/UIImageView+WebCache.h>

@implementation TestFlowCell1

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self configUI];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if(self = [super initWithCoder:aDecoder]) {
        [self configUI];
    }
    return self;
}

- (void)configUI {
    
    self.contentView.backgroundColor = [UIColor whiteColor];
    self.contentView.layer.cornerRadius = 4;
    self.contentView.layer.masksToBounds = YES;
    
    UIImageView *contentImageView = [[UIImageView alloc] init];
    self.contentImageView = contentImageView;
    [self.contentView addSubview:contentImageView];
    
    __weak typeof(self) self_weak = self;
    [self.contentImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self_weak);
    }];
    //iOS9.0之后图片设置 圆角不会出发离屏渲染
    self.contentImageView.layer.cornerRadius = 4;
    self.contentImageView.layer.masksToBounds = YES;

}

- (void)ll_updateCellUI {
    [super ll_updateCellUI];
    LLWaterCell *cellModel = (LLWaterCell *)self.ll_model;
    NSString *urlStr = cellModel.data;
    [self.contentImageView sd_setImageWithURL:[NSURL URLWithString:urlStr]];
}

@end
