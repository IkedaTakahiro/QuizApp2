//
//  ViewController.m
//  QuizApp2
//
//  Created by 池田享浩 on 2015/12/15.
//  Copyright (c) 2015年 takahiro ikeda. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController (){

    NSInteger count;
    NSInteger tensuu;
    NSString *soundFileName;
    NSTimer *timer;
}

@property (strong, nonatomic) AVAudioPlayer *player;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    count = 1;
    
    [self initialize];
    
    
}

-(void)initialize{
    tensuu = 0;
    self.daimei.text = @"第1問";
    self.mondaibun.text = @"ルフィに麦わら帽子をくれたのは、四皇のひとり「シャンクス」である。";
    self.mondaibun.font = [UIFont systemFontOfSize:12.0];
    self.mondaibun.editable = NO;
    self.nextbuttonp.hidden = YES;
    self.mbuttonp.hidden = NO;
    self.bbuttonp.hidden = NO;
}

-(void)mbutton:(id)sender{
    self.nextbuttonp.hidden = NO;
    self.mbuttonp.hidden = YES;
    self.bbuttonp.hidden = YES;
    switch (count) {
        case 1:
            self.mondaibun.text = @"正解！";
            [self seikai];
            tensuu++;
            break;
        case 2:
            self.mondaibun.text = @"正解！";
            [self seikai];
            tensuu++;
            break;
        case 3:
            self.mondaibun.text = @"正解！";
            [self seikai];
            tensuu++;
            break;
        case 4:
            self.mondaibun.text = @"正解！";
            [self seikai];
            tensuu++;
            break;
        case 5:
            self.mondaibun.text = @"正解！";
            [self seikai];
            tensuu++;
            break;
        default:
            break;
            
    }
    count++;
}

-(void)bbutton:(id)sender{
    self.nextbuttonp.hidden = NO;
    self.mbuttonp.hidden = YES;
    self.bbuttonp.hidden = YES;
    switch (count) {
        case 1:
            self.mondaibun.text = @"残念！";
            [self huseikai];
            break;
        case 2:
            self.mondaibun.text = @"残念！";
            [self huseikai];
            break;
        case 3:
            self.mondaibun.text = @"残念！";
            [self huseikai];
            break;
        case 4:
            self.mondaibun.text = @"残念！";
            [self huseikai];
            break;
        case 5:
            self.mondaibun.text = @"残念！";
            [self huseikai];
            break;
        default:
            break;
            
    }
    count++;
}

-(void)nextbutton:(id)sender{
    if(count<=5){
    self.nextbuttonp.hidden = YES;
    self.mbuttonp.hidden = NO;
    self.bbuttonp.hidden = NO;
    }
        switch(count){
        case 2:
            self.daimei.text = @"第２問";
            self.mondaibun.text = @"ルフィの最初の懸賞金は、３０００万ベリーである。";
            break;
        case 3:
            self.daimei.text = @"第3問";
            self.mondaibun.text = @"ルフィの食べた悪魔の実は、ゴムゴムの実である。";
            break;
        case 4:
            self.daimei.text = @"第4問";
            self.mondaibun.text = @"ルフィの父親は、ドラゴンである。";
            break;
        case 5:
            self.daimei.text = @"第5問";
            self.mondaibun.text = @"ルフィの誕生日は、５月５日である。。";
            break;
        case 6:
            self.daimei.text = nil;
            NSInteger kekka = tensuu*100/5;
            self.mondaibun.text = [NSString stringWithFormat:@"正解率%ld%%です。最初に戻ります。",(long)kekka];
            count++;
            break;
        default:
            count = 1;
            [self initialize];
            break;
    }
    
    
}

-(void)seikai{
    soundFileName = [NSString stringWithFormat:@"maru"];
    [self playsound];
    timer =[NSTimer scheduledTimerWithTimeInterval:2.0  target:self selector:@selector(tick:) userInfo:nil repeats:NO];
}

-(void)huseikai{
    soundFileName = [NSString stringWithFormat:@"batu"];
    [self playsound];
    timer =[NSTimer scheduledTimerWithTimeInterval:2.0  target:self selector:@selector(tick:) userInfo:nil repeats:NO];
}


-(void)tick:(NSTimer*)timer{
    [self stop];
    NSLog(@"stop実行");
   }

-(void)stop{
    [self.player stop];
}

- (void)playsound{
    //音楽ファイルのファイルパス(音楽ファイルがデータ上どこにあるか)を作成
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *path = [bundle pathForResource:soundFileName ofType:@"m4a"];
    NSURL *url = [NSURL fileURLWithPath:path];
    //エラーを受け取る変数の準備
    NSError *error = nil;
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    if (error != nil) { //エラーがあった場合
        return;
    }
    [self.player play];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
