//
//  XHMineTableViewController.m
//  XinHeEdu
//
//  Created by xing on 15/6/5.
//  Copyright (c) 2015年 xing. All rights reserved.
//

#import "XHMineTableViewController.h"
#import "XHMine.h"
#import "XHTitle2ContentTableViewCell.h"
#import "XHMineIconTableViewCell.h"
#import "XHMineIconTableViewCell.h"
@interface XHMineTableViewController ()<XHMineIconTableViewCellDelegate,UIImagePickerControllerDelegate>
@property (nonatomic,strong)NSMutableArray *dataList;
@property (nonatomic,weak)UIButton *iconBtn;
@end

@implementation XHMineTableViewController
-(NSMutableArray *)dataList {
    if (_dataList ==nil) {
        _dataList = [NSMutableArray array];
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"Mine" ofType:@"json"];
        NSData *data = [NSData dataWithContentsOfFile:path];
        NSMutableArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        
        for (NSDictionary *dict  in array) {
            [_dataList addObject:[XHMine mineWithDict:dict]];
        }
    }
    return _dataList;
}
- (instancetype)initWithStyle:(UITableViewStyle)style {
    
    return [super initWithStyle:UITableViewStyleGrouped];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",self.dataList);
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 代理方法
-(void)iconClickWithCell:(XHMineIconTableViewCell *)cell{
    NSLog(@"delegate click");
//    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
//        
//        UIImagePickerController * cameraPicker = [[UIImagePickerController alloc] init];
//        cameraPicker.delegate = self;
//        cameraPicker.allowsEditing = YES;
//        cameraPicker.sourceType = UIImagePickerControllerSourceTypeCamera;
//        //  相机的调用为照相模式
//        cameraPicker.cameraCaptureMode = UIImagePickerControllerCameraCaptureModePhoto;
//        //  设置为NO则隐藏了拍照按钮
//        cameraPicker.showsCameraControls = YES;
//        //  设置相机摄像头默认为前置
//        cameraPicker.cameraDevice = UIImagePickerControllerCameraDeviceFront;
//        //  设置相机闪光灯开关
//        cameraPicker.cameraFlashMode = UIImagePickerControllerCameraFlashModeAuto;
//        //  用来设置覆盖在你照相图像上,可以自定义位置或图片(类似美图秀秀加个小猫小狗小花修饰)
//        //cameraPicker.cameraOverlayView
//        //  用来修改拍照相框
//        //cameraPicker.cameraViewTransform
//        [self presentViewController:cameraPicker animated:YES completion:nil];
//        
//    } else {
//        
//        NSLog(@"当前设备不支持相机调用");
//        
//    }

    UIImagePickerController *pc = [[UIImagePickerController alloc]init];
    pc.delegate = self;
    pc.allowsEditing = NO;
    //pc.allowsImageEditing = NO;
    pc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:pc animated:YES completion:nil];
}
-(void) imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info{
    UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    UIImageView *iview = [[UIImageView alloc] initWithImage:image];
//    [self.view addSubview:iview];/
    [self.iconBtn setImage:image forState:UIControlStateNormal];
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark - Table view data source
//
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 2;
            break;
        default:
            break;
    }
    
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    XHTitle2ContentTableViewCell *cell =[XHTitle2ContentTableViewCell titleContentCellWithTableView:tableView];
    XHMine *mine = self.dataList[0];
    cell.showLine = NO;
    NSString *sexContent = @"";
    switch (mine.sex) {
        case 0:
            sexContent  = @"男";
            break;
        case 1:
            sexContent  = @"女";
            break;
        default:
            break;
    }
    
    if (indexPath.section ==0 && indexPath.row ==0) {
        
        XHMineIconTableViewCell *cell = [XHMineIconTableViewCell  CellView];
        cell.delegate =self;
        cell.mine = mine;
        self.iconBtn = cell.icon ;
        return cell;
    }else
        if (indexPath.section == 1 &&indexPath.row == 0) {
        //使用title - content 显示的cell ，使用模型快速创建
        XHTitle2Content *model = [XHTitle2Content modelWithTitle:@"地区" content:mine.city];
        cell.title2Content = model;
        cell.showLine = YES;
    }else
        if(indexPath.section == 1 &&indexPath.row == 1){
        XHTitle2Content *model = [XHTitle2Content modelWithTitle:@"性别" content:sexContent];
        cell.title2Content = model;
    }
    // Configure the cell...
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return 110;
    }else {
        return 60;
    }
}
//}
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
 #pragma mark - Table view delegate
 
 // In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
 - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
 // Navigation logic may go here, for example:
 // Create the next view controller.
 <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
 
 // Pass the selected object to the new view controller.
 
 // Push the view controller.
 [self.navigationController pushViewController:detailViewController animated:YES];
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
