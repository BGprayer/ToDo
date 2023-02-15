//
//  ToDOsTableVC- DataSource.swift
//  ToDos
//
//  Created by 项宇杰 on 2023/2/7.
//

import UIKit

extension ToDosTableVC{

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return todo.count
    }

    //Cell渲染
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDosCellID", for: indexPath) as! ToDoCell

        cell.checkBoxBtn.isSelected = todo[indexPath.row].checked
        cell.todoLabel.text = todo[indexPath.row].name
        cell.todoLabel.textColor = todo[indexPath.row].checked ? .tertiaryLabel : .label

//        var contentConfiguration = cell.defaultContentConfiguration()
//        contentConfiguration.text = "昵称"
//        contentConfiguration.secondaryText = "good"
//        contentConfiguration.image = UIImage(systemName: "star")
//        cell.contentConfiguration = contentConfiguration
        
        //点击按钮
//        if !isEditing{  //非编辑状态下改变，防止编辑状态下data source后又一次执行
//            cell.checkBoxBtn.addAction(UIAction(handler: { action in
//
//                self.todo[indexPath.row].checked.toggle()
//                cell.checkBoxBtn.isSelected = self.todo[indexPath.row].checked
//                cell.todoLabel.textColor = self.todo[indexPath.row].checked ? .tertiaryLabel : .label
//
//            }), for: .touchUpInside)
//        }
        
        cell.checkBoxBtn.tag = indexPath.row
        cell.checkBoxBtn.addTarget(self, action: #selector(toogleCheck), for: .touchUpInside) //点击事件
        

        return cell
    }
    
    //点击函数
    @objc func toogleCheck(checkBoxBtn: UIButton){
        let row = checkBoxBtn.tag
        todo[row].checked.toggle()
        print("点击了第\(row)行",todo[row])
        checkBoxBtn.isSelected = todo[row].checked
        
        let cell = tableView.cellForRow(at: IndexPath(row: row, section: 0)) as! ToDoCell
        cell.todoLabel.textColor = todo[row].checked ? .tertiaryLabel : .label
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            todo.remove(at: indexPath.row)
            tableView.reloadData()
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    // Override to support rearranging the table view.换行
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

        let ToDo = todo[fromIndexPath.row]
        todo.remove(at: fromIndexPath.row)
        todo.insert(ToDo, at: to.row)
//        print(todo)
        tableView.reloadData()
    }

}
