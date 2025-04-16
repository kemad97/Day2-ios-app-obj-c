//
//  LoginViewController.m
//  Day2 ios app
//
//  Created by Kerolos on 16/04/2025.
//

#import "LoginViewController.h"
#import "TableViewController.h"
#import "RegisterViewController.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneLabel;
@property (weak, nonatomic) IBOutlet UITextField *passLabel;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}



-(BOOL)loginUser :(NSString*)phone password:(NSString*)password {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];;
    
    NSString* savedPassword = [userDefaults objectForKey:phone];
    if(savedPassword ==nil)
    {
        return NO;
    }
    BOOL isPassMatched = [savedPassword isEqualToString:password];
    
    return isPassMatched;
}

-(void)showAlertWithMessage:(NSString *)message {
   UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Message"
                                                                 message:message
                                                          preferredStyle:UIAlertControllerStyleAlert];
   
   UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK"
                                                     style:UIAlertActionStyleDefault
                                                   handler:nil];
   [alert addAction:okAction];
   [self presentViewController:alert animated:YES completion:nil];
}



- (IBAction)btnLogin:(id)sender {
    if([_phoneLabel.text length]==0 || [_passLabel.text length]==0)
    {
        [self showAlertWithMessage:@"Please check yor phone or pass"];
    }
    
    if([self loginUser:_phoneLabel.text password:_passLabel.text] )
    {
        [self navToTableView];
    }
    else
    {
        [self showAlertWithMessage:@"Invallid phone or pass"];
    }
    
}


-(void)navToTableView {
    TableViewController *tableVC = [self.storyboard instantiateViewControllerWithIdentifier:@"tableID"];
    
    [self.navigationController pushViewController:tableVC animated:YES];

}
@end
