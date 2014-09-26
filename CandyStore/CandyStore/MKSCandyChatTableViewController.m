//
//  MKSCandyChatTableViewController.m
//  CandyStore
//
//  Created by Andrew Brandt on 9/25/14.
//  Copyright (c) 2014 Andrew Brandt. All rights reserved.
//

#import "MKSCandyChatTableViewController.h"
#import "ChatMessage.h"

@interface MKSCandyChatTableViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textInputField;

@end


@implementation MKSCandyChatTableViewController

const static NSString *URL = @"http://10.0.19.250:3000/chat";

#pragma mark - Controller lifecycle methods

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textInputField.delegate = self;
    self.chatMessages = [NSMutableArray array];
    [self updateChat];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Keyboard lifecycle methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.textInputField) {
        [self postChat:self.textInputField.text];
        self.textInputField.text = @"";
        [self updateChat];
    }
    return NO;
}

/*
- (void)keyboardWillShow:(NSNotification *)notification {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
 
    CGRect frame = self.keyboardToolbar.frame;
    frame.origin.y = self.view.frame.size.height - 260.0;
    self.keyboardToolbar.frame = frame;
 
    [UIView commitAnimations];
}

- (void)keyboardWillHide:(NSNotification *)notification {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
 
    CGRect frame = self.keyboardToolbar.frame;
    frame.origin.y = self.view.frame.size.height;
    self.keyboardToolbar.frame = frame;
 
    [UIView commitAnimations];
}
*/

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // Return the number of rows in the section.
    return [self.chatMessages count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ChatCell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [self.chatMessages[indexPath.row] message];
    
    return cell;
}

#pragma mark - HTTP Request handling

- (void)updateChat {
    NSURL *url = [NSURL URLWithString:URL];

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30.0];
    
    [request setHTTPMethod:@"GET"];
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    NSURLSession *urlSession = [NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:nil];
    
    NSURLSessionDataTask *dataTask = [urlSession dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        NSInteger responseStatusCode = [httpResponse statusCode];
        
        if (responseStatusCode == 200 && data) {
            NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            
            dispatch_async(dispatch_get_main_queue(), ^(void) {
                self.chatMessages = [NSMutableArray arrayWithArray:[ChatMessage buildChatFromJSON:json]];
                [self.tableView reloadData];
            });
        }
        
    }];
    [dataTask resume];
}

- (void)postChat: (NSString *)message {
    NSURL *url = [NSURL URLWithString:URL];
    NSDictionary *chatPayload =  @{@"message": message};
    NSData *chatJson = [NSJSONSerialization dataWithJSONObject:chatPayload options:0 error:nil];

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30.0];
    
    [request setHTTPMethod:@"POST"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    NSURLSession *urlSession = [NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:nil];
    
    NSURLSessionDataTask *dataTask = [urlSession uploadTaskWithRequest:request fromData:chatJson completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        NSInteger responseStatusCode = [httpResponse statusCode];
        
        if (responseStatusCode == 200 && data) {
            NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            
            dispatch_async(dispatch_get_main_queue(), ^(void) {
                self.chatMessages = [NSMutableArray arrayWithArray:[ChatMessage buildChatFromJSON:json]];
                [self.tableView reloadData];
            });
        }
        
    }];
    [dataTask resume];

}

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
