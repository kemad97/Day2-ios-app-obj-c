//
//  ColleagueViewController.m
//  Day2 ios app
//
//  Created by Kerolos on 15/04/2025.
//

#import "ColleagueViewController.h"
#import "Colleague.h"

@interface ColleagueViewController ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;

@end

@implementation ColleagueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _nameLabel.text=_colleague.name;
    _ageLabel.text = [NSString stringWithFormat:@"%ld", (int)_colleague.age];
    _phoneLabel.text=_colleague.phone;
    _addressLabel.text=_colleague.address;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
