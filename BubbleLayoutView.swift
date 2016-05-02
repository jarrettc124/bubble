//
//  BubbleLayoutView.swift
//  testbubble
//
//  Created by Jarrett Chen on 5/2/16.
//  Copyright © 2016 playground. All rights reserved.
//

import UIKit

class BubbleLayoutView: UIView {

    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    
    var arrowPosition:CGFloat?
    
    override func drawRect(rect: CGRect) {

        var arrowPosition:CGFloat = 0.0
        
        if self.arrowPosition == nil{
            arrowPosition = self.bounds.size.width/2
        }else{
            arrowPosition = self.arrowPosition!
        }
        
        let currentFrame = self.bounds;
        let context:CGContextRef = UIGraphicsGetCurrentContext()!;
        
        let strokeWidth:CGFloat = 3.0;
        let borderRadius:CGFloat = 8.0;
        let horizontalMargin:CGFloat = 20;
        
        let HEIGHTOFPOPUPTRIANGLE:CGFloat = 10;
        let WIDTHOFPOPUPTRIANGLE:CGFloat = 20;
        
        
//        CGContextSetLineJoin(context, kCGLineJoinRound);
        CGContextSetLineWidth(context, strokeWidth);
        CGContextSetStrokeColorWithColor(context, UIColor.redColor().CGColor);
        CGContextSetFillColorWithColor(context,UIColor.purpleColor().CGColor );
        
        // Draw and fill the bubble
        CGContextBeginPath(context);
        CGContextMoveToPoint(context, borderRadius + strokeWidth + horizontalMargin, strokeWidth + HEIGHTOFPOPUPTRIANGLE + 0.5);
        CGContextAddLineToPoint(context, round(arrowPosition - WIDTHOFPOPUPTRIANGLE / 2.0) + 0.5, HEIGHTOFPOPUPTRIANGLE + strokeWidth + 0.5);
        CGContextAddLineToPoint(context, round(arrowPosition) + 0.5, strokeWidth + 0.5);
        CGContextAddLineToPoint(context, round(arrowPosition + WIDTHOFPOPUPTRIANGLE / 2.0) + 0.5, HEIGHTOFPOPUPTRIANGLE + strokeWidth + 0.5);
        
        
        CGContextAddArcToPoint(context, currentFrame.size.width - strokeWidth - horizontalMargin, strokeWidth + HEIGHTOFPOPUPTRIANGLE + 0.5, currentFrame.size.width - strokeWidth - 0.5, currentFrame.size.height - strokeWidth - 0.5, borderRadius - strokeWidth);
        CGContextAddArcToPoint(context, currentFrame.size.width - strokeWidth - horizontalMargin, currentFrame.size.height - strokeWidth - 0.5, round(currentFrame.size.width / 2.0 + WIDTHOFPOPUPTRIANGLE / 2.0) - strokeWidth + 0.5, currentFrame.size.height - strokeWidth - 0.5, borderRadius - strokeWidth);
        
        CGContextAddArcToPoint(context, strokeWidth + horizontalMargin, currentFrame.size.height - strokeWidth - 0.5, strokeWidth + 0.5, HEIGHTOFPOPUPTRIANGLE + strokeWidth + 0.5, borderRadius - strokeWidth);
        
        CGContextAddArcToPoint(context, strokeWidth + horizontalMargin, strokeWidth + HEIGHTOFPOPUPTRIANGLE + 0.5, currentFrame.size.width - strokeWidth - 0.5, HEIGHTOFPOPUPTRIANGLE + strokeWidth + 0.5, borderRadius - strokeWidth);
        CGContextClosePath(context);
        CGContextDrawPath(context, .FillStroke)
        
        // Draw a clipping path for the fill
        CGContextBeginPath(context);
        CGContextMoveToPoint(context, borderRadius + strokeWidth + 0.5, round((currentFrame.size.height + HEIGHTOFPOPUPTRIANGLE) * 0.50) + 0.5);
        CGContextAddArcToPoint(context, currentFrame.size.width - strokeWidth - 0.5, round((currentFrame.size.height + HEIGHTOFPOPUPTRIANGLE) * 0.50) + 0.5, currentFrame.size.width - strokeWidth - 0.5, currentFrame.size.height - strokeWidth - 0.5, borderRadius - strokeWidth);
        CGContextAddArcToPoint(context, currentFrame.size.width - strokeWidth - 0.5, currentFrame.size.height - strokeWidth - 0.5, round(currentFrame.size.width / 2.0 + WIDTHOFPOPUPTRIANGLE / 2.0) - strokeWidth + 0.5, currentFrame.size.height - strokeWidth - 0.5, borderRadius - strokeWidth);
        CGContextAddArcToPoint(context, strokeWidth + 0.5, currentFrame.size.height - strokeWidth - 0.5, strokeWidth + 0.5, HEIGHTOFPOPUPTRIANGLE + strokeWidth + 0.5, borderRadius - strokeWidth);
        CGContextAddArcToPoint(context, strokeWidth + 0.5, round((currentFrame.size.height + HEIGHTOFPOPUPTRIANGLE) * 0.50) + 0.5, currentFrame.size.width - strokeWidth - 0.5, round((currentFrame.size.height + HEIGHTOFPOPUPTRIANGLE) * 0.50) + 0.5, borderRadius - strokeWidth);
        CGContextClosePath(context);
        CGContextClip(context);
    }


    override init(frame: CGRect) {
        super.init(frame: frame)
        self.opaque = true
        self.backgroundColor = UIColor.clearColor()
    }
    
    convenience init(){
        self.init(frame:CGRect.zero)
        self.opaque = true
        self.backgroundColor = UIColor.clearColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

    }
    
    
}
