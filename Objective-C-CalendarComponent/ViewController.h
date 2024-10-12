//
//  ViewController.h
//  Objective-C-CalendarComponent
//
//  Created by Angelos Staboulis on 11/10/24.
//

#import <UIKit/UIKit.h>
#import "CalendarComponent.h"
@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *currentMonth;
@property (weak, nonatomic) IBOutlet UILabel *currentYear;
@property NSInteger counterMonth;
@property NSInteger counterYear;
@property CalendarComponent *calendar;
@property (weak, nonatomic) IBOutlet UIButton *btnPrevious;
@property (weak, nonatomic) IBOutlet UIButton *btnNext;
- (IBAction)btnPrevious:(id)sender;
- (IBAction)btnNext:(id)sender;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *btnDays;

@end

