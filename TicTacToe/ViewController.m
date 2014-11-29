//
//  ViewController.m
//  TicTacToe
//
//  Created by Lukas Schmid on 28.11.14.
//  Copyright (c) 2014 Haligaliman GmbH. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *lab;

@property int turn;
@property int moves;
@property int i;

@property NSMutableString* name1;
@property NSMutableString* name2;
@property NSMutableString* win;
@property NSMutableString* win1;
@property NSMutableString* win2;

@property NSMutableArray* btnlist;

@property UIImage* img;

@property Boolean active;

@property (weak, nonatomic) IBOutlet UIButton *ol;
@property (weak, nonatomic) IBOutlet UIButton *om;
@property (weak, nonatomic) IBOutlet UIButton *or;
@property (weak, nonatomic) IBOutlet UIButton *ml;
@property (weak, nonatomic) IBOutlet UIButton *mm;
@property (weak, nonatomic) IBOutlet UIButton *mr;
@property (weak, nonatomic) IBOutlet UIButton *ul;
@property (weak, nonatomic) IBOutlet UIButton *um;
@property (weak, nonatomic) IBOutlet UIButton *ur;

@property (weak, nonatomic) IBOutlet UITextField *txt1;
@property (weak, nonatomic) IBOutlet UITextField *txt2;


@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    self.lab.text = @"Player 1";
    self.turn = 1;
    self.moves = 0;
    self.active = true;
    
    
    self.name1 = [[NSMutableString alloc]init];
    self.name2 = [[NSMutableString alloc]init];
    self.win = [[NSMutableString alloc]init];
    self.win1 = [[NSMutableString alloc]init];
    self.win2 = [[NSMutableString alloc]init];
    [self.name1 setString: @"Player 1"];
    [self.name2 setString: @"Player 2"];
    [self.win setString: @" wins"];
    
    //list of all buttons
    self.btnlist = [[NSMutableArray alloc] init];
    self.btnlist[0] = self.ol ;
    self.btnlist[1] = self.om ;
    self.btnlist[2] = self.or ;
    self.btnlist[3] = self.ml ;
    self.btnlist[4] = self.mm ;
    self.btnlist[5] = self.mr ;
    self.btnlist[6] = self.ul ;
    self.btnlist[7] = self.um ;
    self.btnlist[8] = self.ur ;
    // Do any additional setup after loading the view, typically from a nib.
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}


- (IBAction)name1change:(id)sender {
    [self.name1 setString:self.txt1.text ];
    self.lab.text = self.name1;
}

- (IBAction)name2change:(id)sender {
    [self.name2 setString:self.txt2.text ];
}



- (IBAction)olt:(id)sender {
    self.moves = self.moves+1;
    
    if (self.active == true) {
        self.txt1.enabled = false;
        self.txt2.enabled = false;
        
    // set according image
    if (self.turn == 1) {
        
        self.img = [UIImage imageNamed:@"RedCircle.png"];
        self.turn = 2;
        self.lab.text = self.name2;
    }
    else {
        self.img = [UIImage imageNamed:@"BlueCross.png"];
        self.turn = 1;
        self.lab.text = self.name1;
    };
    
    [sender setImage:self.img forState:UIControlStateNormal];
    [sender setEnabled:FALSE];
    
    [self.view addSubview:sender];
    
    // All moves done
    if (self.moves == 9) {
        self.lab.text = @"draw";
    }
    
    
    
    if (
        //Horizontal
        ([self.om.currentImage isEqual:self.ol.currentImage] && [self.om.currentImage isEqual:self.or.currentImage])
        ||
        ([self.mm.currentImage isEqual:self.ml.currentImage] && [self.mm.currentImage isEqual:self.mr.currentImage])
        ||
        ([self.um.currentImage isEqual:self.ul.currentImage] && [self.um.currentImage isEqual:self.ur.currentImage])
        ||
        
        //Vertikal
        ([self.mm.currentImage isEqual:self.om.currentImage] && [self.mm.currentImage isEqual:self.um.currentImage])
        ||
        ([self.ol.currentImage isEqual:self.ml.currentImage] && [self.ol.currentImage isEqual:self.ul.currentImage])
        ||
        ([self.mr.currentImage isEqual:self.or.currentImage] && [self.mr.currentImage isEqual:self.ur.currentImage])
        //Diagonal
        ||
        ([self.mm.currentImage isEqual:self.ol.currentImage] && [self.mm.currentImage isEqual:self.ur.currentImage])
        ||
        ([self.mm.currentImage isEqual:self.ul.currentImage] && [self.mm.currentImage isEqual:self.or.currentImage])
        
        
        ) {
        if (self.turn == 2) {
            self.win1 = self.name1;
            [self.win1 appendString:self.win];
            self.lab.text = self.win1;
            self.active = false;
        } else {
            self.win2 = self.name2;
            [self.win2 appendString:self.win];
            self.lab.text = self.win2;
            self.active = false;
        };
    };
    };
}

- (IBAction)reset:(id)sender {
    self.active = true;
    self.win1 = nil;
    self.win2 = nil;
    self.txt1.enabled = true;
    self.txt2.enabled = true;
    [self.name1 setString: @"Player 1"];
    [self.name2 setString: @"Player 2"];
    self.lab.text = @"Player 1";
    self.turn = 1;
    self.moves = 0;
    for (int j=0;j<=8;j++){
        [[self.btnlist objectAtIndex:j] setImage:nil forState:UIControlStateNormal];
        [[self.btnlist objectAtIndex:j] setEnabled:true];
        
    }
}

- (IBAction)delete:(id)sender {
    self.txt1.text = nil;
    self.txt2.text = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
