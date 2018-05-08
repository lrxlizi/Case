//
//  TonePlayerSimple.m
//  SportChina
//
//  Created by 栗子 on 2017/7/13.
//  Copyright © 2017年 Beijing Sino Dance Culture Media Co.,Ltd. All rights reserved.
//

#import "TonePlayerSimple.h"

@interface TonePlayerSimple ()<AVAudioPlayerDelegate>

{
    AVAudioPlayer *player;
    AVAudioPlayer *morePlayer;
    NSInteger      index;
}

@end


@implementation TonePlayerSimple

+(TonePlayerSimple *)tonePlayer{
    
    static TonePlayerSimple *tonePlayerSimple = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tonePlayerSimple = [[TonePlayerSimple alloc]init];
      
    });
    return tonePlayerSimple;

}

-(void)successPlay{
   
    _vedios = @[@"media_clock_succ.mp3",@"clock_succ.mp3"];
    index = 0;
    [self playerMore];
}
-(void)dingPlay
{
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"media_clock_succ.mp3" withExtension:nil];
    [self playerUrl:url];
}
-(void)failurePlay{
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"FuiledSound.mp3" withExtension:nil];
    [self playerUrl:url];
}

- (void)answerFailurePlay
{
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"media_clock_error.mp3" withExtension:nil];
    [self playerUrl:url];
}

-(void)playerUrl:(NSURL *)url{

   
    //.设置静音模式依然播放
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    [audioSession setCategory:AVAudioSessionCategoryPlayback error:nil];
    [audioSession setActive:YES error:nil];
   
    player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    //初始音量大小
    player.volume = 1;
    ///循环次数
    player.numberOfLoops = 0;
    player.delegate = self;
    // 准备播放
    if([player prepareToPlay]) {
        [player play];
    }


}
- (void)setVedios:(NSArray *)vedios
{
    _vedios = vedios;
    index = 0;
    [self playerMore];
}
-(void)playerMore{
  
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    [audioSession setCategory:AVAudioSessionCategoryPlayback error:nil];
    [audioSession setActive:YES error:nil];
     NSURL *url = [[NSBundle mainBundle] URLForResource:_vedios[index] withExtension:nil];
    morePlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    morePlayer.delegate = self;
    //初始音量大小
    morePlayer.volume = 1;
    ///循环次数
    morePlayer.numberOfLoops = 0;
    // 准备播放
    if([morePlayer prepareToPlay]) {
        [morePlayer play];
    }
}
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    
    
    
//    if (index < _vedios.count)
//    {
//        if (index == 0)
//        {
//            index = 1;
//        }
//        [self playerMore];
//        index++;
//
//    }else {
//        if ([self.linePlayerComplete isEqualToString:@"line"]) {
//             self.linePlayerComplete = @"";
//
//        }
//    }
    NSError *error;
     [[AVAudioSession sharedInstance] setActive:NO withOptions:AVAudioSessionSetActiveOptionNotifyOthersOnDeactivation error:&error];
    
    
}
//暂停播放
-(void)pausePlay{
    if (player.playing) {
         [player pause];
         [player stop];
    }
    if (morePlayer.isPlaying) {
         [morePlayer pause];
        [morePlayer stop];
    }
   
}

@end
