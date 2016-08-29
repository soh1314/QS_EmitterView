//
//  QS_EmitterView.h
//  Emitter
//
//  Created by 刘仰清 on 16/8/30.
//  Copyright © 2016年 HearMe. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,QSEmitterImageType)
{
    Confetti = 0,
    triangle,
    star,
    diamond
};
@interface QS_EmitterView : UIView

@property (nonatomic,strong)NSMutableArray * colors;
@property (nonatomic,strong)CAEmitterLayer * emitterLayer;
@property (nonatomic,assign)float intensity;
@property (nonatomic,assign)QSEmitterImageType imageType;

- (void)startEmit;
- (void)stopEmit;

@end
