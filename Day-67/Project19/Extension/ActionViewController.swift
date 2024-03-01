//
//  ActionViewController.swift
//  Extension
//
//  Created by Mehmet Tekin on 3.02.2024.
//

import UIKit
import MobileCoreServices
import UniformTypeIdentifiers

class ActionViewController: UIViewController {

    @IBOutlet var script: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    
    var pageTitle = ""
    var pageURL = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var userScripts = Dictionary<String, String>()
        
        let defaults = UserDefaults.standard
        
        let leftButton1 = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(selectCode))
        let leftButton2 = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addCode))

        navigationItem.leftBarButtonItems = [leftButton1, leftButton2]
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(selectCode))
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)

        if let inputItem = extensionContext?.inputItems.first as? NSExtensionItem {
            if let itemProvider = inputItem.attachments?.first {
                itemProvider.loadItem(forTypeIdentifier: kUTTypePropertyList as String) { [weak self] (dict, err) in
                    guard let itemDictonary = dict as? NSDictionary else { return }
                    guard let javaScriptValues = itemDictonary[NSExtensionJavaScriptPreprocessingResultsKey] as? NSDictionary else { return }
                    self?.pageTitle = javaScriptValues["title"] as? String ?? ""
                    self?.pageURL = javaScriptValues["URL"] as? String ?? ""
                    
                    DispatchQueue.main.async {
                        self?.title = self?.pageTitle
                    }
                }
            }
        }
    }
    
    @objc func addCode(){
        let ac = UIAlertController(title: "Add Your Code", message: nil, preferredStyle: .alert)
        ac.addTextField()

        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))

        ac.addAction(UIAlertAction(title: "Submit", style: .default) { [weak self, weak ac] _ in
            guard let newName = ac?.textFields?[0].text else { return }
            var alertTitle = ""
            guard let scriptText = self?.script.text else { return }
            if self?.pageTitle != ""{
                self?.userScripts[newName] = scriptText
                self?.defaults.set(self?.userScripts, forKey: self!.pageTitle)
                alertTitle = "Save Completed"
            }else{
                alertTitle = "Save failed"
            }
            let sac = UIAlertController(title: alertTitle, message: nil, preferredStyle: .alert)
            sac.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            self?.present(sac,animated: true)
        })

        present(ac, animated: true)
    }
    
    @objc func selectCode() {
        let ac = UIAlertController(title: "Select Any Code", message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Alert example 1", style: .default, handler: selectCodeAction))
        ac.addAction(UIAlertAction(title: "Alert example 2", style: .default, handler: selectCodeAction))

        present(ac, animated: true)
    }
    
    func selectCodeAction(action: UIAlertAction? = nil) {
        guard let title = action?.title else { return }
        
        if title == "Alert Template" {
            self.script.text = "alert();"
        } else {
            self.script.text = """
            alert("This this test example");
            alert();
            """
        }
    }

    @IBAction func done() {
        let item = NSExtensionItem()
        let argument: NSDictionary = ["customJavaScript": script.text]
        let webDictionary: NSDictionary = [NSExtensionJavaScriptFinalizeArgumentKey: argument]
        let customJavaScript = NSItemProvider(item: webDictionary, typeIdentifier: kUTTypePropertyList as String)
        item.attachments = [customJavaScript]
        
        extensionContext?.completeRequest(returningItems: [item])
    }
    
    @objc func adjustForKeyboard(notification: Notification) {
        guard let keyboardValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        
        let keyboardScreenEndFrame = keyboardValue.cgRectValue
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)
        
        if notification.name == UIResponder.keyboardWillHideNotification {
            script.contentInset = .zero
        } else {
            script.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardViewEndFrame.height - view.safeAreaInsets.bottom, right: 0)
        }
        
        script.scrollIndicatorInsets = script.contentInset
        
        let selectedRange = script.selectedRange
        script.scrollRangeToVisible(selectedRange)
    }

}
