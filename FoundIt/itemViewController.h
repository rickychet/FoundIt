//
//  itemViewController.h
//  FoundIt
//
//  Created by Yuqian Chen on 4/28/14.
//  Copyright (c) 2014 Yuqian Chen. All rights reserved.
//

#import "ViewController.h"

@interface itemViewController : ViewController<UIPickerViewDelegate,UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIPickerView *picker;


@end
