//
//  FirstViewController.m
//  Day2 ios app
//
//  Created by Kerolos on 15/04/2025.
//

#import "FirstViewController.h"
#import "MyDelegator.h"

@interface FirstViewController ()
@property (weak, nonatomic) IBOutlet UILabel *resLabel;


@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _resLabel.text= self.recieveString;
    // Do any additional setup after loading the view.
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(btnDone)];
    
    self.navigationItem.rightBarButtonItem=doneBtn;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)btnDone {
    // Go back to the first view controller
    [self.delegate clearTextField];
    [self.navigationController popViewControllerAnimated:YES];
}


@end


