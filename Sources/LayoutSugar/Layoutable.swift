//
//  Layoutable.swift
//  
//
//  Created by taekki on 2023/02/14.
//

import UIKit

import SnapKit

public protocol Layoutable: AnyObject {
    var layoutItems: [LayoutItem] { get }
    
    func setupHierarchy()
    func buildLayout()
}

public extension Layoutable where Self: UIViewController {
    
    /// 기본적으로 Subview를 모두 view의 하위 뷰로 추가
    func setupHierarchy() {
        let subviews = layoutItems.map { $0.view }
        subviews.forEach(view.addSubview)
    }

    /// LayoutItem 정보 바탕으로 레이아웃 빌드
    func buildLayout() {
        layoutItems.forEach { subview in
            let view = subview.view
            let (top, bottom, leading, trailing, side) = (subview.top, subview.bottom, subview.leading, subview.trailing, subview.side)
            let (width, height) = (subview.width, subview.height)
            let (center, centerX, centerY) = (subview.center, subview.centerX, subview.centerY)
            
            view.snp.makeConstraints {
                // top
                if let top {
                    switch top.relation {
                    case .bottom:
                        $0.top.equalTo(top.target.snp.bottom).offset(top.size)
                        
                    case .safeArea:
                        $0.top.equalTo(view.safeAreaLayoutGuide).offset(top.size)
                        
                    default:
                        $0.top.equalTo(top.target).offset(top.size)
                    }
                }
                
                // bottom
                if let bottom {
                    switch bottom.relation {
                    case .top:
                        $0.bottom.equalTo(bottom.target.snp.top).offset(bottom.size)
                        
                    case .safeArea:
                        $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(bottom.size)
                        
                    default:
                        $0.bottom.equalTo(bottom.target).offset(bottom.size)
                    }
                }
                
                // leading
                if let leading {
                    switch leading.relation {
                    case .trailing:
                        $0.leading.equalTo(leading.target.snp.trailing).offset(leading.size)
                        
                    case .safeArea:
                        $0.leading.equalTo(view.safeAreaLayoutGuide).offset(leading.size)
                        
                    default:
                        $0.leading.equalTo(leading.target).offset(leading.size)
                    }
                }
                
                // trailing
                if let trailing {
                    switch trailing.relation {
                    case .leading:
                        $0.trailing.equalTo(trailing.target.snp.leading).offset(trailing.size)
                        
                    case .safeArea:
                        $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(trailing.size)
                        
                    default:
                        $0.trailing.equalTo(trailing.target).offset(trailing.size)
                    }
                }
                
                // side
                if let side = side {
                    $0.directionalHorizontalEdges.equalTo(side.target).inset(side.size)
                }
                
                // width, height
                if let width {
                    $0.width.equalTo(width)
                }
                
                if let height {
                    $0.height.equalTo(height)
                }
                
                // center
                if let centerX {
                    $0.centerX.equalTo(centerX.target.snp.centerX)
                }
                
                if let centerY {
                    $0.centerY.equalTo(centerY.target.snp.centerY)
                }
                
                if let center {
                    $0.center.equalTo(center.target)
                }
            }
        }
    }
}
