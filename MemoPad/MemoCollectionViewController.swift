//
//  MemoCollectionViewController.swift
//  MemoPad
//
//  Created by まちだこうたろう on 2023/02/07.
//

import UIKit

class MemoCollectionViewController: UIViewController, UICollectionViewDataSource {

    // MARK: コレクションビュー
    @IBOutlet var collectionView: UICollectionView!
    // MARK: ユーザーデフォルト
    var saveData: UserDefaults = UserDefaults.standard
    // MARK: タイトルのデータを格納する配列
    var titles: [String] = []
    // MARK: コンテンツのデータを格納する配列
    var contents: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
    }
    
    // MARK: セルの個数を決めるメソッド
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    // MARK: セルに表示する内容を設定するメソッド
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        var contentConfigration = UIListContentConfiguration.cell()
        contentConfigration.text = "IOSアプリを開発中！"
        contentConfigration.secondaryText = "コレクションビューを勉強している"
        cell.contentConfiguration = contentConfigration
        return cell
    }

}
