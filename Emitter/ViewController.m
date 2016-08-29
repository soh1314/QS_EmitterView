//
//  ViewController.m
//  Emitter
//
//  Created by 刘仰清 on 16/8/29.
//  Copyright © 2016年 HearMe. All rights reserved.
//

#import "ViewController.h"
#import "QS_EmitterView.h"
#define RGBColor(a,b,c,d) [UIColor colorWithRed:(a) green:(b) blue:(c) alpha:(d)]
@interface ViewController ()
@property (nonatomic, strong)NSMutableArray * colors;
@property (nonatomic, strong)NSMutableArray * cells;
@property (nonatomic, strong)QS_EmitterView * emitterView;
@property (nonatomic, assign)float intensity;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    QS_EmitterView * emitterView = [[QS_EmitterView alloc]initWithFrame:self.view.frame];
    _emitterView = emitterView;
    [self.view addSubview:emitterView];
    [emitterView startEmit];
    
    UIButton * stop = [UIButton buttonWithType:UIButtonTypeCustom];
    stop.backgroundColor = [UIColor redColor];
    stop.frame = CGRectMake(0, 0, 50, 50);
    [self.view addSubview:stop];
    [stop addTarget:self action:@selector(stop:) forControlEvents:UIControlEventTouchUpInside];
//    self.intensity = 0.5;
//    CAEmitterLayer * emitterLayer = [[CAEmitterLayer alloc]init];
//    emitterLayer.emitterPosition = CGPointMake(self.view.frame.size.width/2.0, 0);
//    emitterLayer.emitterShape = kCAEmitterLayerLine;
//    emitterLayer.emitterSize = CGSizeMake(self.view.frame.size.width, 1);
//    UIColor * color = [UIColor colorWithRed:0.95 green:0.40 blue:0.27 alpha:1.0];
//    UIColor * color1 = RGBColor(1, 0.78,0.36,1);
//    UIColor * color2 = RGBColor(0.48, 0.78,0.64,1);
//    UIColor * color3 = RGBColor(0.30, 0.76,0.85,1);
//    UIColor * color4 = RGBColor(0.58, 0.39,0.55,1);
//    _colors = [NSMutableArray array];
//    _cells = [NSMutableArray array];
//    [_colors addObject:color1];
//    [_colors addObject:color2];
//    [_colors addObject:color3];
//    [_colors addObject:color4];
//    for (int i = 0; i < self.colors.count; i++) {
//        CAEmitterCell * cell = [[CAEmitterCell alloc]init];
//        cell.birthRate = 6.0 * self.intensity;
//        cell.lifetime = 14.0 * self.intensity;
//        cell.lifetimeRange = 0;
//        UIColor * color = self.colors[i];
//        cell.color = color.CGColor;
//        cell.velocity = self.intensity * 350;
//        cell.velocityRange = (CGFloat)(80.0 * self.intensity);
//        cell.emissionLongitude = (CGFloat)M_PI;
//        cell.emissionRange = (CGFloat)(M_PI_4);
//        cell.spin = (CGFloat)(3.5 * self.intensity);
//        cell.spinRange = (CGFloat)(4.0 * self.intensity);
//        cell.scaleRange = (CGFloat)(self.intensity);
//        cell.scaleSpeed = (CGFloat)(-0.1 * self.intensity);
//        cell.contents = (id)[[UIImage imageNamed:@"flat.png"] CGImage];
//        [self.cells addObject:cell];
//        
//    }
//    emitterLayer.emitterCells = self.cells;
//    [self.view.layer addSublayer:emitterLayer];
//    [UIView animateWithDuration:2.0 delay:1.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
//        
//    } completion:^(BOOL finished) {
//        emitterLayer.birthRate = 0;
//    }];
//    // Do any additional setup after loading the view, typically from a nib.
}
- (void)stop:(id)sender
    {
        UIButton * btn = sender;
        btn.selected = !btn.selected;
        if (btn.selected) {
            [self.emitterView stopEmit];
        }
        else
        {
            [self.emitterView startEmit];
        }

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
