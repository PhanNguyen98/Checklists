//
//  AddItemTableViewController.swift
//  Checklists
//
//  Created by PhanDinhNguyen on 3/7/20.
//  Copyright © 2020 PhanDinhNguyen. All rights reserved.
//

import UIKit

protocol AddItemViewControllerDelegate: class {
    func addItemViewControllerDidCancel(_ controller: ItemDetailViewController)
    func addItemViewController(_ controller: ItemDetailViewController, didFinishAdding item: ChecklistItem)
    func addItemViewController(_ controller: ItemDetailViewController, didFinishEditing item: ChecklistItem)
}

class ItemDetailViewController: UITableViewController, UITextFieldDelegate {

    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    @IBOutlet weak var textField: UITextField!
    
    weak var delegate: AddItemViewControllerDelegate?
    var itemToEdit: ChecklistItem?
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        if let item = itemToEdit {
            title = "Edit Item"
            textField.text = item.text
            doneBarButton.isEnabled = true
        }

    }
    //MARK:- Actions
    @IBAction func cancel() {
        delegate?.addItemViewControllerDidCancel(self)
    }
    
    @IBAction func done() {
        if let item = itemToEdit {
            item.text = textField.text!
            delegate?.addItemViewController(self, didFinishEditing: item)
        } else {
            let item = ChecklistItem()
            item.text = textField.text!
        
            delegate?.addItemViewController(self, didFinishAdding: item)
        }
        
    }
    //MARK:- Table View Delegates
    override func tableView(_ table: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    //MARK:- Text Field Delegates
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let oldText = textField.text!
        let stringRange = Range(range, in:oldText)!
        let newText = oldText.replacingCharacters(in: stringRange, with: string)
        doneBarButton.isEnabled = !newText.isEmpty
        return true
    }
    func  textFieldShouldClear(_ textField: UITextField) -> Bool {
        doneBarButton.isEnabled = false
        return true
    }

}
