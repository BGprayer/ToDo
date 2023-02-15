//
//  ToDosTableVC-Delegate.swift
//  ToDos
//
//  Created by 项宇杰 on 2023/2/7.
//

import UIKit

extension ToDosTableVC{
    //左滑删除
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
//        let vc = storyboard?.instantiateViewController(withIdentifier: kTodoTableVCID) as! ToDoTableVC
//        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if !isEditing{
            return .delete
        }
        else{
            return .none
        }
    }
    
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }

}

//反向传值
extension ToDosTableVC: ToDoTableVCDelegate{
    func didAdd(name: String) {
        print(name)
        todo.append(Todo(name: name, checked: false))
        tableView.insertRows(at: [IndexPath(row: todo.count - 1, section: 0)], with: .automatic)
    }
    
    func didEdit(name: String) {
        todo[row].name = name
        
//        let indexPath = IndexPath(row: row, section: 0)
//        let cell = tableView.cellForRow(at: indexPath) as! ToDoCell
//        cell.todoLabel.text = todo[row].name
        tableView.reloadData()
    }
}

