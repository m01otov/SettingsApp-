//
//  ViewController.swift
//  SettingsApp
//
//  Created by Ilya Melnikov on 16.10.2021.
//

import UIKit

//Состав ячейки
struct SettingsOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)

}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.identifier)
        return table

       }()

//Создадим множество моделей:

    var models = [SettingsOption]()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        title = "Settings"
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
    }

    func configure() {
            self.models = Array(0...15).compactMap({
            SettingsOption(title: "Item \($0)", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemPink) {
                }})
    }

    //Добавим функции которые требуются для таблицы
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return models.count   }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let model = models[indexPath.row]
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier, for: indexPath)
            as? SettingTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell

        }
}
