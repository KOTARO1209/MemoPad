//
//  MemoViewController.swift
//  MemoPad
//
//  Created by まちだこうたろう on 2023/02/06.
//

import UIKit

class MemoViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    
    var saveData: UserDefaults = UserDefaults.standard
    
    //メモのタイトルデータが格納される配列
    var titles: [String] = []
    
    //メモの詳細データが格納される配列
    var contents: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // MARK: Userdefaultsから古いメモを登録
        saveData.register(defaults: [ "titles": [], "contents": [] ])
        titles = saveData.object(forKey: "titles") as! [String]
        contents = saveData.object(forKey: "contents") as! [String]
        // MARK: - UserDefaultsから取得したメモをコンソールに表示
        print(titles)
        print(contents)
        // MARK: -
        titleTextField.delegate = self
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func saveMemo(){
        // MARK: - UserDefaultsにデータを保存
        // STEP1. 入力データを変数に格納します
        let title = titleTextField.text!
        let content = contentTextView.text!
        // STEP2. 古いメモに入力データを追加します
        titles.append(title)
        contents.append(content)
        // STEP3. UserDefaultsを更新します
        saveData.set(titles, forKey: "titles")
        saveData.set(contents, forKey: "contents")
        // MARK: -
        
        let alert: UIAlertController = UIAlertController(title: "保存", message: "メモの保存が完了しました。", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler:{action in self.navigationController?.popViewController(animated: true)
            })
        )
        present(alert, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
