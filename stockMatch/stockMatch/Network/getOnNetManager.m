
//
//  getOnNetManager.m
//  newApplicationNetWork
//
//  Created by 扶摇先生 on 2018/3/23.
//  Copyright © 2018年 扶摇先生. All rights reserved.
//

#import "getOnNetManager.h"
#import <AFNetworking.h>
#import "getOnCommonTools.h"
static getOnNetManager *netManager;

@implementation getOnNetManager
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        netManager = [super allocWithZone:zone];
    });
    return netManager;
}
+ (instancetype)shareManager {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        netManager = [[self alloc] init];
    });
    return netManager;
}
- (instancetype)init {
    self = [super init];
    if (self) {
        _manager = [AFHTTPSessionManager manager];
        _manager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];//[AFHTTPResponseSerializer serializer];
        AFSecurityPolicy *securityPolicy = [[AFSecurityPolicy alloc] init];
        [_manager setSecurityPolicy:securityPolicy];// text didn't start with array json
//        AFJSONResponseSerializer * responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
        
        _manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html", @"text/json", @"text/javascript",@"text/plain",@"image/png",nil];
//        NSLog(@"%@",_manager.responseSerializer );
    }
    return self;
}
- (id)mutableCopyWithZone:(NSZone *)zone {
    return netManager;
}
- (id)copyWithZone:(NSZone *)zone {
    return netManager;
}
- (NSString *)spellWithPathpage:(NSString *)page baseUrl:(NSString *)baseurl{
    NSMutableString *url = [NSMutableString stringWithFormat:@"%@%@",baseurl,page];
    return url;
}
- (void)getWithPathtype:(getOnNetUrlBuilderType)pathType pathPage:(NSString *)page succeed:(Success)success fail:(Failure)failure {
    NSString *token = @"";
    NSString *url = [getOnNetUrlBuilder urlWithPathType:pathType];
    
    NSMutableString *mutableUrl = [NSMutableString stringWithFormat:@"%@",[self spellWithPathpage:page baseUrl:url]];
    url = mutableUrl;
    NSLog(@"url --- %@",url);
    [[getOnNetManager shareManager].manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"progress -  %@",downloadProgress.localizedDescription);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSInteger code = [[responseObject objectForKey:@"code"] integerValue];
        NSString *msg = [NSString stringWithFormat:@"%@", [responseObject objectForKey:@"message"]];
        if ( code == 200) {
            success(1, [responseObject objectForKey:@"data"]);
        }else if(code == 404||code == 204){
            failure(code,msg);
        }else {
            failure(2,msg);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(0, error.description);
    }];
}
- (void)getWithPathtype:(getOnNetUrlBuilderType)pathType parameters:(NSDictionary *)parameters succeed:(Success)success fail:(Failure)failure {
    NSString *token = @"";
    NSString *url = [getOnNetUrlBuilder urlWithPathType:pathType];
    NSMutableString *mutableUrl = [NSMutableString stringWithFormat:@"%@",[self baseUrl:url path:nil parameters:parameters token:token]];
    url = mutableUrl;
    NSLog(@"url --- %@",url);
    [[getOnNetManager shareManager].manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
       NSLog(@"progress -  %@",downloadProgress.localizedDescription);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSInteger code = [[responseObject objectForKey:@"code"] integerValue];
        NSString *msg = [NSString stringWithFormat:@"%@", [responseObject objectForKey:@"message"]];
        if ( code == 200) {
            success(1, [responseObject objectForKey:@"data"]);
        }else if(code == 404||code == 204){
            failure(code,msg);
        }else {
            failure(2,msg);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(0, error.description);
    }];
}
- (void)postWithPathType:(getOnNetUrlBuilderType)pathType form:(NSDictionary *)form succeed:(Success)success fail:(Failure)failure {
    NSString *url = [getOnNetUrlBuilder urlWithPathType:pathType];
    NSMutableString *mutableUrl = [NSMutableString stringWithFormat:@"%@",[self baseUrl:url path:nil parameters:nil token:nil]];
    url = mutableUrl;
    NSLog(@"url --- %@",url);
    weakenSelf
    [[getOnNetManager shareManager].manager POST:url parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [weakSelf generateFormData:formData data:form];

    } progress:^(NSProgress * _Nonnull uploadProgress) {

    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSInteger code = [[responseObject objectForKey:@"code"] integerValue];
        NSString *msg = [NSString stringWithFormat:@"%@", [responseObject objectForKey:@"message"]];
        if ( code == 200) {
            success(1, [responseObject objectForKey:@"data"]);
        }else if(code == 404||code == 204){
            failure(code,msg);
        }else {
            failure(2,msg);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(0, error.description);
    }];
}
- (void)generateFormData:(id<AFMultipartFormData>)formData data:(NSDictionary *)data {
    if ([data isKindOfClass:[NSDictionary class]]) {
        for (NSString *key in data) {
            id value = [data valueForKey:key];
            if ([value isKindOfClass:[NSDictionary class]]) {
                [self generateFormData:formData data:value];
            } else if ([value isKindOfClass:[NSString class]]) {
                [formData appendPartWithFormData:[value dataUsingEncoding:NSUTF8StringEncoding] name:key];
                
            } else if ([value isKindOfClass:[NSData class]]) {
                if ([key containsString:@"."]) {
                    NSArray *array = [key componentsSeparatedByString:@"."];
                    if ([array.lastObject isEqualToString:@"png"] || [array.lastObject isEqualToString:@"jpg"] || [array.lastObject isEqualToString:@"jpeg"] || [array.lastObject isEqualToString:@"m4a"]) {
                        NSArray *typeArray = [[getOnCommonTools mineTypeWithData:value] componentsSeparatedByString:@"/"];
                        NSString *fileName = [NSString stringWithFormat:@"%@.%@",[getOnCommonTools uniqueString],[typeArray lastObject]];
                        [formData appendPartWithFileData:value name:array[0] fileName:fileName mimeType:[getOnCommonTools mineTypeWithData:value]];
                    }
                } else {
                    [formData appendPartWithFormData:value name:key];
                }
            } else if ([value isKindOfClass:[NSArray class]]) {
                if ([[value objectAtIndex:0] isKindOfClass:[UIImage class]]) {
                    NSData *imageData ;
                    NSInteger a = 1;
                    
                    for (UIImage *image in value) {
                        if (UIImagePNGRepresentation(image) == nil) {
                            imageData = UIImageJPEGRepresentation(image, 1);
                        }else {
                            imageData = UIImagePNGRepresentation(image);
                        }
                        [formData appendPartWithFileData:imageData name:key fileName:[NSString stringWithFormat:@"%@%ld.jpg",[getOnCommonTools uniqueString],a] mimeType:@"image/jpg"];
                        a ++;
                    }
                }else {
                    NSInteger i= 0;
                    for (NSString *stringValue in value) {
                        NSLog(@"woshi%ld---%@",i,stringValue);
                        [formData appendPartWithFormData:[stringValue dataUsingEncoding:NSUTF8StringEncoding] name:key];
                        i ++;
                    }
                }
            }else if ([value isKindOfClass:[UIImage class]]){//上传图片
                NSData *imageData;
                UIImage *image = (UIImage *)value;
                if (UIImagePNGRepresentation(image) == nil) {
                    imageData = UIImageJPEGRepresentation(image, 1);
                }else {
                    imageData = UIImagePNGRepresentation(image);
                }
                [formData appendPartWithFileData:imageData name:key fileName:[NSString stringWithFormat:@"%@.jpg",[getOnCommonTools uniqueString]] mimeType:@"image/jpg"];
            }else {
                if ([value respondsToSelector:@selector(stringValue)]) {
                    [formData appendPartWithFormData:[[value stringValue] dataUsingEncoding:NSUTF8StringEncoding] name:key];
                } else if ([value respondsToSelector:@selector(dataUsingEncoding:)]) {
                    [formData appendPartWithFormData:[value dataUsingEncoding:NSUTF8StringEncoding] name:key];
                }
            }
        }
    }
}
- (NSString *)baseUrl:(NSString *)baseUrl path:(NSString *)path parameters:(NSDictionary *)parameters token:(NSString *)token {
    NSMutableString *url = [[NSMutableString alloc] initWithFormat:@"%@",baseUrl];
    if (path != nil) {
        [url appendString: path];
    }
    if (parameters != nil) {
        [url appendString:@"?"];
        for (NSString *key in parameters) {
            NSString *value = [parameters valueForKey:key];
            [url appendString:[NSString stringWithFormat:@"%@=%@&", key, value]];
        }
        url = [[NSMutableString alloc]initWithFormat:@"%@",[url substringWithRange:NSMakeRange(0, url.length - 1)]];
    }
    if (token != nil) {
        [url appendString:token];
    }
    return url;
}
@end
