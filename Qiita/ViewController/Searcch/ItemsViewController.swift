//
//  ItemsViewController.swift
//  Qiita
//
//  Created by 木元健太郎 on 2021/04/16.
//

import UIKit

final class ItemsViewController: UIViewController {

  private let cellID = "UITableViewCell"
  @IBOutlet private weak var tableView: UITableView! {
    didSet {
      tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
    }
  }

  private var qiitaItems: [QiitaItemModel] = []

  override func viewDidLoad() {
    super.viewDidLoad()
    API.shared.getItems {[weak self] (items, error) in
      if let _error = error {
        //エラーハンドリング
        return
      }
      guard let _items = items else {
        //エラーハンドリング
        return
      }
      self?.qiitaItems = _items
      self?.tableView.reloadData()
    }
  }
}

extension ItemsViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    guard let url = qiitaItems[indexPath.row].url,
          UIApplication.shared.canOpenURL(url) else {
            return
          }
    UIApplication.shared.open(url, options: [:], completionHandler: nil)
  }
}

extension ItemsViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return qiitaItems.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: cellID) else {
      fatalError()
    }

    let item = qiitaItems[indexPath.row]
    cell.textLabel?.text = item.title

    return cell
  }
}
