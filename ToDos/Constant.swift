//
//  Constant.swift
//  ToDos
//
//  Created by 项宇杰 on 2023/2/5.
//

import UIKit

let kAddTodoID = "AddTodoID"
let kTodoTableVCID = "TodoTableVCID"
let kEditToDoID = "EditToDoID"

func pointIcon(IconName: String, PointSize: CGFloat) -> UIImage?{
    
    let config = UIImage.SymbolConfiguration(pointSize: PointSize)
    return UIImage(systemName: IconName, withConfiguration: config)
    
}
