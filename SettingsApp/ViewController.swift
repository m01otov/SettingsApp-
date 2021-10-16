//
//  ViewController.swift
//  SettingsApp
//
//  Created by Ilya Melnikov on 16.10.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private let tableView: UITableView = {
           let table = UITableView(frame: .zero, style: .grouped)
           table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
           return table

       }()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Settings"
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
    }
    //Добавим функции которые требуются для таблицы
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 0   }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = "Test"
            return cell

        }
}
