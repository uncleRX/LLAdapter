//
//  LLBaseCell.h
//  LLAdapter
//
//  Created by ylin.yang on 2018/8/11.
//

#import <Foundation/Foundation.h>
#import "LLAdapterDefine.h"

/**
 cell加载类型
 
 - LLCellLoadTypeInner: 使用sb构建的cell使用该选项
 - LLCellLoadTypeOri: 使用纯代码构建的cell使用该选项
 - LLCellLoadTypeNib: 使用Nib构建的cell使用该选项
 */
typedef NS_ENUM(NSInteger, LLCellLoadType) {
    LLCellLoadTypeInner,
    LLCellLoadTypeOri,
    LLCellLoadTypeNib
};
/// 点击后的去选风格
typedef NS_ENUM(NSInteger, LLDeSelectionStyle) {
    LLDeSelectionStyleNone,//不操作
    LLDeSelectionStyleNow,//立即去选择
    LLDeSelectionStylePersist,//永久选择
};
/// 分割线风格
typedef NS_ENUM(NSInteger, LLTableViewCellSeparatorStyle) {
    LLTableViewCellSeparatorStyleNone,//无
    LLTableViewCellSeparatorStyleInner,//系统内置
    LLTableViewCellSeparatorStyleCustom,//自定义
};

/**
 基础cell
 */
@interface LLBaseCell <LLCellDataType>: NSObject

/// kvc 透传数据
@property (strong, nonatomic,readonly) NSMutableDictionary<NSString *, id> *kvcExt;

/// 行索引信息
@property (weak, nonatomic) NSIndexPath *indexPath;
/// cell类
@property (assign, nonatomic) Class cellClazz;
/// cell 重用id 默认是 cellClazz类的类名
@property (copy, nonatomic) NSString *cellIdentity;
/// cell 默认是 cellClazz类的类名
@property (copy, nonatomic) NSString *cellNibName;
/// cell加载类型 默认 LLCellLoadTypeInner
@property (assign, nonatomic) LLCellLoadType loadType;
/// 当xib资源不在mainBundle中 需要指定其所在的bundle
@property (strong, nonatomic) NSBundle *cellBundle;

/// 数据
@property (strong, nonatomic) LLCellDataType data;

///
/// 使用kvc 给cell的 属性增加值
/// object: 值
///
- (void)addObject:(id)object forCellPath:(NSString *)path;

/// 内部使用NSValue包装(弱引用)
- (void)addWeakObject:(id)object forCellPath:(NSString *)path;

// 获取弱引用键值对
- (NSDictionary *)getWeakKvcMaps;

// 获取kvc透传键值对
- (NSDictionary *)getKvcMaps;


@end
