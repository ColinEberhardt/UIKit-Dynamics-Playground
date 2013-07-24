//
//  ViewController.m
//  DynamicsPlayground
//
//  Created by Colin Eberhardt on 24/07/2013.
//  Copyright (c) 2013 Colin Eberhardt. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    UIDynamicAnimator* _animator;
    UIGravityBehavior* _gravity;
    UICollisionBehavior* _collision;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIView* square = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    square.backgroundColor = [UIColor grayColor];
    [self.view addSubview:square];
    
    UIView* barrier = [[UIView alloc] initWithFrame:CGRectMake(0, 300, 130, 20)];
    barrier.backgroundColor = [UIColor redColor];
    [self.view addSubview:barrier];
    
    _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    _gravity = [[UIGravityBehavior alloc] initWithItems:@[square]];
    [_animator addBehavior:_gravity];
    
    _collision = [[UICollisionBehavior alloc] initWithItems:@[square, barrier]];
    _collision.translatesReferenceBoundsIntoBoundary = YES;
    [_animator addBehavior:_collision];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
