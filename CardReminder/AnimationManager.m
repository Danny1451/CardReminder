//
//  AnimationManager.m
//  CardReminder
//
//  Created by 刘旦 on 13/06/2017.
//  Copyright © 2017 danny. All rights reserved.
//

#import "AnimationManager.h"

@implementation AnimationManager

- (void)createAnimation:(UIView*) view{
    
    //draw test line
    CGPoint center = CGPointMake(200, 200);
    
    CALayer *layerRed = [self createLayerRadius:105 startAngle:0 andPos:center withColor:[UIColor redColor]];
    [view.layer addSublayer:layerRed];
    CABasicAnimation *animate = [self createAnimationFrom:0  andDuration:1.5 withR:4];
    [layerRed addAnimation:animate forKey:@"layer"];
    
    
    CALayer *layerBlue = [self createLayerRadius:90 startAngle:0 andPos:center withColor:[UIColor blueColor]];
    [view.layer addSublayer:layerBlue];
    CABasicAnimation *animateBlue = [self createAnimationFrom:0.5*M_PI andDuration:1.8 withR:3];
    [layerBlue addAnimation:animateBlue forKey:@"layer"];
    
    
    CALayer *layerY= [self createLayerRadius:75 startAngle:0 andPos:center withColor:[UIColor yellowColor]];
    [view.layer addSublayer:layerY];
    CABasicAnimation *animateY = [self createAnimationFrom:M_PI/3 andDuration:1.9 withR:2];
    [layerY addAnimation:animateY forKey:@"layer"];
    
    
    //第三个
    CALayer *layerP= [self createLayerRadius:60 startAngle:M_PI*4/3 andPos:center withColor:[UIColor purpleColor]];
    [view.layer addSublayer:layerP];
    CASpringAnimation *animateP = [CASpringAnimation animationWithKeyPath:@"transform.rotation.z"];
    //    CABasicAnimation *animateP = [self createAnimationFrom:2*M_PI/3 andDuration:2.0 withR:1];
    //    animateP.mass = 8.0;
    //    animateP.duration = 2;
    animateP.initialVelocity = 2;
    animateP.duration = animateP.settlingDuration;
    animateP.byValue = @(2*M_PI);//一圈
    animateP.repeatCount = UID_MAX;
    animateP.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    [layerP addAnimation:animateP forKey:@"layer"];
    
    
    //中间第二个
    CALayer *layerG= [self createLayerRadius:45 startAngle:M_PI*0.8 andPos:center withColor:[UIColor greenColor]];
    [view.layer addSublayer:layerG];
    CABasicAnimation *animateG = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animateG.byValue = @(M_PI*0.5);
    animateG.duration = 1;
    animateG.autoreverses = YES;
    animateG.repeatCount = UID_MAX;
    animateG.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [layerG addAnimation:animateG forKey:@"layer"];
    
    //最里面
    CALayer *layerE= [self createLayerRadius:30 startAngle:0 andPos:center withColor:[UIColor grayColor]];
    [view.layer addSublayer:layerE];
    CABasicAnimation *animateE = [self createAnimationFrom:4*M_PI/3  andDuration:2 withR:1 clockwise:YES];
    animateE.timingFunction = nil;//没有特效
    [layerE addAnimation:animateE forKey:@"layer"];
}

- (CABasicAnimation*)createAnimationFrom:(CGFloat) startValue
                             andDuration:(NSInteger) duration
                                   withR:(NSInteger) count{
    return [self createAnimationFrom:startValue andDuration:duration withR:count clockwise:NO];
    
}
- (CABasicAnimation*)createAnimationFrom:(CGFloat) startValue
                             andDuration:(NSInteger) duration
                                   withR:(NSInteger) count
                               clockwise:(BOOL) wise{
    CABasicAnimation *animate = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animate.duration = duration;
    animate.repeatCount = UID_MAX;
    animate.fromValue = [NSNumber numberWithFloat:startValue];
    if (wise) {
        animate.toValue = @(- 2*M_PI*count + startValue);
    }else{
        animate.toValue = @(2*M_PI*count + startValue);
    }
    
    animate.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    return animate;
}


- (CALayer*)createLayerRadius:(CGFloat) boardWidth startAngle:(CGFloat) angle andPos:(CGPoint) point withColor:(UIColor*) color {
    
    CAShapeLayer *lineLayer = [CAShapeLayer layer];
    
    
    [lineLayer setFrame:CGRectMake(0, 0, boardWidth, boardWidth)];
    lineLayer.position = point;
    lineLayer.lineWidth = 4.0f;
    lineLayer.strokeColor = [color CGColor];
    //    lineLayer.backgroundColor = [UIColor whiteColor].CGColor;
    UIBezierPath *parh = [UIBezierPath bezierPathWithArcCenter:CGPointMake(boardWidth/2, boardWidth/2)
                                                        radius:boardWidth/2
                                                    startAngle:angle
                                                      endAngle:M_PI + angle
                                                     clockwise:YES];
    
    lineLayer.path = parh.CGPath;
    
    return lineLayer;
}
@end
