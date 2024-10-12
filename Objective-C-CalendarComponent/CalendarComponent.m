//
//  CalendarComponent.m
//  Objective-C-CalendarComponent
//
//  Created by Angelos Staboulis on 11/10/24.
//

#import "CalendarComponent.h"

@implementation CalendarComponent
- (instancetype)init {
    self = [super init];
    if (self) {
        _components = [[NSDateComponents alloc] init];
        _format = [[NSDateFormatter alloc] init];
    }
    return self;
}
- (NSInteger)findLastDayOfCurrentMonth {
    self.components.day = 0;
    self.components.month = [[NSCalendar currentCalendar] component:NSCalendarUnitMonth fromDate:[NSDate date]] + 1;
    self.components.year = [[NSCalendar currentCalendar] component:NSCalendarUnitYear fromDate:[NSDate date]];
    NSDate *convertedDate = [[NSCalendar currentCalendar] dateFromComponents:self.components];
    self.format.dateStyle = NSDateFormatterShortStyle;
    self.format.defaultDate = convertedDate;
    NSArray *dateArray = [[self.format stringFromDate:convertedDate] componentsSeparatedByString:@"/"];
    return [[dateArray objectAtIndex:1] integerValue];
}

- (NSInteger)findLastDayOfMonth:(NSInteger)month {
    self.components.day = 0;
    self.components.month = month + 1;
    self.components.year = [[NSCalendar currentCalendar] component:NSCalendarUnitYear fromDate:[NSDate date]];
    NSDate *convertedDate = [[NSCalendar currentCalendar] dateFromComponents:self.components];
    self.format.dateStyle = NSDateFormatterShortStyle;
    self.format.defaultDate = convertedDate;
    NSArray *dateArray = [[self.format stringFromDate:convertedDate] componentsSeparatedByString:@"/"];
    return [[dateArray objectAtIndex:1] integerValue];
}

- (NSString *)getCurentMonth:(NSInteger)month {
    self.components.day = 0;
    self.components.month = month-1;
    self.components.year = [[NSCalendar currentCalendar] component:NSCalendarUnitYear fromDate:[NSDate date]];
    NSDate *convertedDate = [[NSCalendar currentCalendar] dateFromComponents:self.components];
    self.format.dateStyle = NSDateFormatterLongStyle;
    self.format.defaultDate = convertedDate;
    NSArray *dateArray = [[self.format stringFromDate:convertedDate] componentsSeparatedByString:@" "];
    return [dateArray objectAtIndex:1];
}
- (NSInteger)findCurrentDay {
    self.components.day = [[NSCalendar currentCalendar] component:NSCalendarUnitDay fromDate:[NSDate date]];
    self.components.month = [[NSCalendar currentCalendar] component:NSCalendarUnitMonth fromDate:[NSDate date]];
    self.components.year = [[NSCalendar currentCalendar] component:NSCalendarUnitYear fromDate:[NSDate date]];
    return self.components.day;
}

- (NSInteger)getCurrentMonth {
    self.components.day = 0;
    self.components.month = [[NSCalendar currentCalendar] component:NSCalendarUnitMonth fromDate:[NSDate date]] ;
    self.components.year = [[NSCalendar currentCalendar] component:NSCalendarUnitYear fromDate:[NSDate date]];
    return self.components.month+1;
}

- (NSString *)getCurrentDayString {
    self.components.day = [[NSCalendar currentCalendar] component:NSCalendarUnitDay fromDate:[NSDate date]] ;
    self.components.month = [[NSCalendar currentCalendar] component:NSCalendarUnitMonth fromDate:[NSDate date]] + 1;
    self.components.year = [[NSCalendar currentCalendar] component:NSCalendarUnitYear fromDate:[NSDate date]];
    NSDate *convertedDate = [[NSCalendar currentCalendar] dateFromComponents:self.components];
    self.format.dateStyle = NSDateFormatterMediumStyle;
    self.format.defaultDate = convertedDate;
    NSArray *dateArray = [[self.format stringFromDate:convertedDate] componentsSeparatedByString:@" "];
    return [dateArray objectAtIndex:0];
}

- (NSString *)getCurrentMonthString {
    self.components.day = 0;
    self.components.month = [[NSCalendar currentCalendar] component:NSCalendarUnitMonth fromDate:[NSDate date]] + 1;
    self.components.year = [[NSCalendar currentCalendar] component:NSCalendarUnitYear fromDate:[NSDate date]];
    NSDate *convertedDate = [[NSCalendar currentCalendar] dateFromComponents:self.components];
    self.format.dateStyle = NSDateFormatterLongStyle;
    self.format.defaultDate = convertedDate;
    NSArray *dateArray = [[self.format stringFromDate:convertedDate] componentsSeparatedByString:@" "];
    NSLog(@"month=%@",[dateArray objectAtIndex:1]);
    return [dateArray objectAtIndex:1];
}

- (NSString *)getCurrentYearString {
    self.components.day = 0;
    self.components.month = [[NSCalendar currentCalendar] component:NSCalendarUnitMonth fromDate:[NSDate date]] + 1;
    self.components.year = [[NSCalendar currentCalendar] component:NSCalendarUnitYear fromDate:[NSDate date]];
    NSDate *convertedDate = [[NSCalendar currentCalendar] dateFromComponents:self.components];
    self.format.dateStyle = NSDateFormatterLongStyle;
    self.format.defaultDate = convertedDate;
    NSArray *dateArray = [[self.format stringFromDate:convertedDate] componentsSeparatedByString:@" "];
    return [dateArray objectAtIndex:2];
}

- (id)getCurrentYear {
    self.components.day = [[NSCalendar currentCalendar] component:NSCalendarUnitDay fromDate:[NSDate date]] ;
    self.components.month = [[NSCalendar currentCalendar] component:NSCalendarUnitMonth fromDate:[NSDate date]] + 1;
    self.components.year = [[NSCalendar currentCalendar] component:NSCalendarUnitYear fromDate:[NSDate date]];
    NSDate *convertedDate = [[NSCalendar currentCalendar] dateFromComponents:self.components];
    self.format.dateStyle = NSDateFormatterMediumStyle;
    self.format.defaultDate = convertedDate;
    NSArray *dateArray = [[self.format stringFromDate:convertedDate] componentsSeparatedByString:@" "];
    id numberID = [dateArray objectAtIndex:2];
    return numberID;
}

@end
