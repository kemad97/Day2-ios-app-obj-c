//
//  ViewController.m
//  Day2 ios app
//
//  Created by Kerolos on 15/04/2025.
//

#import "ViewController.h"
#import "FirstViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *tF_Input;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)btnSend:(id)sender {
    FirstViewController *fVC = [self.storyboard instantiateViewControllerWithIdentifier :@"firstView"];
    fVC.recieveString =self.tF_Input.text;
    fVC.delegate=self;
    [self.navigationController pushViewController:fVC animated:YES];
    
}
-(void) clearTextField{
    self.tF_Input.text = @"";

}


@end
