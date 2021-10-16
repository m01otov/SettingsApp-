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
    let option: [SettingsOptionType]
}
enum SettingsOptionType {
    case staticCell(model: SettingsOption)
    case switchCell(model: SettingsSwitchOption)
}

struct SettingsSwitchOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
    let isOne: Bool
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
        title = "Настройки"
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
    }

    func configure() {
        models.append(Section(title: "General", option: [.staticCell(model: SettingsOption(title: "Авиарежим", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemOrange, handler: {

        })),
        .staticCell(model: SettingsOption(title: "Wifi", icon: UIImage(systemName: "wifi"), iconBackgroundColor: .systemBlue, handler: {
        })),
        .staticCell(model: SettingsOption(title: "Bluetooth", icon: UIImage(systemName: "dot.radiowaves.up.forward"), iconBackgroundColor: .systemBlue, handler: {
        })),
        .staticCell(model: SettingsOption(title: "Сотовая связь", icon: UIImage(systemName: "antenna.radiowaves.left.and.right"), iconBackgroundColor: .systemGreen, handler: {
        })),
        .staticCell(model: SettingsOption(title: "Режим модема", icon: UIImage(systemName: "personalhotspot"), iconBackgroundColor: .systemGreen, handler: {
        })),
        .staticCell(model: SettingsOption(title: "VPN", icon: UIImage(systemName: "network.badge.shield.half.filled"), iconBackgroundColor: .systemBlue, handler: {
        })),

]))
        models.append(Section(title: "", option: [.staticCell(model: SettingsOption(title: "Уведомления", icon: UIImage(systemName: "app.badge"), iconBackgroundColor: .systemRed, handler: {

        })),
        .staticCell(model: SettingsOption(title: "Звуки, тактильные синалы", icon: UIImage(systemName: "music.note"), iconBackgroundColor: .systemRed, handler: {
        })),
        .staticCell(model: SettingsOption(title: "Не беспокоить", icon: UIImage(systemName: "bed.double.fill"), iconBackgroundColor: .systemBlue, handler: {
        })),
        .staticCell(model: SettingsOption(title: "Сотовая связь", icon: UIImage(systemName: "antenna.radiowaves.left.and.right"), iconBackgroundColor: .systemGreen, handler: {
        })),
        .staticCell(model: SettingsOption(title: "Экранное время", icon: UIImage(systemName: "person.crop.circle.badge.clock"), iconBackgroundColor: .systemBlue, handler: {
        }))

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

            switch model.self {
            case .staticCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier, for: indexPath) as? SettingTableViewCell else {
                        return UITableViewCell()
                    }
                    cell.configure(with: model)
                    return cell
            case .switchCell(let model):
                    return UITableViewCell()
            }
        }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let type = models[indexPath.section].option[indexPath.row]

        switch type.self {
        case .staticCell(let model):
            model.handler()
        case .switchCell(let model):
            model.handler()
        }

    }
}
