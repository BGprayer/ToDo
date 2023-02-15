//
//  ToDoTableVC.swift
//  ToDos
//
//  Created by 项宇杰 on 2023/2/5.
//

import UIKit

protocol ToDoTableVCDelegate{
    func didAdd(name: String)
    func didEdit(name: String)
}

class ToDoTableVC: UITableViewController {
    
    var delegate: ToDoTableVCDelegate?
    var name: String?
    

    @IBOutlet weak var todoTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        todoTextView.delegate = self
        todoTextView.text = name
        
        if name != nil{
            navigationItem.title = "编辑待办事项"
        }
        
        navigationItem.rightBarButtonItem?.image = pointIcon(IconName: "checkmark.circle.fill", PointSize: 22)
        navigationItem.leftBarButtonItem?.image = pointIcon(IconName: "chevron.backward.circle.fill", PointSize: 22)
        print("good")
        
        
    }
    @IBAction func done(_ sender: Any) {
        
        if !todoTextView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
            if name != nil{
                delegate?.didEdit(name: todoTextView.text)
            }else{
                delegate?.didAdd(name: todoTextView.text)
            }
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}

extension ToDoTableVC: UITextViewDelegate{
    
    func textViewDidChange(_ textView: UITextView) {
        tableView.performBatchUpdates { }
    }
}
