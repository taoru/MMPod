//

//  TripEnviroment.h
//  Trip2013
//
//  Created by Ryou Zhang on 7/18/13.
//  Copyright (c) 2013 alibaba. All rights reserved.
//

//#import "UIColor+Taobao.h"

#define TRIP_UI_DEBUG_MODE    0

#define iPad       UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad
#define isRetina   ([[UIScreen mainScreen] scale] == 2.0)
#define iPhone5    ([UIScreen instancesRespondToSelector:@selector( currentMode )] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#define iOSVersion ([[[UIDevice currentDevice] systemVersion] floatValue])
#define iOSVersionEqualTo(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define iOSVersionGreaterThan(v)          ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define iOSVersionGreaterThanOrEqualTo(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define iOSVersionLessThan(v)             ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define iOSVersionLessThanOrEqualTo(v)    ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

#define DEVICE_MODEL    ([[UIDevice currentDevice] model])

#define degreesToRadians(x)               (M_PI * (x) / 180.0)

#define ONEPIX (1.0/[UIScreen mainScreen].scale)

#define NSGBKStringEncoding         CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000)

#define UI_NAVIGATION_BAR_HEIGHT    (iOSVersionGreaterThanOrEqualTo(@"7")?70:50)
#define UI_NAVIGATION_BAR_INNER_HEIGHT   50
#define UI_NAVIGATION_BAR_BG_HEIGHT (57+20)
#define UI_TOWSTATE_NAVIGATION_HEIGHT 45
#define UI_NAVIGATION_BUTTON_SIZE   CGSizeMake(32, 32)
#define TBBACKGROUNDCOLOR           [UIColor colorWithRed:0xf1 / 255.0f green:0xf1 / 255.0f blue:0xf1 / 255.0f alpha:1.0]

#define TRIP_VIEW_WIDTH             320
#define TRIP_TAB_BAR_HEIGHT         55
#define TRIP_BOTTOM_BAR_HEIGHT      57

#define DEVICE_ID           [UTDevice utdid]

#if TRIPTEST||TRIPRELEASETEST
    #define MTOP_DEVICE_ID      @"mtop_device_id@test"
    #define APPLE_PUSH_TOKEN    @"apple_push_token@test"
    #define AGOO_PUSH_KEY       @"agoo_push_key@test"
    #define AGOO_APP_INFO       @"agoo_app_ver@test"
    #define AGOO_USER_KEY       @"agoo_user_key@test"
#elif TRIPPREPARE||TRIPRELESASEPREPARE
    #define MTOP_DEVICE_ID      @"mtop_device_id@prepare"
    #define APPLE_PUSH_TOKEN    @"apple_push_token@prepare"
    #define AGOO_PUSH_KEY       @"agoo_push_key@prepare"
    #define AGOO_APP_INFO       @"agoo_app_ver@prepare"
    #define AGOO_USER_KEY       @"agoo_user_key@prepare"
#else
    #define MTOP_DEVICE_ID      @"mtop_device_id"
    #define APPLE_PUSH_TOKEN    @"apple_push_token"
    #define AGOO_PUSH_KEY       @"agoo_push_key"
    #define AGOO_APP_INFO       @"agoo_app_ver"
    #define AGOO_USER_KEY       @"agoo_user_key"
#endif

// Font & Color
#define HiraginoSansGBFont(fontSize)        [UIFont fontWithName : @"STHeitiSC-Light" size : fontSize]
#define TRIPHiraKakuBlodFont(fontSize)      [UIFont fontWithName : @"HiraKakuProN-W6" size : fontSize]
#define TRIPHeitiSCFont(fontSize)           [UIFont fontWithName : @"STHeitiSC-Light" size : fontSize]
#define TRIPHeitiSCBlodFont(fontSize)       [UIFont fontWithName : @"STHeitiSC-Medium" size : fontSize]
#define TRIPHelveticaNeueFont(fontSize)     [UIFont fontWithName : @"HelveticaNeue" size : fontSize]
#define TRIPHelveticaNeueBlodFont(fontSize) [UIFont fontWithName : @"HelveticaNeue-Bold" size : fontSize]

/*
#define TRIPDeftBGColor            [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_flights_index_gray.png"]]
#define TRIPDarkBlue               [UIColor colorWithHexString:@"#2b577a"]
#define TRIPHighDarkBlue           [UIColor colorWithHexString:@"#27313f"]
#define TRIPLightBlue              [UIColor colorWithHexString:@"#c3e7fe"]
#define TRIPSearchBlue             [UIColor colorWithHexString:@"#2eb7fa"]
#define TRIPCalendarBlue           [UIColor colorWithHexString:@"#466a86"]
#define TRIPCalendarDayBlue        [UIColor colorWithHexString:@"#4DABF0"]
#define TRIPCalendarHolidayBlue    [UIColor colorWithHexString:@"#669dcb"]
#define TRIPCalendarRed            [UIColor colorWithHexString:@"#ff5619"]


#define TRIPCalendarGray           [UIColor colorWithHexString:@"#BECAD1"]
#define TRIPPlaceHolderGray        [UIColor colorWithHexString:@"#bfc9d6"]
#define TRIPWhite                  [UIColor colorWithHexString:@"#ffffff"]
#define TRIPLightGray              [UIColor colorWithHexString:@"#94acc6"]
#define TRIPBlack                  [UIColor colorWithHexString:@"#000000"]
#define TRIPTabGray                [UIColor colorWithHexString:@"#becbdb"]
#define TRIPLabelGray              [UIColor colorWithHexString:@"#8a9ca8"]
#define TRIPLabelBlue              [UIColor colorWithHexString:@"#4aa1e1"]
#define TRIPRED                    [UIColor colorWithHexString:@"#ff5b45"]
#define TRIPCellGray               [UIColor colorWithHexString:@"#fdfdfd"]
#define TRIPFilterGray             [UIColor colorWithHexString:@"#eaebf0"]
#define TRIPFilterLineWhite        [UIColor colorWithHexString:@"#f3f3f6"]
#define TRIPFilterLineGray         [UIColor colorWithHexString:@"#d6d8e0"]
#define TRIPNaviTitleColor         [UIColor colorWithHexString:@"#13334d"]
#define TRIPPriceColor             [UIColor colorWithHexString:@"#ff5b45"]
#define TRIPCellDarkGrayColor      [UIColor colorWithHexString:@"#edeef2"]
#define TRIPCellSeperatorColor     [UIColor colorWithHexString:@"#d3dde3"]
#define TRIPCellDarkSeperatorColor [UIColor colorWithHexString:@"#c1c3cf"]
#define TRIPCalendarHeaderColor    [UIColor colorWithHexString:@"#fafafa"]
#define TRIPCalendarDisableColor   [UIColor colorWithHexString:@"#e2e4eb"]
#define TRIPCellHighLightColor     [UIColor colorWithHexString:@"#e2e5e8"]
#define TRIPCellButtonColor        [UIColor colorWithHexString:@"#697d91"]
#define TRIPBottomTitleColor       [UIColor colorWithHexString:@"#becbdb"]
#define TRIPLineColor              [UIColor colorWithHexString:@"#f0f0f0"]
#define TRIPPassengerNameColor     [UIColor colorWithHexString:@"#4ba6e2"]
#define TRIPPassBookColor          [UIColor colorWithHexString:@"#AEBED0"]
#define TRIPCancelButtonColor      [UIColor colorWithHexString:@"#708398"]
#define TRIPCellSelectColor        [UIColor colorWithHexString:@"#e0e1e7"]
#define TRIPHEADSELECTCOLOR        [UIColor colorWithHexString:@"#e4e5eb"]
#define TRIPDISABLEDCOLOR          [UIColor colorWithHexString:@"#d5d8e5"]
#define TRIPCellSelectedColor      [UIColor colorWithHexString:@"#7bbff0"]
#define TRIPShadowColor            [UIColor colorWithRed:0x00/255.0 green:0x00/255.0 blue:0x00/255.0 alpha:0.15]
#define TRIPWhiteShadowColor       [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.75]
#define TRIPBGMaskColor            [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.65]
#define TRIPCellBoundsColor        [UIColor colorWithHexString:@"#dcdcdc"]
#define TRIPTableViewBgColor       [UIColor colorWithHexString:@"#F9F9FB"]
#define TRIPTableViewIndexColor    [UIColor colorWithHexString:@"#999999"]
#define TRIPOrangeColor            [UIColor colorWithHexString:@"#e6ff5b45"]
#define TRIPCitySeparateColor      [UIColor colorWithHexString:@"#e5eaee"]
#define TRIPCombineBackColor       [UIColor colorWithHexString:@"#566377"]
#define TRIPHotelDayCountColor     [UIColor colorWithHexString:@"#33cbaf"]
#define TRIPFLIGHTCABINColor       [UIColor colorWithHexString:@"#81939e"]
#define TRIPHotelCellGrayBGColor   [UIColor colorWithHexString:@"#f9f9f9"]
#define TRIPHotelNoHistoryColor    [UIColor colorWithHexString:@"#ced4dc"]
#define TRIPHotelHistoryPointColor          [UIColor colorWithHexString:@"#abbac3"]
#define TRIPHotelHistoryLabelColor          [UIColor colorWithHexString:@"#b9c1c6"]
#define TRIPHotelHistoryClearColor          [UIColor colorWithHexString:@"#6e8699"]
#define TRIPHotelHistoryClearBorderColor    [UIColor colorWithHexString:@"#e7eaec"]
*/

#define TRIPCardCornerRadius      3.0

typedef void(^BKSenderBlock)(id sender);

typedef NS_ENUM (NSInteger, TRIPCertification) {
    TRIPCertificationIdcard = 0,    // 身份证
    TRIPCertificationPassport,      // 护照
    TRIPCertificationStudentcard,   // 学生证
    TRIPCertificationMilitarycard,  // 军官证
    TRIPCertificationGohomecard,    // 回乡证
    TRIPCertificationTaiwancard,    // 台胞证
    TRIPCertificationHkmacaocard,   // 港澳通行证
    TRIPCertificationSeamencard,    // 国际海员
    TRIPCertificationForeignercard, // 外国人永久居留证
    TRIPCertificationOthercard,     // 其他证件
    TRIPCertificationPolicecard,    // 警官证
    TRIPCertificationSoldiercard    // 士兵证
};

#define TAG_LOADING_ANIMATION_A_VIEW 0x123401
#define TAG_INFORMATION_VIEW 0x123402
#define TAG_TIPS_VIEW 0x123403
#define TAG_TIPS_TEXTVIEW 0x123404


