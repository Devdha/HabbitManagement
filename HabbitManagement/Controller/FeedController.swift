//
//  FeedController.swift
//  HabbitManagement
//
//  Created by 강호성 on 2021/05/21.
//

import UIKit
import FSCalendar

private let reuseIdentifier = "FeedCell"

class FeedController: UITableViewController {
    
    // MARK: - Properties
        
    var calendar = FSCalendar()
    
    private let notificationPublisher = NotificationController()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(FeedCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.backgroundColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "alarm", style: .plain, target: self, action: #selector(Tap))
        
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 350))
        tableView.tableHeaderView = header
        //        header.backgroundColor = .systemOrange
        
        // 캘린더 추가하기
        header.addSubview(calendar)
        calendar.anchor(top: header.topAnchor, bottom: header.bottomAnchor)
        calendar.widthAnchor.constraint(equalTo: header.widthAnchor).isActive = true
        calendar.centerX(inView: header)
    }
    
    // MARK: - Actions
    
    @objc func Tap() {
        notificationPublisher.sendNotification(title: "Test Title", body: "Test Body", badge: 1, delayInterval: nil)
    }
}
    // MARK: - HeaderInSection

extension FeedController {
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40.0
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "List of Today's Habits"
    }
}

