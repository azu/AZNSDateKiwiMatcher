# Project Name

Kiwi Custom Matcher for Date comparing.

## Installation

``` sh
pod 'AZNSDateKiwiMatcher'
```

## Usage

``` objc
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
```

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## License

MIT