//
//  UIBubbleTableViewCell.m
//
//  Created by Alex Barinov
//  StexGroup, LLC
//  http://www.stexgroup.com
//
//  Project home page: http://alexbarinov.github.com/UIBubbleTableView/
//
//  This work is licensed under the Creative Commons Attribution-ShareAlike 3.0 Unported License.
//  To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/3.0/
//


#import "UIBubbleTableViewCell.h"
#import "NSBubbleData.h"

@implementation UIBubbleTableViewCell

@synthesize dataInternal;

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    [self setDataInternal:dataInternal];
}

- (void)setDataInternal:(NSBubbleDataInternal *)value
{
    dataInternal = value;
    
    if (value.header)
    {
        headerLabel.hidden = NO;
        headerLabel.text = value.header;
    }
    else
    {
        headerLabel.hidden = YES;
    }
    
    NSBubbleType type = value.data.type;
    
    float x = (type == BubbleTypeSomeoneElse) ? 20 : self.frame.size.width - 20 - value.labelSize.width;
    float y = 5 + (value.header ? 30 : 0);
    
    contentLabel.font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
    contentLabel.frame = CGRectMake(x, y, value.labelSize.width, value.labelSize.height);
    contentLabel.text = value.data.text;
    
    if (type == BubbleTypeSomeoneElse)
    {
        bubbleImage.image = [[UIImage imageNamed:@"bubbleSomeone.png"] stretchableImageWithLeftCapWidth:21 topCapHeight:14];        
        bubbleImage.frame = CGRectMake(x - 18, y - 4, value.labelSize.width + 30, value.labelSize.height + 15);
    }
    else {
        bubbleImage.image = [[UIImage imageNamed:@"bubbleMine.png"] stretchableImageWithLeftCapWidth:15 topCapHeight:14];
        bubbleImage.frame = CGRectMake(x - 9, y - 4, value.labelSize.width + 26, value.labelSize.height + 15);
    }
}


@end
