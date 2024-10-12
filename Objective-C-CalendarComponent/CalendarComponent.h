//
//  CalendarComponent.h
//  Objective-C-CalendarComponent
//
//  Created by Angelos Staboulis on 11/10/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CalendarComponent : NSObject
@property (nonatomic, strong) NSDateComponents *components;
@property (nonatomic, strong) NSDateFormatter *format;
- (NSInteger)findLastDayOfCurrentMonth;
- (NSInteger)findLastDayOfMonth:(NSInteger)month;
- (NSString *)getCurentMonth:(NSInteger)month;
- (NSInteger)findCurrentDay;
- (NSInteger)getCurrentMonth;
- (id)getCurrentYear ;
- (NSString *)getCurrentMonthString;
- (NSString *)getCurrentYearString;
- (NSString *)getCurrentDayString;
@end

NS_ASSUME_NONNULL_END
