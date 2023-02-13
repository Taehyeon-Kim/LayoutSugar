//
//  LayoutItem.swift
//  
//
//  Created by taekki on 2023/02/14.
//

import UIKit

public struct LayoutItem {
    let view: UIView
    
    let top: (target: UIView, relation: Relation, size: CGFloat)?
    let bottom: (target: UIView, relation: Relation, size: CGFloat)?
    let leading: (target: UIView, relation: Relation, size: CGFloat)?
    let trailing: (target: UIView, relation: Relation, size: CGFloat)?
    
    let side: (target: UIView, size: CGFloat)?
    
    let width: CGFloat?
    let height: CGFloat?
    
    let center: (target: UIView, relation: Relation)?
    let centerX: (target: UIView, relation: Relation)?
    let centerY: (target: UIView, relation: Relation)?
    
    public init(
        _ view: UIView,
        top: (target: UIView, relation: Relation, size: CGFloat)? = nil,
        bottom: (target: UIView, relation: Relation, size: CGFloat)? = nil,
        leading: (target: UIView, relation: Relation, size: CGFloat)? = nil,
        trailing: (target: UIView, relation: Relation, size: CGFloat)? = nil,
        side: (target: UIView, size: CGFloat)? = nil,
        width: CGFloat? = nil,
        height: CGFloat? = nil,
        center: (target: UIView, relation: Relation)? = nil,
        centerX: (target: UIView, relation: Relation)? = nil,
        centerY: (target: UIView, relation: Relation)? = nil
    ) {
        self.view = view
        self.top = top
        self.bottom = bottom
        self.leading = leading
        self.trailing = trailing
        self.side = side
        self.width = width
        self.height = height
        self.center = center
        self.centerX = centerX
        self.centerY = centerY
    }
}
