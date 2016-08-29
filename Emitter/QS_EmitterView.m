//
//  QS_EmitterView.m
//  Emitter
//
//  Created by 刘仰清 on 16/8/30.
//  Copyright © 2016年 HearMe. All rights reserved.
//

#import "QS_EmitterView.h"
#define RGBColor(a,b,c,d) [UIColor colorWithRed:(a) green:(b) blue:(c) alpha:(d)]

@implementation QS_EmitterView
UIImage * emitter(QSEmitterImageType imageType)
{
    NSString * fileName = nil;
    switch (imageType) {
        case Confetti:
            fileName = @"flat";
            break;
        case diamond:
            fileName = @"diamond";
            break;
        case star:
            fileName = @"star";
            break;
        case triangle:
            fileName = @"triangle";
        default:
            break;
    }
    NSString * path  = [[NSBundle mainBundle]pathForResource:fileName ofType:@".png"];
    NSData * data = [NSData dataWithContentsOfURL:[NSURL fileURLWithPath:path]];
    UIImage * image = [UIImage imageWithData:data];
    return image;
    
}
- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.imageType = star;
        self.intensity = 0.5;
    }
    return self;
}
- (void)startEmit
{
    _emitterLayer = [[CAEmitterLayer alloc]init];
    _emitterLayer.emitterPosition = CGPointMake(self.frame.size.width/2.0, 0);
    _emitterLayer.emitterShape = kCAEmitterLayerLine;
    _emitterLayer.emitterSize = CGSizeMake(self.frame.size.width, 1);
    _emitterLayer.emitterCells = [self cells];
    [self.layer addSublayer:_emitterLayer];
}

- (void)stopEmit
{
    if (self.emitterLayer) {
        self.emitterLayer.birthRate = 0;
    }
}
- (NSMutableArray *)cells
{
    NSMutableArray * tem = [NSMutableArray array];
    for (int i = 0; i < self.colors.count; i++) {
        CAEmitterCell * cell = [[CAEmitterCell alloc]init];
        cell.birthRate = 6.0 * self.intensity;
        cell.lifetime = 14.0 * self.intensity;
        cell.lifetimeRange = 0;
        UIColor * color = self.colors[i];
        cell.color = color.CGColor;
        cell.velocity = self.intensity * 350;
        cell.velocityRange = (CGFloat)(80.0 * self.intensity);
        cell.emissionLongitude = (CGFloat)M_PI;
        cell.emissionRange = (CGFloat)(M_PI_4);
        cell.spin = (CGFloat)(3.5 * self.intensity);
        cell.spinRange = (CGFloat)(4.0 * self.intensity);
        cell.scaleRange = (CGFloat)(self.intensity);
        cell.scaleSpeed = (CGFloat)(-0.1 * self.intensity);
        cell.contents = (id)[emitter(self.imageType) CGImage];
        [tem addObject:cell];
    }
    return tem;
   
  
}
- (NSMutableArray *)colors
{
    if (!_colors) {
        _colors = [NSMutableArray array];
        UIColor * color1 = RGBColor(0.95,  0.40,0.27,1);
        UIColor * color2 = RGBColor(1,    0.78,0.36,1);
        UIColor * color3 = RGBColor(0.48, 0.78,0.64,1);
        UIColor * color4 = RGBColor(0.30, 0.76,0.85,1);
        UIColor * color5 = RGBColor(0.58, 0.39,0.55,1);
        [_colors addObject:color1];
        [_colors addObject:color2];
        [_colors addObject:color3];
        [_colors addObject:color4];
        [_colors addObject:color5];
    }
    return _colors;
}

@end
