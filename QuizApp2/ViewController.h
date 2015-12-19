//
//  ViewController.h
//  QuizApp2
//
//  Created by 池田享浩 on 2015/12/15.
//  Copyright (c) 2015年 takahiro ikeda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

-(IBAction)mbutton:(id)sender;
-(IBAction)bbutton:(id)sender;
-(IBAction)nextbutton:(id)sender;

@property(nonatomic,weak)IBOutlet UILabel *daimei;
@property(nonatomic,weak)IBOutlet UITextView *mondaibun;
@property(nonatomic,weak)IBOutlet UIButton *nextbuttonp;
@property(nonatomic,weak)IBOutlet UIButton *mbuttonp;
@property(nonatomic,weak)IBOutlet UIButton *bbuttonp;

@end

