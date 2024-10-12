//
//  ViewController.m
//  Objective-C-CalendarComponent
//
//  Created by Angelos Staboulis on 11/10/24.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initViewController];
}
-(void) initViewController{
    _calendar = [[CalendarComponent alloc] init];
    _counterMonth = [_calendar getCurrentMonth]+1;
    [_currentMonth setText:[_calendar getCurentMonth:_counterMonth]];
    [_currentYear setText:[_calendar getCurrentYearString]];
    [self highlightCurrentDay];

}
-(void) initializeCalendar{
    for (int number=0;number<_btnDays.count;number++){
        UIButton *currentLabelDay = [_btnDays objectAtIndex:number];
        [currentLabelDay setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [currentLabelDay setBackgroundColor:[UIColor linkColor]];
   }
}
-(void) moveCalendar{
    if (_counterMonth == [_calendar getCurrentMonth]+1) {
             [self highlightCurrentDay];
          }
          else{
             [self initializeCalendar];
          }
          NSInteger result = 31-[_calendar findLastDayOfMonth:_counterMonth];
          if (result == 0) {
              for(int item=28;item<31;item++){
                  UIButton *currentLabelDay = [_btnDays objectAtIndex:item];
                  [currentLabelDay setHidden:FALSE];
              }
             
          }
          else if (result > 1) {
              if([_calendar findLastDayOfMonth:2]==28){
                  for(int item=28;item<31;item++){
                      UIButton *currentLabelDay = [_btnDays objectAtIndex:item];
                      [currentLabelDay setHidden:TRUE];
                  }
              }else if ([_calendar findLastDayOfMonth:2]==29){
                  for(int item=29;item<31;item++){
                      UIButton *currentLabelDay = [_btnDays objectAtIndex:item];
                      [currentLabelDay setHidden:TRUE];
                  }
              }else if ([_calendar findLastDayOfMonth:2]==30){
                    UIButton *currentLabelDay = [_btnDays objectAtIndex:30];
                    [currentLabelDay setHidden:TRUE];
              }
          
          }
          else{
              for(int item=28;item<31;item++){
                  UIButton *currentLabelDay = [_btnDays objectAtIndex:item];
                  [currentLabelDay setHidden:FALSE];
              }
                UIButton *currentLabelDay = [_btnDays objectAtIndex:30];
                [currentLabelDay setHidden:TRUE];
          }
}
-(void) highlightCurrentDay{
    for (int number=0;number<_btnDays.count;number++){
        UIButton *currentLabelDay = [_btnDays objectAtIndex:number];
        NSString *currentDay = [NSString stringWithFormat:@"%ld",(long)[_calendar findCurrentDay]];
        if ([[currentLabelDay titleLabel] text] == currentDay) {
            [currentLabelDay setBackgroundColor:[UIColor redColor] ];
        }
    }
}


- (IBAction)btnNext:(id)sender {
    if (_counterMonth == 12 ) {
        _counterMonth = 1;
    }
    else{
        _counterMonth = _counterMonth + 1 ;
    }
    [self moveCalendar];
    [_currentMonth setText:[_calendar getCurentMonth:_counterMonth]];
    
}

- (IBAction)btnPrevious:(id)sender {
    if (_counterMonth == 1) {
        _counterMonth = 12;
    }
    else{
        _counterMonth = _counterMonth - 1;
    }
    [self moveCalendar];
    [_currentMonth setText:[_calendar getCurentMonth:_counterMonth]];
    
    
    
}
@end
