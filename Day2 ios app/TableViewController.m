//
//  TableViewController.m
//  Day2 ios app
//
//  Created by Kerolos on 15/04/2025.
//

#import "TableViewController.h"
#import "ColleagueViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.maleNames = [[NSMutableArray alloc] init];
    self.femaleNames = [[NSMutableArray alloc] init];



//
//    self.maleNames = [[NSMutableArray alloc] init];
//    [self.maleNames addObject:@"kerolos"];
//    [self.maleNames addObject:@"7zn"];
//    [self.maleNames addObject:@"ewida"];
//    [self.maleNames addObject:@"Joe"];
//
//    self.femaleNames = [[NSMutableArray alloc] init];
//    [self.femaleNames addObject:@"Sarah"];
//    [self.femaleNames addObject:@"Aya"];
//    [self.femaleNames addObject:@"Arwa"];
//
    
    Colleague *kerolos = [[Colleague alloc] init];
        kerolos.name = @"Kerolos";
        kerolos.age = 24;
        kerolos.phone = @"01223265654";
        kerolos.address = @"Cairo";
        [self.maleNames addObject:kerolos];
        
        Colleague *hzn = [[Colleague alloc] init];
        hzn.name = @"7zn";
        hzn.age = 25;
        hzn.phone = @"012021651645";
        hzn.address = @" Alex";
        [self.maleNames addObject:hzn];
        
        Colleague *ewida = [[Colleague alloc] init];
        ewida.name = @"Ewida";
        ewida.age = 26;
        ewida.phone = @"010255455556";
        ewida.address = @"Giza";
        [self.maleNames addObject:ewida];
    
    
    Colleague *sarah = [[Colleague alloc] init];
    sarah.name = @"Sarah";
    sarah.age = 25;
    sarah.phone = @"011548456564";
    sarah.address = @"cairo";
    [self.femaleNames addObject:sarah];
    
    Colleague *aya = [[Colleague alloc] init];
    aya.name = @"Aya";
    aya.age = 27;
    aya.phone = @"04545486564";
    aya.address = @"alex";
    [self.femaleNames addObject:aya];


    
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;



    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
switch(section)
{
    case 0:
        return _maleNames.count;
        break;
        
    case 1:
        return _femaleNames.count;
        break;
    default:
        return 0;
}

}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch(section)
    {
        case 0:
            return @"Males";
            break;
            
        case 1:
            return @"Females";
            break;
        default:
            return @"Err";
    }
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    Colleague *colleague;


    switch(indexPath.section)
    {
        case 0:
            colleague = self.maleNames[indexPath.row];
            cell.textLabel.text = colleague.name; // Use the name property of Colleague
            break;
            
        case 1:
            colleague=self.femaleNames[indexPath.row];
            cell.textLabel.text=colleague.name;
            break;
        default:break;
            
    }
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
            if (indexPath.section == 0) {
                [self.maleNames removeObjectAtIndex:indexPath.row];
            } else {
                [self.femaleNames removeObjectAtIndex:indexPath.row];
            }
            
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        }

    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ColleagueViewController *detailsVC = [self.storyboard instantiateViewControllerWithIdentifier:@"colleagueIViewID" ];

    switch(indexPath.section)
    {
        case 0:
            detailsVC.colleague =self.maleNames[indexPath.row];
            break;
            
        case 1:
            detailsVC.colleague =self.femaleNames[indexPath.row];
            break;
        default:break;
            
    }
    [self.navigationController pushViewController:detailsVC animated:YES];
    
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
