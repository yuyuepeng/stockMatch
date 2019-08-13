//
//  getOnCommonTools.h
//  getOn
//
//  Created by 扶摇先生 on 2018/4/11.
//  Copyright © 2018年 扶摇先生. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface getOnCommonTools : NSObject

+ (NSDictionary *)getWithJsonFileName:(NSString *)fileName;
/**
 根据当前类的tableView的indexPath返回UItableViewcell

 @param indexPath indexPath
 @param class 类名
 @param tableView tableView
 @return cell
 */
//+ (UITableViewCell *)cellWithIndexPath:(NSIndexPath *)indexPath class:(Class )class tableView:(UITableView *)tableView;
+ (CGFloat)getHeightLineWithString:(NSString *)string withWidth:(CGFloat)width withFont:(UIFont *)font;
/**
 根据富文本的字符串返回删除格式符的富文本

 @param html 富文本的字符串
 @return 删除格式符的富文本
 */
+ (NSString *)flattenHTML:(NSString *)html;
+ (NSString *)uniqueString;
+ (NSString *)mineTypeWithData:(NSData *)data ;

/**
 根据颜色返回图片

 @param color 颜色
 @return 图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color;


/**
 返回是不是手机号

 @param phoneNum <#phoneNum description#>
 @return <#return value description#>
 */
+ (BOOL)isPhoneNum:(NSString *)phoneNum;

/**
 返回是否数字

 @param string <#string description#>
 @return <#return value description#>
 */
+ (BOOL)isPureInt:(NSString *)string;

/**
 返回URLencode字符串

 @param unencodedString <#unencodedString description#>
 @return <#return value description#>
 */
+ (NSString*)encodeString:(NSString*)unencodedString;

/**
 打电话反应慢

 @param phoneStr <#phoneStr description#>
 @param selfvc <#selfvc description#>
 */
+ (void)callPhoneStr:(NSString*)phoneStr withVC:(UIViewController *)selfvc;

+ (void)makeToast:(NSString *)toast ViewController:(UIViewController *)viewcController code:(NSInteger)code;

@end
