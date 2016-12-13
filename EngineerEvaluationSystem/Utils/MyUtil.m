//
//  MyUtil.m
//  SohuByObject_C
//
//  Created by lixu on 16/11/7.
//  Copyright © 2016年 lixu. All rights reserved.
//


#import "MyUtil.h"

@implementation MyUtil

+(UILabel*)createLabel:(CGRect)frame title:(NSString *)title font:(UIFont *)font textAlignment:(NSTextAlignment)textAlignment textColor:(UIColor *)textColor
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    if (nil != title) {
        label.text = title;
    }
    label.font = font;
    label.textColor = textColor;
    return label;
}
+(UIButton*)createBtn:(CGRect)frame bgImageName:(NSString *)bgImageName selectBgImageName:(NSString *)selectBgImageName highlighBgImageName:(NSString *)highlighBgImageName title:(NSString *)title target:(id)target action:(SEL)action
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    if (nil != bgImageName) {
        [btn setBackgroundImage:[UIImage imageNamed:bgImageName] forState:UIControlStateNormal];
    }
    if (nil != selectBgImageName) {
        [btn setBackgroundImage:[UIImage imageNamed:selectBgImageName] forState:UIControlStateSelected];
    }
    if (nil != highlighBgImageName) {
        [btn setBackgroundImage:[UIImage imageNamed:highlighBgImageName] forState:UIControlStateHighlighted];
    }
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return btn;
}
+(UIImageView*)createImageView:(CGRect)frame imageName:(NSString *)imageName
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    if (nil != imageName) {
        imageView.image = [UIImage imageNamed:imageName];
    }
    return imageView;
}
+(UITextField *)createTextField:(CGRect)frame placeHolder:(NSString *)placeHolder isSecury:(BOOL)isSecury
{
    UITextField *textField = [[UITextField alloc] initWithFrame:frame];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.secureTextEntry = isSecury;
    textField.placeholder = placeHolder;
    return textField;
}


+(UILabel *)createLabelFrame:(CGRect)frame title:(NSString *)title
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.text = title;
    return label;
}

+(UIButton *)createBtnFrame:(CGRect)frame type:(UIButtonType)type bgImageName:(NSString *)bgImageName title:(NSString *)title target:(id)target action:(SEL)action
{
    UIButton *btn = [UIButton buttonWithType:type];
    btn.frame = frame;
    [btn setBackgroundImage:[UIImage imageNamed:bgImageName] forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

+(UIImageView *)createImageViewFrame:(CGRect)frame imageName:(NSString *)imageName
{
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:frame];
    imgView.image = [UIImage imageNamed:imageName];
    return imgView;
}

@end

