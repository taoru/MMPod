//
//  TRIPConfigure.h
//  TBTrip
//
//#import "TRIPUT.h"
//#import "NSString+secertKey.h"
//发布前修改变量                   //@"201200@travel_iphone_3.0.0"

#define CLIENT_TYPE             1
#define GUIDEKEY [NSMutableString stringWithFormat:@"%@_guide",[self valueForKey:PAGE_NAME]]
#define TRIPTIMEZONE [NSTimeZone timeZoneForSecondsFromGMT:28800]
#define CLIENT_VERSION          [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
//#define TTID                    [NSString notifycationetravel]//[NSString stringWithFormat:@"201200@travel_iphone_%@",CLIENT_VERSION]

#define FIRSTRGUIDEKEY              @"trip_first_launch"

//移到TRIPHelpers
//网络请求统一要传递的参数
#define HTTP_GET_METHOD             @"GET"
#define HTTP_POST_METHOD            @"POST"

//服务器地址
#if TRIPTEST||TRIPRELEASETEST
    #define TRIPM_DOMAIN            @"trip.waptest.taobao.com/api/"
    #define MTOP_BASE_URL           @"http://api.waptest.taobao.com/gw/%@/%@/?%@"
//    #define MTOP_BASE_URL           @"http://10.32.84.21:8000/MockAPIServer/rest/api3.do"  //mock server
    #define MTOP_APP_KEY            @"607586"//@"4272"
    #define MTOP_APP_SECERT_KEY     @"3a031d0d0a01f77565465fd151f204e2"//@"0ebbcccfee18d7ad1aebc5b135ffa906"
    #define CLIENT_NAME             @"trip_daily"
    #define TBH5_LOGIN_URL          @"http://login.waptest.taobao.com/login.htm"
    #define TBH5_LOGOUT_URL         @"http://login.waptest.taobao.com/logout.htm"
    #define TBSDK_ENVIRONMENT       2//1:debug; 2:daily; 3:release
    #define BUNDLE_NAME             [(NSString *)[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"] stringByAppendingString:@"-测试包"]
    #define SNSID                   @"7000224655"
    #define API_HOME_MARKET_DATA    @"trip.taobao.com/market/bendi/1028.php"//运营位
    #define WAP_URL                 @"http://wapp.waptest.taobao.com"
    #define UMEAPPID                @"ume_bda2863b7eab4ca8a1164b022a30efad"
    #define UMEAPPKEY               @"dfb7845d95defbcd9e54dc0bfc0e83c9"
    #define UMEAPPSECKEY            @"3082030d308201f5a0030201020204"
    #define ALIPAY_BASE_URL         @"https://mobiletestabc.alipaydev.com/mobileclientgw/stable/gateway.do"
    #define HWS_WDETAIL_SERVICE_ADDRESS                     @"item.daily.taobao.net/modulet/v5/wdetailEsi.do"
    #define HDETAILSKIP_TICKET_SERVICE_ADDRESS              @"detailskip.daily.taobao.net/json/travel/travel_ifq.htm"
    #define SPECIAL_CREATORDER      @"wapp.waptest.taobao.com/trip/base/order.html"

#elif TRIPPREPARE||TRIPRELESASEPREPARE
    #define TRIPM_DOMAIN            @"tripm.waptest.taobao.com/api/"
    #define MTOP_BASE_URL           @"http://api.wapa.taobao.com/gw/%@/%@/?%@"
    #define MTOP_APP_KEY            @"12381755"
    #define MTOP_APP_SECERT_KEY     [NSString notifycatione39b]//@"03a230766fe1e39beb4b8703c8b3ff3f"
    #define CLIENT_NAME             @"trip_prepare"
    #define TBH5_LOGIN_URL          @"http://login.wapa.taobao.com/login.htm"
    #define TBH5_LOGOUT_URL         @"http://login.wapa.taobao.com/logout.htm"
    #define TBSDK_ENVIRONMENT        3//1:debug; 2:daily; 3:release
    #define BUNDLE_NAME             [(NSString *)[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"] stringByAppendingString:@"-预发包"]
    #define ALIPAY_BASE_URL         @"http://mclientpre.alipay.com/gateway.do"
    #define API_HOME_MARKET_DATA    @"trip.taobao.com/market/living/home.php"//运营位
    #define SNSID                   @"2063951746"//微旅行
    #define WAP_URL                 @"http://wapp.wapa.taobao.com"
    #define UMEAPPID                @"ume_bda2863b7eab4ca8a1164b022a30efad"
    #define UMEAPPKEY               @"dfb7845d95defbcd9e54dc0bfc0e83c9"
    #define UMEAPPSECKEY            @"3082030d308201f5a0030201020204"
    #define ALIPAY_BASE_URL         @"http://mclientpre.alipay.com/gateway.do"
    #define HWS_WDETAIL_SERVICE_ADDRESS                     @"hws.wapa.taobao.com/cache/wdetail/5.0/"
    #define HDETAILSKIP_TICKET_SERVICE_ADDRESS              @"detailskip.taobao.com/json/travel/travel_ifq.htm"
    #define SPECIAL_CREATORDER      @"wapp.wapa.taobao.com/trip/base/order.html"
#else
    #define TRIPM_DOMAIN            @"client.taobao.com/api/"
    #define MTOP_BASE_URL           @"https://api.m.taobao.com/gw/%@/%@/?%@"
    #define MTOP_APP_KEY            @"12381755"
    #define MTOP_APP_SECERT_KEY     [NSString notifycatione39b]//@"03a230766fe1e39beb4b8703c8b3ff3f"
    #define CLIENT_NAME             @"trip"
    #define TBH5_LOGIN_URL          @"http://login.m.taobao.com/login.htm"
    #define TBH5_LOGOUT_URL         @"http://login.m.taobao.com/logout.htm"
    #define TBSDK_ENVIRONMENT        3//1:debug; 2:daily; 3:release
    #define BUNDLE_NAME             ((NSString *)[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"])
    #define API_HOME_MARKET_DATA    @"trip.taobao.com/market/living/home.php"//运营位
    #define SNSID                   @"2063951746"
    #define WAP_URL                 @"http://h5.m.taobao.com"
    #define UMEAPPID                @"ume_fbd2c8f683f34bd69bce901146f3b2bc"
    #define UMEAPPKEY               @"667550d14d1f4ca3f8ae934e50a15acc"
    #define UMEAPPSECKEY            @"3082023f308201a8a0030201020204"
    #define HWS_WDETAIL_SERVICE_ADDRESS                     @"hws.m.taobao.com/cache/wdetail/5.0/"
    #define HDETAILSKIP_TICKET_SERVICE_ADDRESS              @"detailskip.taobao.com/json/travel/travel_ifq.htm"
    #define SPECIAL_CREATORDER      @"h5.m.taobao.com/trip/base/order.html"

#endif

// app id
#define APP_ID                      @"2013073000000667" //不可更改

//update
#define PATH_REQUEST_CHECK_PACKAGE          @"check_package"

// passbook
#define PATH_REQUEST_PASSBOOK_CREATE        @"passbook/create"

//database
#define SQLITE_KV_TABLE                     @"trip_kv"
#define SQLITE_KUAIDI_ORDER_TABLE           @"trip_kuaidi_order"

// notification
#define NOTIFICATION_USER_LOGIN_CHANGED             @"TRIP_NOTIFY_USER_LOGIN_CHANGED"
#define NOTIFICATION_LOGIN_VIEW_CLOSED              @"TRIP_NOTIFY_LOGIN_VIEW_CLOSED"
#define NOTIFICATION_REFRESH_CHECK_CODE             @"NOTIFICATION_REFRESH_CHECK_CODE"

#define NOTIFICATION_CLOSE_TRAVELLING_CARD          @"CLOSE_TRAVELLING_CARD"
#define NOTIFICATION_CANCEL_ORDER_SUCCESS           @"CANCEL_ORDER_SUCCESS"
#define NOTIFICATION_REFUND_ORDER_STATUSCHANGED     @"REFUND_ORDER_STATUSCHANGED"
#define NOTIFICATION_PAY_ORDER_SUCCESS              @"PAY_ORDER_SUCCESS"
#define NOTIFICATION_TRAVEL_CARD_CHANGED            @"TRAVEL_CARD_CHANGED"
#define NOTIFICATION_TRAVEL_CARD_TOUCH              @"TRAVEL_CARD_TOUCH"
#define NOTIFICATION_FEED_COUNT_UPDATE              @"NOTIFICATION_FEED_COUNT_UPDATE"
#define NOTIFICATION_FEED_FAVORITE_CHANGED          @"NOTIFICATION_FEED_FAVORITE_CHANGED"
#define NOTIFICATION_MESSAGE_COUNT_UPDATE           @"NOTIFICATION_MESSAGE_COUNT_UPDATE"
#define NOTIFICATION_VERSION_UPDATE                 @"NOTIFICATION_VERSION_UPDATE"
//#define NOTIFICATION_MEMBER_ACTIVATE_STATUS_UPDATE  @"NOTIFICATION_MEMBER_ACTIVATE_STATUS_UPDATE"
#define NOTIFICATION_FLIGHT_REMIND_INFO_UPDATE      @"NOTIFICATION_FLIGHT_REMIND_INFO_UPDATE"//机票低价提醒badge标签
#define NOTIFICATION_FLIGHT_REMIND_ISREAD           @"NOTIFICATION_FLIGHT_REMIND_ISREAD"//机票低价提醒单条是否已读
#define NOTIFICATION_MAIN_VIEW_CONTROLLER_LOAD      @"TRIP_MAIN_VIEW_CONTROLLER_LOAD"//用于Pull消息
#define NOTIFICATION_PUSH                           @"TRIP_PUSH_NOT"//用于Pull消息
#define NOTIFICATION_MESSAGE_FIND_UPDATE_TAB        @"NOTIFICATION_MESSAGE_FIND_UPDATE_TAB"     //发现通知：用于刷新Tab红点（主题＋目的地）
#define NOTIFICATION_MESSAGE_FIND_UPDATE_PAGE       @"NOTIFICATION_MESSAGE_FIND_UPDATE_PAGE"    //发现通知：用于刷新发现页面（主题＋目的地）

// 快的打车api
#define TAXI_API_CANCEL_ORDER                           @"order/cancel.htm"
#define TAXI_API_CONFIRM_TAKEN_ORDER                    @"order/confirmTaken.htm"
#define TAXI_API_ORDER_QUERY_STATE                      @"order/query_state.htm"
#define TAXI_API_GET_CITY_LIST                          @"sys/surpportedCities.htm"
#define TAXI_API_GET_DRIVER_POS                         @"order/getDriverPos.htm"
#define MOTP_TAXI_API_GET_VAlID_MESSAGE_CODE            @"mtop.trip.taxi.validMessageCode"
#define MTOP_TAXI_API_GET_VALID_CODE                    @"mtop.trip.taxi.getValidCode"

//首页接口
#define MTOP_API_HOMEPAGE_SPECIAL_SELLING_WITHLOCATION  @"mtop.trip.travel.getRecommendItemList"
#define MTOP_API_HOMEPAGE_SPECIAL_SELLING               @"mtop.trip.tms.getIndexItemList" // deprecated
#define MTOP_API_HOMEPAGE_FIND                          @"mtop.trip.discover.getDataLatestVersion"

//mtop api
#define MTOP_API_GET_UPGRADE_INFO                       @"mtop.trip.app.checkAppVersion"
#define MTOP_API_GET_USER_INFO                          @"com.taobao.client.user.getUserInfo"
#define MTOP_API_CHECK_UPDATE                           @"mtop.trip.inner.checkpackage"
#define MTOP_API_TRAIN_STATION_SEARCH                   @"mtop.trip.train.station2stationSearch"
#define MTOP_API_TRAIN_NUMBER_DETAIL                    @"mtop.trip.train.trainNoSearch"
#define MTOP_API_TRAIN_STATIONS_SEARCH                  @"mtop.trip.train.stationsSearch"
#define MTOP_API_TRAIN_GET_BOOKABLE                     @"mtop.trip.train.getBookableAgent"
#define MTOP_API_TRAIN_CHECK_BOOK                       @"mtop.trip.train.checkBook"
#define MTOP_API_TRAIN_CREATE_ORDER                     @"mtop.trip.train.createOrder"
#define MTOP_API_TRAIN_CREATE_RETURN_TICKET             @"mtop.trip.train.createReturnTicket"
#define MTOP_API_TRAIN_ORDER_DETAIL                     @"mtop.trip.train.orderDetail"

#define MTOP_API_FLIGHT_FLIGHT_INFO                     @"mtop.trip.flight.flightInfo" //
#define MTOP_API_FLIGHT_FLIGHT_ONSALE                   @"mtop.trip.flight.onsaleFlight"
#define MTOP_API_FLIGHT_AGENT_FILTER                    @"mtop.trip.flight.agentFilter"
#define MTOP_API_FLIGHT_AGENT_SEARCH                    @"mtop.trip.flight.agentSearch"
#define MTOP_API_FLIGHT_GET_ADDRESS_LIST                @"com.taobao.mtop.deliver.getAddressList"
#define MTOP_API_FLIGHT_CREATE_ADDRESS                  @"com.taobao.mtop.deliver.createAddress"
#define MTOP_API_FLIGHT_CANCEL_ORDER                    @"mtop.trip.flight.cancelOrder"
#define MTOP_API_INTERFLIGHT_CANCEL_ORDER               @"mtop.trip.interflight.cancelOrder"
#define MTOP_API_FLIGHT_RETRYINSURE_ORDER               @"mtop.trip.flight.retryInsureOrder"
#define MTOP_API_FLIGHT_FLIGHT_SEARCH                   @"mtop.trip.flight.flightSearch"
#define MTOP_API_FLIGHT_AROUND_SEARCH                   @"Mtop.trip.flight.flightSuperSearch"
#define MTOP_API_FLIGHT_CREATE_ORDER                    @"mtop.trip.flight.createOrder"
#define MTOP_API_FLIGHT_CREATE_ALIPAY_ORDER             @"mtop.trip.flight.createAliPayOrder"
#define MTOP_API_INTERFLIGHT_CREATE_ALIPAY_ORDER @"mtop.trip.interflight.createAlipayOrder"
#define MTOP_API_FLIGHT_FLIGHT_ORDER                    @"mtop.trip.flight.flightOrder"
#define MTOP_API_COACH_COACH_ORDER                      @"mtop.trip.bus.orderDetail"
#define MTOP_API_COACH_REFUND                           @"mtop.trip.bus.createRefund"
#define MTOP_API_FLIGHT_ROUNDTRIP_ORDER                 @"mtop.trip.flight.flightOrder"
#define MTOP_API_INTER_FLIGHT_ORDER @"mtop.trip.interflight.interFlightOrder"
#define MTOP_API_FLIGHT_GET_ACTIVITY                    @"mtop.trip.flight.getActivity"
#define MTOP_API_FLIGHT_GET_AIRPORT_HELPER              @"mtop.trip.flight.getAirportHelper"
#define MTOP_API_FLIGHT_GET_AIRPORT_TRAFFIC             @"mtop.trip.flight.getAirportTraffic"
#define MTOP_API_FLIGHT_GET_BOOKED_AIRLINES             @"mtop.trip.flight.getBookedAirlines"
#define MTOP_API_FLIGHT_GET_CHEAPEST_PRICE_CALENDAR     @"mtop.trip.flight.getCheapestPriceCalendar"
#define MTOP_API_FLIGHT_GET_INSURE_INFO                 @"mtop.trip.flight.getInsureInfo"
#define MTOP_API_FLIGHT_GET_ACTIVITY_INFO               @"mtop.trip.flight.getActivity"

#define MTOP_API_FLIGHT_REFUNDACTION                    @"mtop.trip.flight.refundAction"
#define MTOP_TRIP_FLIGHT_REFUNDDETAIL                   @"mtop.trip.flight.refundDetail"
#define MTOP_TRIP_COMMON_REMOVEORDER                    @"mtop.trip.common.removeOrder"

#define MTOP_API_FLIGHT_GET_AIRPORTINFO                 @"mtop.trip.common.getAirportTrafficInfo"

#define MTOP_API_FLIGHT_REMOVE_BOOKED_AIRLINE           @"mtop.trip.flight.removeBookedAirline"
#define MTOP_API_FLIGHT_UPDATE_BOOKED_AIRLINE           @"mtop.trip.flight.updateBookedAirline"
#define MTOP_API_FLIGHT_ADD_BOOKED_AIRLINE              @"mtop.trip.flight.addBookedAirline"

#define MTOP_API_FLIGHT_QUERY_DYNAMIC_BY_DEP_AND_ARR    @"mtop.trip.flight.queryFlightDynamicByDepAndArr"
#define MTOP_API_FLIGHT_QUERY_DYNAMIC_BY_FLIGHT_NO      @"mtop.trip.flight.queryFlightDynamicByFlightNo"
#define MTOP_API_FLIGHT_GET_ATTENTION_LIST              @"mtop.trip.flight.getAttentionList"
#define MTOP_API_FLIGHT_PAY_ATTENTION_DYNAMIC           @"mtop.trip.flight.payAttentionDynamic"
#define MTOP_API_FLIGHT_CANCEL_ATTENTION_DYNAMIC        @"mtop.trip.flight.cancelAttentionDynamic"
#define MTOP_API_FLIGHT_REFRESH_ATTENTION_DYNAMIC       @"mtop.trip.flight.flushDynamic"
#define MTOP_API_FLIGHT_REFRESH_ATTENTION_DYNAMICBYORDER       @"mtop.trip.flight.queryFlightDynamicByOrder"
#define MTOP_API_FLIGHT_GET_ALL_ACTIVITY                @"mtop.trip.flight.flightallactivity"

// 低价提醒
#define MTOP_API_FLIGHT_ADD_REMIND_SUBSCRIBE            @"mtop.trip.flight.addRemindSubscribe"
#define MTOP_API_FLIGHT_GET_REMIND_DETAIL               @"mtop.trip.flight.getRemindSubscriberDetail"
#define MTOP_API_FLIGHT_GET_SUBSCRIBE_LIST              @"mtop.trip.flight.queryRemindSubscribeList"
#define MTOP_API_FLIGHT_QUERY_REMIND_FEEDLIST           @"mtop.trip.flight.queryRemindFeedList"
#define MTOP_API_FLIGHT_QUERY_DISCOUNT_RECOMMENDATIONS  @"mtop.trip.flight.recommendRemindDiscountList"
#define MTOP_API_FLIGHT_REMOVE_REMIND_SUBSCRIBE         @"mtop.trip.flight.removeRemindSubscribe"
#define MTOP_API_FLIGHT_QUERY_REMIND_USER_INFO          @"mtop.trip.flight.queryRemindUserInfo"

// 门票订单，线路游，其他订单
#define MTOP_API_TRAVEL_ORDER_DETAIL                    @"mtop.trip.travel.orderDetail"
#define MTOP_API_CANCEL_ORDER                           @"mtop.trade.orderOperate"

// 酒店接口
#define MTOP_API_HOTEL_SEARCH                           @"mtop.trip.hotel.hotelSearch"
#define MTOP_API_HOTEL_BUILD_ORDER                      @"mtop.trip.hotel.buildOrder"
#define MTOP_API_HOTEL_CREATE_ORDER                     @"mtop.trip.hotel.createOrder"
#define MTOP_API_HOTEL_CHECK_CREATE_ORDER               @"mtop.trip.hotel.checkCreateStatus"
#define MTOP_API_HOTEL_ROOMTYPEQUERY                    @"mtop.trip.hotel.roomTypeQuery"
#define MTOP_API_HOTEL_ITEMLISTQUERY                    @"mtop.trip.hotel.itemListQuery"
#define MTOP_API_HOTEL_BATCHITEMLISTQUERY               @"mtop.trip.hotel.itemListQueryBatch"
#define MTOP_API_HOTEL_REVIEWLISTACTOR                  @"mtop.trip.hotel.hotelRateInfo"
#define MTOP_API_HOTEL_ORDER_DETAIL                     @"mtop.trip.hotel.orderDetail"
#define MTOP_API_HOTEL_DETAIL_INFORMATION               @"mtop.trip.hotel.hotelDesc"
#define MTOP_API_HOTEL_CANCEL_ORDER                     @"mtop.trip.hotel.cancelOrder"
#define MTOP_API_HOTEL_CREATE_REFUND                    @"mtop.trip.hotel.createRefund"
#define MTOP_API_HOTEL_COMMIT_REFUND                    @"mtop.trip.hotel.commitRefund"
#define MTOP_API_HOTEL_COMMIT_INTERVENE                 @"mtop.trip.hotel.commitIntervene"
#define MTOP_API_HOTEL_CLOSE_REFUND                     @"mtop.trip.hotel.closeRefund"

#define HOTEL_SEARCH_SUGGEST_SERVICE_ADDRESS            @"http://kezhan.trip.taobao.com/ajax/suggest/autoSuggestion.htm"                                 //酒店搜索智能提示

#define MTOP_API_CREATE_COMMON_ALIPAY_ID                @"mtop.trip.common.getPayInfo"

#define MTOP_API_COMMON_GET_WEATHER                     @"mtop.trip.common.getWeather"
#define MTOP_API_GET_MY_ORDERS                          @"mtop.trip.my.getMyOrders"
#define MTOP_API_GET_MY_TRAVELLING                      @"mtop.trip.my.getMyTravelling"
#define MTOP_API_COMMON_GET_PASSENGER                   @"mtop.trip.common.getPassengers"
#define MTOP_API_COMMON_ADD_PASSENGER                   @"mtop.trip.common.addPassenger"
#define MTOP_API_COMMON_UPDATE_PASSENGER                @"mtop.trip.common.updatePassenger"
#define MTOP_API_COMMON_REMOVE_PASSENGER                @"mtop.trip.common.removePassenger"

#define MTOP_API_GET_APP_LIST                           @"mtop.trip.inner.getAppRecom"
#define MTOP_API_USER_FEEDBACK                          @"mtop.trip.inner.userFeedback"

// push 开关设置
#define MTOP_API_PUSH_ON                                @"mtop.trip.push.on"
#define MTOP_API_PUSH_OFF                               @"mtop.trip.push.off"
#define MTOP_API_PUSH_STATUS                            @"mtop.trip.push.getSwitchStatus"

//消息
#define MTOP_API_PUSH_GET_PUSH_MESSAGE_LIST             @"mtop.trip.push.getPushMessageList"

//特惠
#define MTOP_API_JU_OPTION_ITEM_GET                     @"mtop.ju.optionitem.get"

//微旅行
//#define API_FEEDS_LIST                                  @"mtop.sns.feed.listBefore"
//#define API_FEEDS_DETAIL                                @"mtop.sns.feed.detail"
//#define API_FEEDS_COMMENT_LIST                          @"mtop.sns.comment.richList"
//#define API_FEEDS_ADD_FEED                              @"mtop.sns.favorite.addFeed"
//#define API_FEEDS_REMOVE_FEED                           @"mtop.sns.favorite.removeFeed"
//#define API_FEEDS_COMMENT_REPLY_COUNT                   @"mtop.sns.comment.replyCount4Trip"
//#define API_FEEDS_FAVORITE_LIST                         @"mtop.sns.favorite.feeds4Trip"
//#define API_FEEDS_COUNT                                 @"mtop.sns.feed.feedcount"
//#define API_FEEDS_COMMENT_REPLY_LIST                    @"mtop.sns.comment.replyRichList4Trip"
//#define API_FEEDS_COMMENT_NEW                           @"mtop.sns.comment.new"

// 常旅客会员计划
#define MTOP_API_GET_FFA_INFO                           @"mtop.trip.common.getUserFfaInfo"
#define MTOP_API_ACTIVATE_FFA_USER                      @"mtop.trip.common.activateUser"
#define MTOP_API_COMMON_GET_ALIPAY_CARD                 @"mtop.trip.common.getAlipayIdCard"
#define MTOP_API_UPDATEFFAUSER                          @"mtop.trip.common.updateFfaUser"
#define MTOP_API_COMMON_GETMILEAGEDETAILS              @"mtop.trip.common.getMileageDetails"

//特惠接口
#define MTOP_API_SPECIALS_DETAIL_INFO                   @"mtop.wdetail.getItemDetail"
#define MTOP_API_JU_OPTION_ITEM_GET                     @"mtop.ju.optionitem.get"
#define MTOP_API_SPECIALS_JOIN                          @"mtop.ju.group.join"
#define MTOP_API_JU_LIST_CITY_ALL                       @"mtop.ju.list.city.all"
#define MTOP_API_JU_OPTION_GET                          @"mtop.ju.option.get"
#define MTOP_API_SPECIALS_RECOMMENT_ITEM_LIST           @"mtop.trip.tms.getTHIndexItemList"
#define MTOP_API_SPECIALS_COMMEND_LIST                  @"mtop.wdetail.getItemRates"
#define MTOP_API_SPECIALS_MILEAGE                       @"mtop.trip.common.getMileage4Item"

// 获取短链接
#define API_SINA_SHORT_URL                              @"api.weibo.com/2/short_url/shorten.json"

#define NO_RESULT_STRING_NET_ERROR                      @"网络开小差，再刷新看看"
#define NET_ERROR_TIPS                                  @"亲，网络不给力，请再试一次"
#define NO_RESULT_SPECIAL_NET_ERROR                     @"亲，没有找到特惠哦，请切换城市或重新筛选看看！"
#define NO_RESULT_SPECIAL_TICKET_NET_ERROR              @"亲，没有找到特惠哦，请切换城市或重新筛选看看！"
#define NO_RESULT_STRING_AIRPORT_ERROR                  @"暂无机场的相关信息"
#define NO_RESULT_STRING_TRAIN_LIST                     @"亲，没有找到相关的车次，请重新查询"
#define NO_RESULT_STRING_HOTEL_LIST                     @"亲,没有找到相关的酒店,请重新查询"
#define NO_RESULT_STRING_TAXI_ORDER_LIST                @"亲，神马都没有哦，快去打车吧"
#define NO_RESULT_STRING_TRAIN_DETAIL                   @"抱歉，该日期没有这个车次"
#define NO_RESULT_NORMAL                                @"亲，你还没有任何订单哦!"
#define NO_RESULT_FLIGHT_ORDER                          @"亲，你还没有国内机票订单哦"
#define NO_RESULT_TRAIN_ORDER                           @"亲，你还没有火车票订单哦"
#define NO_RESULT_VACATION_ORDER                        @"亲，你还没有线路游订单哦"
#define NO_RESULT_TICKET_ORDER                          @"亲，你还没有门票订单哦"
#define NO_RESULT_MESSAGE_CENTER                        @"亲，还没有收到消息哦"
#define INFO_FLIGHT_FOLLOW_DYNAMIC_NOTICE               @"若遇航空公司临时调整，详细信息请以机场告知为准。"
#define INFO_FLIGHT_FOLLOW_CANCEL_NOTICE                @"亲，取消关注将不再接收此航班动态变化的即时信息。"
#define INFO_FLIGHT_FOLLOW_CANCEL_FAILURE               @"亲，该航班动态取消关注失败，请稍后再试。"
#define INFO_FLIGHT_FOLLOW_REFRESH_FAILURE              @"亲，航班信息已过期,刷新失败。"
#define INFO_FLIGHT_FOLLOW_INFO_EXPIRED                 @"亲，航班信息已过期。"
#define TIPS_PAY_FAILURE                                @"亲，付款失败，请重新支付。"
#define NO_RESULT_STRING_FEED_LIST                      @"亲，没有内容哦！"
#define NO_RESULT_STRING_FEED_FAVORITW                  @"你还没有收藏任何信息哦"
#define ERROR_MSG_NO_NETWORK                            @"似乎未连接到互联网"
#define ERROR_HOTEL_PAY_NOT_SUPPORT                     @"亲，对不起，手续费和订金的宝贝，暂不支持在无线端交易"
#define ERROR_HOTEL_JUMP_NOT_SUPPORT                    @"亲，对不起，该宝贝暂不支持无线端交易"

//Train Fill Order Notification
#define TRAIN_ORDER_ADD_RELATION_NOTIFICATION           @"TRAIN_ORDER_ADD_RELATION_NOTIFICATION"
#define TRAIN_ORDER_SHOW_ACTIVITY_DETAIL                @"TRAIN_ORDER_SHOW_ACTIVITY_DETAIL"
#define TRAIN_ORDER_SHOW_TRAFFIC_DETAIL                 @"TRAIN_ORDER_SHOW_TRAFFIC_DETAIL"
#define TRAIN_ORDER_ADD_PASSENGER_NOTIFICATION          @"TRAIN_ORDER_ADD_PASSENGER_NOTIFICATION"
#define TRAIN_ORDER_DELETE_PASSENGER_NOTIFICATION       @"TRAIN_ORDER_DELETE_PASSENGER_NOTIFICATION "
#define TRAIN_ORDER_SUBMIT_NOTIFICATION                 @"TRAIN_ORDER_SUBMIT_NOTIFICATION"

//Flight Fill Order Notification
#define FLIGHT_ORDER_ADD_PASSENGER_NOTIFICATION         @"FLIGHT_ORDER_ADD_PASSENGER_NOTIFICATION"
#define FLIGHT_ORDER_ADD_RELATION_NOTIFICATION          @"FLIGHT_ORDER_ADD_RELATION_NOTIFICATION"
#define FLIGHT_ORDER_SUBMIT_NOTIFICATION                @"FLIGHT_ORDER_SUBMIT_NOTIFICATION"
#define FLIGHT_ORDER_DELETE_PASSENGER_NOTIFICATION      @"FLIGHT_ORDER_DELETE_PASSENGER_NOTIFICATION"
#define FLIGHT_ORDER_SHOW_ACTIVITY_DETAIL               @"FLIGHT_ORDER_SHOW_ACTIVITY_DETAIL"
#define FLIGHT_ORDER_SUBMIT_NOTIFICATION                @"FLIGHT_ORDER_SUBMIT_NOTIFICATION"
#define FLIGHT_INSURE_SHOW_HINT_NOTIFICATION            @"FLIGHT_INSURE_SHOW_HINT_NOTIFICATION"
#define FLIGHT_DYNIMAC_DATA_UPDATED_NOTIFICATION        @"FLIGHT_DYNIMAC_DATA_UPDATED_NOTIFICATION"
//Flight Fill Order Notification
#define HTOEL_ORDER_SHOW_CANCEL_DETAIL                  @"HTOEL_ORDER_SHOW_CANCEL_DETAIL"
#define HOTEL_ORDER_ROOM_COUNT_CHANGED                  @"HOTEL_ORDER_ROOM_COUNT_CHANGED"
#define HOTEL_ORDER_CHECKIN_TIME_CHANGED                @"HOTEL_ORDER_CHECKIN_TIME_CHANGED"
#define HOTEL_ORDER_SUBMIT_NOTIFICATION                 @"HOTEL_ORDER_SUBMIT_NOTIFICATION"
#define HOTEL_FILL_ORDER_GO_BACK                        @"HOTEL_FILL_ORDER_GO_BACK"
#define HOTEL_FILL_ORDER_WANGWANG                       @"HOTEL_FILL_ORDER_WANGWANG"

//Flight Fill Order ErrorCode
#define ERROR_FLIGHT_ORDER_EMPTY_PASSENGER          10
#define ERROR_FLIGHT_ORDER_MAX_BUY_NUMBER           11
#define ERROR_FLIGHT_ORDER_NOT_SUPPORT_BABY         12
#define ERROR_FLIGHT_ORDER_NOT_SUPPORT_OLD_MAN      13
#define ERROR_FLIGHT_ORDER_NOT_SUPPORT_CHILD        14
#define ERROR_FLIGHT_ORDER_NOT_SINGLE_CHILD         15
#define ERROR_FLIGHT_ORDER_ADULT_WITH_TOW_CHILD     16
#define ERROR_FLIGHT_ORDER_YOUTH_WITH_CHILD         17
#define ERROR_FLIGHT_ORDER_EMPTY_RELATION           18
#define ERROR_FLIGHT_ORDER_INVALID_ACTIVITY         19
#define ERROR_FLIGHT_ORDER_NEED_INSURE_PROFIT       20
#define ERROR_FLIGHT_ORDER_INVALID_ITINERARY_TYPE   21
#define ERROR_FLIGHT_ORDER_EMPTY_ADDRESS            22

// Order Passnager Name ErrorCode
#define ERROR_ORDER_PASSANGER_NAME_INVALID          23

// Passenger cert card ErrorCode
#define ERROR_PASSENGER_CERTCARD_INVALID            24

// Passenger phone number ErrorCode
#define ERROR_PASSENGER_PHONENUMBER_INVALID         25

// passanger passport english name errorcode
#define ERROR_ORDER_PASSANGER_ENGLISH_NAME_INVALID  26

#define ERROR_HOTEL_ORDER_INVALID_GUEST_NAME            30
#define ERROR_HOTEL_CHECK_CREATE_ORDER_PRICE_CHANGED    31
#define ERROR_HOTEL_CHECK_CREATE_ORDER_TIMEOUT          32
#define ERROR_HOTEL_CREATE_ORDER_NO_ENOUGH_ROOM         33
#define ERROR_HOTEL_CREATE_ORDER_ERROR                  34
#define ERROR_HOTEL_CREATE_ORDER_PRICE_CHANGED          35
#define ERROR_HOTEL_BUILD_ORDER_EMPTY_ROOM              36


#define ERROR_ORDER_FFA_NAME_EMPTY                      100

//火车票
//#import "KVCache.h"
#import "NSUserDefaults+Trip.h"

#define FLIGHT_SEARCH_FORM    @"flight_search_form"
#define FLIGHT_ADD_SUBSCRIBE_FORM @"flight_add_subscribe_form"
#define APP_LAUNCHED_COUNT    @"app_launched_count"

// 订单详情，出行小助手传参
#define PARAM_SHOW_ASSISTANT_FIRST @"tab_type"  //订单详情界面是否先显示出行小助手


#define DEVICE_ID_FOR_FLIGHT_DYNIMAC(obj)    [NSString stringWithFormat:@"%@1", obj]

#import "AppDelegate.h"
#define APP_DELEGATE ((AppDelegate *)[[UIApplication sharedApplication] delegate])
#define MainNavigator  (APP_DELEGATE.navigator)
#define TRIP_HOME_PAGE_URL [NSString stringWithFormat:@"%@://%@",PageScheme, HOME_PAGE]
#define TRIP_PAGE_URL(page_name) [NSURL URLWithString:[NSString stringWithFormat:@"%@://%@",PageScheme, page_name]]

#define STRING_IS_NULL(str) (str==nil ||![str isKindOfClass:[NSString class]]|| [str length]<1)
#define STRING_NOT_NULL(str) ((str==nil)?@"":str)
#define DICTIONARY_IS_NULL(dic) ((dic)==nil || ![(dic) isKindOfClass:[NSDictionary class]] || (dic).count < 1)
#define ARRAY_IS_NULL(array) ((array)==nil || ![(array) isKindOfClass:[NSArray class]] || (array).count < 1)

#define ADD_STRING_TO_DIC_IF_NOT_NULL(str,params,targStr) if(str!=nil && [str isKindOfClass:[NSString class]] && [str length]>0)[params setObject:str forKey:targStr]
#define ADD_INT_TO_DIC_IF_NOT_NULL(num,params,targStr) if(num!=0)[params setObject:[NSNumber numberWithInt:num] forKey:targStr]
#define ADD_DICTINATY_TO_DIC_IF_NOT_NULL(dic,params,targStr) if(dic!=nil && [(dic) isKindOfClass:[NSDictionary class]] && [dic count]>0)[params setObject:dic forKey:targStr]
#define ADD_NUMBER_TO_DIC_IF_NOT_NULL(num,params,targStr) if(num!=nil && [num isKindOfClass:[NSNumber class]])[params setObject:num forKey:targStr]
#define ADD_OBJ_TO_DIC_IF_NOT_NULL(obj,params,targStr) if(obj!=nil)[params setObject:obj forKey:targStr]

// 低价提醒
#define MAX_COUNT_ADD_AUTO_ORDER_SUBSCRIBE 2

//网络模块参数定义
#define NET_PARAMS_REMOTE_URL       @"remote_url"
#define NET_PARAMS_LOCAL_PATH       @"local_path"
#define NET_PARAMS_HTTP_HEADER      @"http_header"
#define NET_PARAMS_HTTP_PARAMS      @"http_params"
#define NET_PARAMS_HTTP_MULTIPART   @"http_multipart"
#define NET_PARAMS_HTTP_METHOD      @"http_method"
#define NET_PARAMS_FORCE_DOWNLOAD   @"force_download"   //bool
#define NET_PARAMS_TEMP_PATH        @"temp_path"

//特惠
#define SPECIAL_STARTCITYLISTFILE                  @"SpecialStartCities"
#define SPECIAL_STARTCITYLISTFILE_STOREDATE        @"SpecialStartCities_DATE"
#define SPECIAL_ENDCITYLISTFILE_STOREDATE          @"SpecialEndCities_DATE"

//nav bar config
typedef enum {
    NavLeftButtonTypeBack = 1,          //返回
    NavLeftButtonTypeClose = 2,         //显示关闭按钮
    NavLeftButtonTypeCloseSmall = 3,    //显示小号的关闭按钮
    NavLeftButtonTypeNone = -1          //不显示按钮
} NavLeftButtonType;

typedef enum {
    NavRightButtonTypeShare,        //分享
    NavRightButtonTypeBackHome,     //回到首页
    NavRightButtonTypeDone,         //确定
    NavRightButtonTypeCancel,       //取消
    NavRightButtonTypeDelete,       //删除
    NavRightButtonTypeEdit,         //编辑
    NavRightButtonTypeSend,         //发送
    NavRightButtonTypeRefresh,      //刷新
    NavRightButtonTypeHelp,         //帮助
    NavRightButtonTypeRefreshSmall, //小号的刷新
    NavRightButtonTypeCollect,      //微旅行-收藏
    NavRightButtonTypeComment,      //微旅行-评论
    NavRightButtonTypeList,         //酒店-列表
    NavRightButtonTypeMap,          //酒店-地图
    NavRightButtonTypeTaxiHistory,  //打的历史记录
    NavRightButtonTypeClose,        //关闭按钮（左侧带竖线）
    NavRightButtonTypeSetting,      //设置按钮
    NavRightButtonTypeNone = -1     //不显示按钮
} NavRightButtonType;

typedef enum {
    ORDER_TYPE_NONE = 0,
    ORDER_TYPE_FLIGHT,
    ORDER_TYPE_INTERFLIGHT,
    ORDER_TYPE_HOTEL,
    ORDER_TYPE_GATETICKET,
    ORDER_TYPE_TRAINTICKET,
    ORDER_TYPE_XIANLUYOU,
    ORDER_TYPE_YUSHOU,
    ORDER_TYPE_FLIGHTROUND,
    ORDER_TYPE_COACH,
    ORDER_TYPE_OTHER,
} TRIPOrderType ;

typedef enum {
    OrderStatusSuccess = 0,
    OrderStatusFail,
    OrderStatusHandling,
    OrderStatusAlreadyPay,
    OrderStatusNeedPay,
    OrderStatusSpecialHandleCanCancel,
    OrderStatusAlreadyOrder,
    OrderStatusUnknown,
} OrderStatus;

//0 退款中 1 已退款 2 已拒绝，没有默认-1
typedef enum {
    OrderRefundStatusNone = -1,
    OrderRefundStatusHandling = 0,
    OrderRefundStatusSuccess,
    OrderRefundStatusRefuse,
} OrderRefundStatus;

typedef enum {
    CabinTypeTouDeng = 0,
    CabinTypeShangwu,
    CabinTypeJingji,
    CabinTypeUnknown = 99
} CabinType;

typedef enum {
    ActivityTypeZhiJian = 1,
    ActivityTypeHouFan,
    ActivityTypeDuoRenTongXing,
}ActivityType;

typedef enum {
    PaymentQuanE = 1,       //全额
    PaymentShouXuFei,       //手续费
    PaymentDingJin,         //订金
    PaymentShouXuFeiJianYe, //手续费间夜
    PaymentDaoDian,         //到店
}HotelPaymentType;

typedef enum {
    HotelOrderTypeYuFu = 0,
    HotelOrderZhongHangXin,
    HotelOrderJump,
    HotelOrderTypeMianFu = 3,
}HotelOrderType;

typedef enum {
    BedDanRen = 0,  //单人床
    BedDa,          //大床
    BedShuang,      //双床
    BedShuangDa,    //双床或大床
    BedZiMu,        //子母床
    BedShangXia,    //上下床
    BedYuanXing,    //圆形床
    BedDuo,         //多床
    BedQita,        //其他床
}HotelBedType;

typedef enum {
    BreakfastNotKnown = -1,
    BreakfastNone = 0,
    BreakfastOne,
    BreakfastTwo,
    BreakfastThree,
    BreakfastMulti,
}HotelBreakfastType;

// 0:无宽带; 1:免费宽带; 2:收费宽带; 3:部分收费宽带
typedef enum {
    NetworkNone,
    NetworkFree,
    NetworkPay,
    NetworkPartPay,
}HotelNetworkType;

typedef enum {
    KuaiDiStatusCancel = 1,  // 已取消
    KuaiDiStatusNotTakeOrder = 2, //未接单
    KuaiDiStatusTakeOrder = 3, // 已接单
    KuaiDiStatusNotGetOn = 101, //未上车
    KuaiDiStatusGetOn = 102, //已上车
    KuaiDiStatusNotPay = 103, //未付款
    KuaiDiStatusFinish = 104, //已完成
    KuaiDiStatusExpire = 4, // 已超时
}KuaiDiOrderStatus;

typedef enum {
    TaxiNow,  // 现在用车
    TaxiPreorder,  // 预约用车
}TaxiType;

#define KUAIDI_PHONE_NUMBER             @"kuaidi_phone_number"
#define KEY_TAXI_DRIVER_COUNT           @"taxi_driver_count"
#define KEY_SHOW_MEMBER_ACTIVATE        @"showMemberActivate"
#define KEY_TABBAR_MINE_HAS_CLICK       @"tabBarMineHasClick"
#define KEY_HAVE_SET_LOCATION           @"setLocation"

typedef enum {
    StateWelcomeStart = 100, //欢迎页初始页面
    StateWelcomeLoading, //欢迎页状态加载中
    StateWelcomeLoginFail,
    StateWelcomeLoginSuccess,
    StateWelcomeLoadingSuccess,
    StateWelcomeLoadingFail,
    StateMemberListStart,
    StateAddMemberStart,
    StateMemberConfirmStart,
    StateAlreadAdd,
    StateAddSuccess,
    StateInfoCard,
}MemberActivateState;

typedef enum {
    CheckInStatusNot = 1, // 未入住
    CheckInStatusAlready, // 已入住
}CheckInStatus;
