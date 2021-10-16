//
//  ViewController.swift
//  SettingsApp
//
//  Created by Ilya Melnikov on 16.10.2021.
//

import UIKit

//Разделы

struct Section {
    let title: String
    let option: [SettingsOption]
}

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

    var models = [Section]()

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

        models.append(Section(title: "General", option: [
            SettingsOption(title: "Wifi", icon: UIImage(systemName: "wifi"), iconBackgroundColor: .link, handler:  {
                print("Tap General")
            }),
            SettingsOption(title: "Bluetooth", icon: UIImage(systemName: "bluetooth"), iconBackgroundColor: .systemGray, handler: {

            }),
            SettingsOption(title: "Airplane Mode", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemBlue, handler: {

            }),
            SettingsOption(title: "iCloud", icon: UIImage(systemName: "cloud"), iconBackgroundColor: .systemBlue, handler: {

            })

        ]))
        models.append(Section(title: "Information", option: [
            SettingsOption(title: "Wifi", icon: UIImage(systemName: "wifi"), iconBackgroundColor: .link, handler: {

            }),
            SettingsOption(title: "Bluetooth", icon: UIImage(systemName: "bluetooth"), iconBackgroundColor: .systemGray, handler: {

            }),
            SettingsOption(title: "Airplane Mode", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemBlue, handler: {

            })

        ]))
        models.append(Section(title: "Apps", option: [
            SettingsOption(title: "Wifi", icon: UIImage(systemName: "wifi"), iconBackgroundColor: .link, handler: {

            }),
            SettingsOption(title: "Bluetooth", icon: UIImage(systemName: "bluetooth"), iconBackgroundColor: .systemGray, handler: {

            }),
            SettingsOption(title: "Airplane Mode", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemBlue, handler: {

            })

        ]))
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = models[section]
        return section.title
    }


    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    //Добавим функции которые требуются для таблицы
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return models[section].option.count

        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let model = models[indexPath.section].option[indexPath.row]
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier, for: indexPath)
            as? SettingTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell

        }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = models[indexPath.section].option[indexPath.row]
        model.handler()
    }
}
