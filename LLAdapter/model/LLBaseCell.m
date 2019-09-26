//
//  LLBaseCell.m
//  LLAdapter
//
//  Created by ylin.yang on 2018/8/11.
//

#import "LLBaseCell.h"

@interface LLBaseCell ()

/// kvc 透传数据
@property (strong, nonatomic) NSMutableDictionary<NSString *, id> *kvcExt;

/// 弱引用 kvc透传数据
@property (strong, nonatomic) NSMutableDictionary <NSString *, NSValue *> *weakMap;

@end

@implementation LLBaseCell

- (instancetype)init {
    self = [super init];
    if (self) {
        _kvcExt = [NSMutableDictionary dictionary];
        _weakMap = [NSMutableDictionary dictionary];
    }
    return self;
}

- (NSString *)cellIdentity {
    if (_cellIdentity) {
        return _cellIdentity;
    }
    NSString *val = NSStringFromClass(self.cellClazz);
    return val;
}

- (NSString *)cellNibName {
    if (_cellNibName) {
        return _cellNibName;
    }
    NSString *val = NSStringFromClass(self.cellClazz);
    return val;
}

- (void)addObject:(id)object forCellPath:(NSString *)path {
    if(path && object) {
        [self.kvcExt setObject:object forKey:path];
    }
}

- (void)addWeakObject:(id)object forCellPath:(NSString *)path {
    if(path && object) {
        NSValue *value = [NSValue valueWithNonretainedObject:object];
        [self.weakMap setObject:value forKey:path];
    }
}

- (NSDictionary *)getWeakKvcMaps {
    return [self.weakMap copy];
}

- (NSDictionary *)getKvcMaps {
    return [self.kvcExt copy];
}


@end
