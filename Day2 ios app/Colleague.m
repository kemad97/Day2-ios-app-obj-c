//
//  Colleague.m
//  Day2 ios app
//
//  Created by Kerolos on 15/04/2025.
//

#import "Colleague.h"

@implementation Colleague

-(instancetype)initColleague:(NSString *)name age:(NSInteger *)age phone:(NSString *)phone address:(NSString *)address {
    if(self = [super init]) {
        _name = name;
        _age = age;
        _phone = phone;
        _address = address;
    }
    return self;
}

@end
