//
//  CustomViews.h
//  FyresiteCheckin
//
//  Created by Travis on 9/1/17.
//  Copyright © 2017 Fyresite. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <BFPaperButton.h>

@interface CustomViews : NSObject

+(UIImageView*)customImageView:(NSString*)imageString;
+(void)addShadowToView:(UIView*)view options:(NSDictionary *)options;
+(UIView*)coloredDot:(UIColor*)color;
+(UILabel *)customLabel:(NSString*)text options:(NSDictionary*)options;
+(BFPaperButton *)BFSquareBtn:(NSDictionary *)options;

@end

//Fonts
#define FONTROBOTOLIGHT @"Roboto-Light"
#define FONTROBOTOITALIC @"Roboto-Italic"
#define FONTROBOTOMD @"Roboto-Medium"
#define FONTROBOTOBOLD @"Roboto-Bold"

//Sizes
#define FONTXXSMALL 8.0f
#define FONTSIZETEN 10.0f
#define FONTXSMALL 12.0f
#define FONTSMALL 14.0f
#define FONTXXMDM 18.0f
#define FONTXMDM 20.0f
#define FONTLARGE 36.0f


//Color from RGB
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//Pink colors
#define TDPink50 UIColorFromRGB(0xFCE4EC)
#define TDPink100 UIColorFromRGB(0xF8BBD0)
#define TDPink200 UIColorFromRGB(0xF48FB1)
#define TDPink300 UIColorFromRGB(0xF06292)
#define TDPink400 UIColorFromRGB(0xEC407A)
#define TDPink500 UIColorFromRGB(0xE91E63)
#define TDPink600 UIColorFromRGB(0xD81B60)
#define TDPink700 UIColorFromRGB(0xE91E63)
#define TDPink800 UIColorFromRGB(0xAD1457)
#define TDPink900 UIColorFromRGB(0x880E4F)

//RedOrange
#define TDRedOrange50 UIColorFromRGB(0xF44336)
#define TDRedOrange100 UIColorFromRGB(0xFFEBEE)
#define TDRedOrange200 UIColorFromRGB(0xFFCDD2)
#define TDRedOrange300 UIColorFromRGB(0xE57373)
#define TDRedOrange400 UIColorFromRGB(0xEF5350)
#define TDRedOrange500 UIColorFromRGB(0xF44336)
#define TDRedOrange600 UIColorFromRGB(0xE53935)
#define TDRedOrange700 UIColorFromRGB(0xD32F2F)
#define TDRedOrange800 UIColorFromRGB(0xC62828)
#define TDRedOrange900 UIColorFromRGB(0xB71C1C)

//Purple
#define TDPurple50 UIColorFromRGB(0xF44336)
#define TDPurple100 UIColorFromRGB(0xF3E5F5)
#define TDPurple200 UIColorFromRGB(0xE1BEE7)
#define TDPurple300 UIColorFromRGB(0xBA68C8)
#define TDPurple400 UIColorFromRGB(0xAB47BC)
#define TDPurple500 UIColorFromRGB(0x9C27B0)
#define TDPurple600 UIColorFromRGB(0xBA68C8)
#define TDPurple700 UIColorFromRGB(0x7B1FA2)
#define TDPurple800 UIColorFromRGB(0x6A1B9A)
#define TDPurple900 UIColorFromRGB(0x4A148C)


//DeepPurple
#define TDDeepPurple50 UIColorFromRGB(0xEDE7F6)
#define TDDeepPurple100 UIColorFromRGB(0xD1C4E9)
#define TDDeepPurple200 UIColorFromRGB(0xB39DDB)
#define TDDeepPurple300 UIColorFromRGB(0x9575CD)
#define TDDeepPurple400 UIColorFromRGB(0x7E57C2)
#define TDDeepPurple500 UIColorFromRGB(0x673AB7)
#define TDDeepPurple600 UIColorFromRGB(0x5E35B1)
#define TDDeepPurple700 UIColorFromRGB(0x512DA8)
#define TDDeepPurple800 UIColorFromRGB(0x4527A0)
#define TDDeepPurple900 UIColorFromRGB(0x311B92)

//Indigo
#define TDIndigo50 UIColorFromRGB(0xE8EAF6)
#define TDIndigo100 UIColorFromRGB(0xC5CAE9)
#define TDIndigo200 UIColorFromRGB(0x9FA8DA)
#define TDIndigo300 UIColorFromRGB(0x7986CB)
#define TDIndigo400 UIColorFromRGB(0x5C6BC0)
#define TDIndigo500 UIColorFromRGB(0x3F51B5)
#define TDIndigo600 UIColorFromRGB(0x3949AB)
#define TDIndigo700 UIColorFromRGB(0x303F9F)
#define TDIndigo800 UIColorFromRGB(0x283593)
#define TDIndigo900 UIColorFromRGB(0x1A237E)

//Blue
#define TDBlue50 UIColorFromRGB(0xE3F2FD)
#define TDBlue100 UIColorFromRGB(0xBBDEFB)
#define TDBlue200 UIColorFromRGB(0x0CAF9)
#define TDBlue300 UIColorFromRGB(0x64B5F6)
#define TDBlue400 UIColorFromRGB(0x42A5F5)
#define TDBlue500 UIColorFromRGB(0x2196F3)
#define TDBlue600 UIColorFromRGB(0x1E88E5)
#define TDBlue700 UIColorFromRGB(0x1976D2)
#define TDBlue800 UIColorFromRGB(0x1565C0)
#define TDBlue900 UIColorFromRGB(0x0D47A1)


//LightBlue
#define TDLightBlue50 UIColorFromRGB(0xE1F5FE)
#define TDLightBlue100 UIColorFromRGB(0xB3E5FC)
#define TDLightBlue200 UIColorFromRGB(0x81D4FA)
#define TDLightBlue300 UIColorFromRGB(0x4FC3F7)
#define TDLightBlue400 UIColorFromRGB(0x29B6F6)
#define TDLightBlue500 UIColorFromRGB(0x03A9F4)
#define TDLightBlue600 UIColorFromRGB(0x039BE5)
#define TDLightBlue700 UIColorFromRGB(0x0288D1)
#define TDLightBlue800 UIColorFromRGB(0x0277BD)
#define TDLightBlue900 UIColorFromRGB(0x01579B)

//Cyan
#define TDCyan50 UIColorFromRGB(0xE0F7FA)
#define TDCyan100 UIColorFromRGB(0xB2EBF2)
#define TDCyan200 UIColorFromRGB(0x80DEEA)
#define TDCyan300 UIColorFromRGB(0x4DD0E1)
#define TDCyan400 UIColorFromRGB(0x26C6DA)
#define TDCyan500 UIColorFromRGB(0x00BCD4)
#define TDCyan600 UIColorFromRGB(0x00ACC1)
#define TDCyan700 UIColorFromRGB(0x0097A7)
#define TDCyan800 UIColorFromRGB(0x00838F)
#define TDCyan900 UIColorFromRGB(0x006064)
//Teal
#define TDTeal50 UIColorFromRGB(0xE0F2F1)
#define TDTeal100 UIColorFromRGB(0xB2DFDB)
#define TDTeal200 UIColorFromRGB(0x80CBC4)
#define TDTeal300 UIColorFromRGB(0x4DB6AC)
#define TDTeal400 UIColorFromRGB(0x26A69A)
#define TDTeal500 UIColorFromRGB(0x009688)
#define TDTeal600 UIColorFromRGB(0x00897B)
#define TDTeal700 UIColorFromRGB(0x00796B)
#define TDTeal800 UIColorFromRGB(0x00695C)
#define TDTeal900 UIColorFromRGB(0x004D40)

//GReen
#define TDGreen50 UIColorFromRGB(0xE8F5E9)
#define TDGreen100 UIColorFromRGB(0xC8E6C9)
#define TDGreen200 UIColorFromRGB(0xA5D6A7)
#define TDGreen300 UIColorFromRGB(0x81C784)
#define TDGreen400 UIColorFromRGB(0x66BB6A)
#define TDGreen500 UIColorFromRGB(0x4CAF50)
#define TDGreen600 UIColorFromRGB(0x43A047)
#define TDGreen700 UIColorFromRGB(0x388E3C)
#define TDGreen800 UIColorFromRGB(0x2E7D32)
#define TDGreen900 UIColorFromRGB(0x1B5E20)

//Amber
#define TDAmber50 UIColorFromRGB(0xFFF8E1)
#define TDAmber100 UIColorFromRGB(0xFFECB3)
#define TDAmber200 UIColorFromRGB(0xFFE082)
#define TDAmber300 UIColorFromRGB(0xFFD54F)
#define TDAmber400 UIColorFromRGB(0xFFCA28)
#define TDAmber500 UIColorFromRGB(0xFFC107)
#define TDAmber600 UIColorFromRGB(0xFFB300)
#define TDAmber700 UIColorFromRGB(0xFFA000)
#define TDAmber800 UIColorFromRGB(0xFF8F00)
#define TDAmber900 UIColorFromRGB(0xFF6F00)

//Orange
#define TDOrange50 UIColorFromRGB(0xFFF3E0)
#define TDOrange100 UIColorFromRGB(0xFFE0B2)
#define TDOrange200 UIColorFromRGB(0xFFCC80)
#define TDOrange300 UIColorFromRGB(0xFFB74D)
#define TDOrange400 UIColorFromRGB(0xFFA726)
#define TDOrange500 UIColorFromRGB(0xFF9800)
#define TDOrange600 UIColorFromRGB(0xFB8C00)
#define TDOrange700 UIColorFromRGB(0xF57C00)
#define TDOrange800 UIColorFromRGB(0xEF6C00)
#define TDOrange900 UIColorFromRGB(0xE65100)

//DeepOrange
#define TDDeepOrange50 UIColorFromRGB(0xFBE9E7)
#define TDDeepOrange100 UIColorFromRGB(0xFFCCBC)
#define TDDeepOrange200 UIColorFromRGB(0xFFAB91)
#define TDDeepOrange300 UIColorFromRGB(0xFF8A65)
#define TDDeepOrange400 UIColorFromRGB(0xFF7043)
#define TDDeepOrange500 UIColorFromRGB(0xFF5722)
#define TDDeepOrange600 UIColorFromRGB(0xF4511E)
#define TDDeepOrange700 UIColorFromRGB(0xE64A19)
#define TDDeepOrange800 UIColorFromRGB(0xD84315)
#define TDDeepOrange900 UIColorFromRGB(0xBF360C)

//Grey
#define TDGrey50 UIColorFromRGB(0xFAFAFA)
#define TDGrey100 UIColorFromRGB(0xF5F5F5)
#define TDGrey200 UIColorFromRGB(0xEEEEEE)
#define TDGrey300 UIColorFromRGB(0xE0E0E0)
#define TDGrey400 UIColorFromRGB(0xBDBDBD)
#define TDGrey500 UIColorFromRGB(0x9E9E9E)
#define TDGrey600 UIColorFromRGB(0x757575)
#define TDGrey700 UIColorFromRGB(0x616161)
#define TDGrey800 UIColorFromRGB(0x424242)
#define TDGrey900 UIColorFromRGB(0x212121)

//BlueGrey
#define TDBlueGrey50 UIColorFromRGB(0xECEFF1)
#define TDBlueGrey100 UIColorFromRGB(0xCFD8DC)
#define TDBlueGrey200 UIColorFromRGB(0xB0BEC5)
#define TDBlueGrey300 UIColorFromRGB(0x90A4AE)
#define TDBlueGrey400 UIColorFromRGB(0x78909C)
#define TDBlueGrey500 UIColorFromRGB(0x607D8B)
#define TDBlueGrey600 UIColorFromRGB(0x546E7A)
#define TDBlueGrey700 UIColorFromRGB(0x455A64)
#define TDBlueGrey800 UIColorFromRGB(0x37474F)
#define TDBlueGrey900 UIColorFromRGB(0x263238)
