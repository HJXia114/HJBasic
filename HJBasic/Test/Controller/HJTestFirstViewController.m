//
//  HJTestFirstViewController.m
//  HJBasic
//
//  Created by a-375 on 2017/12/7.
//  Copyright © 2017年 a-375. All rights reserved.
//

#import "HJTestFirstViewController.h"
#import "HJCircleView.h"


@interface HJTestFirstViewController ()
@property (nonatomic,strong) HJCircleView *circleView;
@property (nonatomic,strong) CAShapeLayer *shapeLayer;

@end

@implementation HJTestFirstViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
//    self.shapeLayer.frame = self.view.bounds;
//    self.view.layer.mask = self.shapeLayer;
    
    
}
-(CAShapeLayer *)shapeLayer {
    if (!_shapeLayer) {
        _shapeLayer = [CAShapeLayer layer];
        _shapeLayer.fillColor = [UIColor blackColor].CGColor;
        _shapeLayer.strokeColor = [UIColor redColor].CGColor;
        _shapeLayer.lineWidth = 5.0;
        _shapeLayer.lineCap = kCALineCapRound;
        _shapeLayer.lineJoin = kCALineJoinRound;
        
        
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:self.view.center
                                                            radius:50
                                                        startAngle:M_PI * 0.01
                                                          endAngle:M_PI * 1.5
                                                         clockwise:YES];
        _shapeLayer.path = path.CGPath;
    }
    return _shapeLayer;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self NSScannerTest];
    [self test];
}

- (void)NSScannerTest {
    NSString *bananas = @"137 small cases of bananas";
    NSString *separatorString = @" of";
    NSScanner *aScanner = [NSScanner scannerWithString:bananas];
    NSInteger anInteger;
    [aScanner scanInteger:&anInteger];
    NSString *container;
    [aScanner scanUpToString:separatorString intoString:&container];
    NSLog(@"container = %@",container);

    NSString *product;
    //上一次扫描到15 的位置,所以[aScanner scanLocation] = 15
    product = [[aScanner string] substringFromIndex:[aScanner scanLocation]];
    
    
    NSString *string = @"Product: Acme Potato Peeler; Cost: 0.98 73\n\
Product: Chef Pierre Pasta Fork; Cost: 0.75 19\n\
Product: Chef Pierre Colander; Cost: 1.27 2\n";

    NSCharacterSet *semicolonSet;
    NSScanner *theScanner;

    NSString *PRODUCT = @"Product:";
    NSString *COST = @"Cost:";

    NSString *productName;
    float productCost;
    NSInteger productSold;

    semicolonSet = [NSCharacterSet characterSetWithCharactersInString:@";"];
    theScanner = [NSScanner scannerWithString:string];

    while ([theScanner isAtEnd] == NO)

    {
        if ([theScanner scanString:PRODUCT intoString:NULL]//扫描 PRODUCT 不保存
            &&

            [theScanner scanUpToCharactersFromSet:semicolonSet

                                       intoString:&productName] // 接着上面的PRODUCT之后 扫描到 semicolonSet(即分号)前面的字符
            &&

            [theScanner scanString:@";" intoString:NULL]//扫描 分号 不保存
            &&

            [theScanner scanString:COST intoString:NULL]//扫描 COST 不保存
            &&

            [theScanner scanFloat:&productCost]//扫描float类型
            &&

            [theScanner scanInteger:&productSold]) //扫描integer类型

        {

            NSLog(@"Sales of %@: $%1.2f", productName, productCost * productSold);

        }

    }
    
}

/*
 ／／NSCanner下面的属性和方法
 @property (readonly, copy) NSString *string;／／scanner类型转换成字符串类型
 @property NSUInteger scanLocation;//设置开始扫描的位置
 @property (nullable, copy) NSCharacterSet *charactersToBeSkipped;//扫描的时候需要忽略的值
 @propertyBOOL caseSensitive;//是否区分大小写
 @property (nullable, retain)id locale;
 
 - (instancetype)initWithString:(NSString *)string;
 
 
 ／／NSCanner分类中的属性和方法：
 - (BOOL)scanInt:(nullableint *)result;／／扫描int类型,并且赋值给result类型
 - (BOOL)scanInteger:(nullableNSInteger *)result;／／扫描integer类型
 - (BOOL)scanLongLong:(nullablelong long *)result;
 - (BOOL)scanUnsignedLongLong:(nullableunsigned longlong *)result ;
 - (BOOL)scanFloat:(nullablefloat *)result;
 - (BOOL)scanDouble:(nullabledouble *)result;
 - (BOOL)scanHexInt:(nullableunsigned *)result;                                         // Optionally prefixed with "0x" or "0X"
 - (BOOL)scanHexLongLong:(nullableunsigned longlong *)result;  // Optionally prefixed with "0x" or "0X"
 - (BOOL)scanHexFloat:(nullablefloat *)result;                  // Corresponding to %a or %A formatting. Requires "0x" or "0X" prefix.
 - (BOOL)scanHexDouble:(nullabledouble *)result;                // Corresponding to %a or %A formatting. Requires "0x" or "0X" prefix.
 
 - (BOOL)scanString:(NSString *)string intoString:(NSString *_Nullable * _Nullable)result;//从scan中扫描出string放入result中，如果不需要存储string，则result传NULL
 - (BOOL)scanCharactersFromSet:(NSCharacterSet *)set intoString:(NSString * _Nullable * _Nullable)result;//从scan中扫描出string放入result中，如果不需要存储string，则result传NULL
 
 - (BOOL)scanUpToString:(NSString *)string intoString:(NSString *_Nullable * _Nullable)result;//从scan中扫描出string之外的数据放入result中，如果不需要存储string，则result传NULL
 - (BOOL)scanUpToCharactersFromSet:(NSCharacterSet *)set intoString:(NSString * _Nullable * _Nullable)result;//从scan中扫描出set之外的数据放入result中，如果不需要存储string，则result传NULL
 
 @property (getter=isAtEnd,readonly) BOOL atEnd;//是否扫描到了结尾；
 
 + (instancetype)scannerWithString:(NSString *)string;／／初始化一个scanner
 + (id)localizedScannerWithString:(NSString *)string;／／初始化一个scanner
 

 */

- (void)test {
    self.circleView = [[HJCircleView alloc] initWithFrame:CGRectMake(100, 300, 100, 100)];
    [self.view addSubview:self.circleView];
}

@end
