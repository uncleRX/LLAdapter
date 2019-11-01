//
//  LLWaterCell.h
//  LLAdapter
//
//  Created by renxun on 2019/11/1.
//

#import "LLCollectCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface LLWaterCell : LLCollectCell

@property (nonatomic, assign) CGFloat aspectRatio; ///<  高宽比 (默认比例为1:1)
@property (nonatomic, assign) CGFloat extraHeight; ///< 附加的的额外高度

@end

NS_ASSUME_NONNULL_END
