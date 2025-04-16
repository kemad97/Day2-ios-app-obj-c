//
//  RegisterViewController.m
//  Day2 ios app
//
//  Created by Kerolos on 16/04/2025.
//

#import "RegisterViewController.h"
#import "TableViewController.h"
#import "LoginViewController.h"

@interface RegisterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneLabel;
@property (weak, nonatomic) IBOutlet UITextField *passLabel;
@property (weak, nonatomic) IBOutlet UITextField *conPassLabel;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Register";

}
 -(BOOL)registerUser:(NSString *)phone password:(NSString *)password {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
     if([userDefaults objectForKey:phone] != nil)
     {
         return NO; //user exist
     }
     
     [userDefaults setObject:password forKey:phone];
     [userDefaults synchronize];
     return YES;

}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)btnGoToLoginPage:(id)sender {
    LoginViewController *loginVC =[self.storyboard instantiateViewControllerWithIdentifier:@"logID"];
    [self.navigationController pushViewController:loginVC animated:YES];
}
- (IBAction)btnRegisterUser:(id)sender {
    
    
    if([self.phoneLabel.text length]==0 || [self.passLabel.text length]==0 )
    {
        [self showAlertWithMessage:@"Please check your phone or password"];
        return;
    }
    if (![self.passLabel.text  isEqualToString: self.conPassLabel.text])
    {
        [self showAlertWithMessage:@"Passwords doesnnot match"];
        return;

    }
    
    if ([self registerUser :self.phoneLabel.text password:self.passLabel.text]) {
            [self navigateToTableView];
        
    } else {
        [self showAlertWithMessage:@"User already exists with this phone number go to login page"];
    }

}


- (void)showAlertWithMessage:(NSString *)message {
    [self showAlertWithMessage:message completion:nil];
}

- (void)showAlertWithMessage:(NSString *)message completion:(void (^)(void))completion {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Message"
                                                                  message:message
                                                           preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK"
                                                      style:UIAlertActionStyleDefault
                                                    handler:^(UIAlertAction * _Nonnull action) {
                                                        if (completion) {
                                                            completion();
                                                        }
                                                    }];
    [alert addAction:okAction];
    [self presentViewController:alert animated:YES completion:nil];
}


- (void)navigateToTableView {
    
    TableViewController *tableVC = [self.storyboard instantiateViewControllerWithIdentifier:@"tableID"];
    [self.navigationController pushViewController:tableVC animated:YES];
}


@end
