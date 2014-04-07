//
// Created by azu on 2013/06/09.
//


#import "AZNSDateKiwiMatcher.h"
#import "KWFormatter.h"


@interface AZNSDateKiwiMatcher ()
@property(nonatomic) KWDateInequalityType dateInequalityType;
@property(nonatomic, strong) NSDate *otherDate;
@end

@implementation AZNSDateKiwiMatcher {

}
#pragma mark Getting Matcher Strings

+ (NSArray *)matcherStrings {
    return @[@"equalToDateIgnoringTime:"];
}

#pragma mark Matching

// REQUIRED: Evaluate the predicate here.
// self.subject is available automatically.
// self.otherDate is a member variable you would have declared yourself.
- (BOOL)evaluate {
    NSDate *subjectDate = (NSDate *)self.subject;
    if (![subjectDate isKindOfClass:[NSDate class]]) {
        [NSException raise:@"KWMatcherException" format:@"subject is not a NSDate"];
        return NO;
    }
    switch (self.dateInequalityType) {
        case KWDateInequalityTypeEqualToDateIgnoringTime:
            return [self compareDateIgnoringTime];
    }
    return NO;
}

- (BOOL)compareDateIgnoringTime {
    NSCalendar *currentCalendar = [NSCalendar currentCalendar];
    enum NSCalendarUnit unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
    NSDateComponents *components1 = [currentCalendar components:unitFlags fromDate:self.subject];
    NSDateComponents *components2 = [currentCalendar components:unitFlags fromDate:self.otherDate];
    return ((components1.year == components2.year) &&
        (components1.month == components2.month) &&
        (components1.day == components2.day));
}

#pragma mark Getting Failure Messages

- (NSString *)comparisonPhrase {
    switch (self.dateInequalityType) {
        case KWDateInequalityTypeEqualToDateIgnoringTime:
            return @"≒";
        default:
            break;
    }

    assert(0 && "should never reach here");
    return nil;
}

- (NSString *)failureMessageForShould {
    return [NSString stringWithFormat:@"expected subject to be %@ %@, got %@",
                                      [self comparisonPhrase],
                                      [KWFormatter formatObject:self.otherDate],
                                      [KWFormatter formatObject:self.subject]];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"be %@ %@", [self comparisonPhrase], [KWFormatter formatObject:self.otherDate]];
}

#pragma mark Configuring Matchers

- (void)equalToDateIgnoringTime:(NSDate *) otherDate {
    self.dateInequalityType = KWDateInequalityTypeEqualToDateIgnoringTime;
    self.otherDate = otherDate;
}

@end