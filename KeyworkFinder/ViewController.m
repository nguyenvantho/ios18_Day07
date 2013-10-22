//
//  ViewController.m
//  KeyworkFinder
//
//  Created by MAC on 10/21/13.
//  Copyright (c) 2013 ios18. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)checkPutin:(id)sender {
    //tap hop 100 tu xuat hien nhieu nhat trong tieng anh, nguon: wiki
    NSArray *mostUsedWord = @[@"the",@"be",@"to",@"of",@"and",@"a",@"in",@"that",@"have",@"i",@"it",@"for",@"not",@"on",@"with",@"he",@"as",@"you",@"do",@"at",@"this",@"but",@"his",@"by",@"from",@"they",@"we",@"say",@"her",@"she",@"or",@"an",@"will",@"my",@"one",@"all",@"would",@"there",@"their",@"what",@"so",@"up",@"out",@"if",@"about",@"who",@"get",@"which",@"go",@"me",@"when",@"make",@"can",@"like",@"time",@"no",@"just",@"him",@"know",@"take",@"people",@"into",@"year",@"your",@"good",@"some",@"could",@"them",@"see",@"other",@"than",@"then",@"now",@"look",@"only",@"come",@"its",@"over",@"think",@"also",@"back",@"after",@"use",@"two",@"how",@"our",@"work",@"first",@"well",@"way",@"even",@"new",@"want",@"because",@"any",@"these",@"give",@"day",@"most",@"us",@"The", @"is",@"It",@"I",@"are",@"This",@"We",@"was",@"has",@"must"];
    
    //Doc file tu du lieu vao mot chuoi
    NSURL *fileURL = [[NSBundle mainBundle] URLForResource:@"putin" withExtension:@"txt"];
//    NSMutableString *totalValues = [NSMutableString stringWithContentsOfURL:fileURL encoding:NSASCIIStringEncoding error:nil];
    
        NSMutableString *totalValues = [NSMutableString stringWithContentsOfURL:fileURL encoding:NSUTF8StringEncoding error:nil];
    

    //Xoa cac dau cau khoi van ban
    //xoa dau cham
    [totalValues setString: [totalValues stringByReplacingOccurrencesOfString:@"." withString:@""]];
    //xoa dau phay
    [totalValues setString: [totalValues stringByReplacingOccurrencesOfString:@"," withString:@""]];
    //xoa dau cham phay
    [totalValues setString: [totalValues stringByReplacingOccurrencesOfString:@";" withString:@""]];
    //xoa dau xuong dong
    [totalValues setString: [totalValues stringByReplacingOccurrencesOfString:@"\n" withString:@""]];
    //xoa dau gach ngang
    [totalValues setString: [totalValues stringByReplacingOccurrencesOfString:@"-" withString:@""]];
    
    
    
//    NSLog(@"Doc file ok, replace: %@", totalValues);
    
    //Tach toan bo van ban thanh mot tap hop cac tu, phan cach nhau boi dau "space"
    NSArray *array = [totalValues componentsSeparatedByString:@" "];
    
    NSMutableArray *result = [[NSMutableArray alloc] init];
    NSMutableArray *conuter = [[NSMutableArray alloc] init];

    
    NSNumber *tmp = [NSNumber new];
    
    int index;
    int num;
    
    for (NSObject *obj in array) {
        //Khong dem nhung tu thong dung
        if([mostUsedWord containsObject:obj]){
//            NSLog(@"mostUsedWord replace: %@", obj);
            continue;
        }
        //Neu tu nay da co trong danh sach ket qua
        if([result containsObject:obj]){
            //Tim vi tri cua no trong danh sach
            index = [result indexOfObject:obj];
   
            //tang gia tri tuong ung trong counter
            tmp = conuter[index];
            num = [tmp intValue];
            num++;
            conuter[index] = [NSNumber numberWithInteger:num];
                               
        }//Truong hop chua dua vao danh sach
        else{
            //them mot bien trong mang ket qua
            [result addObject:obj];
            //them mot bien trong mang chi so
            NSNumber *newNumber = [NSNumber numberWithInteger:1];
            [conuter addObject:newNumber];
        }
        
    }

    for (int i = 30; i > 2; i--) {
        NSNumber *number = [NSNumber numberWithInteger:i];
        
        if([conuter containsObject:number]){
            for(int j = 0; j < [conuter count]; j++){
                if(i == [conuter[j] intValue]){
                  //In gia tri keyword
                    NSLog(@"Tu khoa: %@ So lan xuat hien: %i", result[j], i);
                }
            }
        }
        
    }
//    NSLog(@"mostUsedWord replace: %@", conuter);
    //Dem so luong xuat hien cac tu
    
    //loai cac tu thong dung
    
    //Sap xep cac tu khoa
}


@end
