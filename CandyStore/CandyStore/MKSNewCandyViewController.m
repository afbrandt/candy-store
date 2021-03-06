//
//  MKSNewCandyViewController.m
//  CandyStore
//
//  Created by Andrew Brandt on 9/16/14.
//  Copyright (c) 2014 Andrew Brandt. All rights reserved.
//

#import "MKSNewCandyViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface MKSNewCandyViewController ()

@property (weak, nonatomic) IBOutlet UITextField *candyNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextField *xCoordinateString;
@property (weak, nonatomic) IBOutlet UITextField *yCoordinateString;
@property (assign, nonatomic) BOOL newMedia;

- (IBAction)useCamera:(id)sender;
- (IBAction)useCameraRoll:(id)sender;

@end

@implementation MKSNewCandyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) useCamera:(id)sender
{
    if ([UIImagePickerController isSourceTypeAvailable:
           UIImagePickerControllerSourceTypeCamera])
    {
           UIImagePickerController *imagePicker =
             [[UIImagePickerController alloc] init];
           imagePicker.delegate = self;
           imagePicker.sourceType =
             UIImagePickerControllerSourceTypeCamera;
           imagePicker.mediaTypes = @[(NSString *) kUTTypeImage];
           imagePicker.allowsEditing = NO;
           [self presentViewController:imagePicker
             animated:YES completion:nil];
           _newMedia = YES;
     }
}

- (void) useCameraRoll:(id)sender
{
    if ([UIImagePickerController isSourceTypeAvailable:
          UIImagePickerControllerSourceTypeSavedPhotosAlbum])
    {
       UIImagePickerController *imagePicker =
           [[UIImagePickerController alloc] init];
       imagePicker.delegate = self;
       imagePicker.sourceType =
           UIImagePickerControllerSourceTypePhotoLibrary;
        imagePicker.mediaTypes = @[(NSString *) kUTTypeImage];
       imagePicker.allowsEditing = NO;
       [self presentViewController:imagePicker 
           animated:YES completion:nil];
       _newMedia = NO;
    }
}

#pragma mark -
#pragma mark UIImagePickerControllerDelegate

-(void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info
{
   NSString *mediaType = info[UIImagePickerControllerMediaType];

   [self dismissViewControllerAnimated:YES completion:nil];

    if ([mediaType isEqualToString:(NSString *)kUTTypeImage]) {
        UIImage *image = info[UIImagePickerControllerOriginalImage];

        _imageView.image = image;
        if (_newMedia)
            UIImageWriteToSavedPhotosAlbum(image,
               self,
               @selector(image:finishedSavingWithError:contextInfo:),
               nil);
        }
        else if ([mediaType isEqualToString:(NSString *)kUTTypeMovie])
        {
                // Code here to support video if enabled
        }
}

-(void)image:(UIImage *)image
finishedSavingWithError:(NSError *)error
contextInfo:(void *)contextInfo
{
   if (error) {
        UIAlertView *alert = [[UIAlertView alloc]
           initWithTitle: @"Save failed"
           message: @"Failed to save image"
           delegate: nil
           cancelButtonTitle:@"OK"
           otherButtonTitles:nil];
        [alert show];
   }
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
   [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if (self.candyNameLabel) {
        Candy *candy = [Candy createCandyWithContext:self.context];
        NSError *error = nil;
        NSData *imageWrapper;
        
        imageWrapper = UIImageJPEGRepresentation(self.imageView.image, 0.05f);
        
        [candy setCandyName:self.candyNameLabel.text];
        [candy setCandyImage:imageWrapper];
        [candy setCandyXCoordinate: [NSNumber numberWithDouble: [self.xCoordinateString.text doubleValue]]];
        [candy setCandyYCoordinate: [NSNumber numberWithDouble: [self.yCoordinateString.text doubleValue]]];
        
        [self.context insertObject:candy];
        [self.context save:&error];
    }
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
