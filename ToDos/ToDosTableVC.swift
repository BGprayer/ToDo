//
//  ToDosTableVC.swift
//  ToDos
//
//  Created by 项宇杰 on 2023/2/5.
//

import UIKit

class ToDosTableVC: UITableViewController{
    

    var todo = [
        Todo(name: "一个人很寂寞另一个很洒脱", checked: false),
        Todo(name: "谁先放开的手当初却没有说", checked: false),
        Todo(name: "以为感受到你那跳动的脉搏", checked: true),
        Todo(name: "也曾觉得分分合合没什么了不得", checked: false),
        Todo(name: "一个人的拥抱能转移给几个", checked: false),
        Todo(name: "简单温暖胜过一万次的承诺", checked: false),
        Todo(name: "天涯路太遥远谁会相伴走过", checked: false),
        Todo(name: "丢过幸福的人请和我一起唱情歌", checked: false)
    ]
    
    var row = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        editButtonItem.title = nil
        editButtonItem.image = pointIcon(IconName: "arrow.up.arrow.down.circle.fill", PointSize: 25)
        navigationItem.leftBarButtonItem = editButtonItem
        navigationItem.rightBarButtonItem?.image = pointIcon(IconName: "plus.circle.fill", PointSize: 25)
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        
        if isEditing{
            editButtonItem.image = nil
            editButtonItem.title = "完成"
            
        }else{
            editButtonItem.title = nil
            editButtonItem.image = pointIcon(IconName: "arrow.up.arrow.down.circle.fill", PointSize: 25)
            
        }
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */


   
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == kAddTodoID{
            let vc = segue.destination as! ToDoTableVC
            vc.delegate = self
            
        }else if segue.identifier == kEditToDoID{
            let vc = segue.destination as! ToDoTableVC
            vc.delegate = self
            
            let cell = sender as! ToDoCell
            row = tableView.indexPath(for: cell)!.row
            vc.name = todo[row].name
        }
    }

}

