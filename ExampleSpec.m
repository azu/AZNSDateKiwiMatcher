//
// Created by azu on 2014/04/07.
//


#import "Kiwi.h"
#import "AZNSDateKiwiMatcher.h"

SPEC_BEGIN(ExampleSpec)
    registerMatchers(@"AZ");
    describe(@"Custom Matcher", ^{
        NSDate *aDate = [NSDate date];
        NSDate *bDate = [[NSDate date] dateByAddingTimeInterval:1];
        it(@"could equal ignoring time to Date", ^{
            [[aDate should] equalToDateIgnoringTime:bDate];// pass
        });
        it(@"doesn't equal date", ^{
            [[aDate should] equal:bDate];// fails
        });
    });
    SPEC_END