//
//  FeedViewController.swift
//  KingBurguer
//
//  Created by Ednaldo Franco on 31/12/24.
//

import UIKit

class FeedViewController: UIViewController {
    let sections = ["Mais Vendidos", "Vegano", "Bovino", "Sobremesas"]
    
    private let homeFeedTable: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(FeedTableTableViewCell.self, forCellReuseIdentifier: FeedTableTableViewCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        self.setupView()
        self.addConstraints()
        self.configureNavBar()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.bounds
    }
    
    private func configureNavBar() {
 //       navigationItem.title = "Produtos"
        navigationController?.navigationBar.prefersLargeTitles = false
//        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "clock"), style: .done, target: self, action: #selector(action))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cupons", style: .done, target: self, action: #selector(action))
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(title: "Novo", style: .done, target: self, action: nil),
            // UIBarButtonItem(title: "Voltar", style: .done, target: self, action: nil),
        ]
        
        navigationController?.navigationBar.tintColor = .systemRed
    }
    
    @objc private func action() {
        
    }
    
    private func setupView() {
        self.homeFeedTable.dataSource = self
        self.homeFeedTable.delegate = self
        
        let headerView = HeighLightView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 300))
        
        headerView.backgroundColor = .systemOrange
        self.homeFeedTable.tableHeaderView = headerView
        
        view.addSubview(homeFeedTable)
    }

    private func addConstraints() {
        
    }
}

extension FeedViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 40))
        let label = UILabel(frame: CGRect(x: 25, y: 0, width: tableView.bounds.width, height: 40))
        
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .label
        
        label.text = self.sections[section].uppercased()
        view.addSubview(label)
        
        return view
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell: FeedTableTableViewCell = tableView.dequeueReusableCell(withIdentifier: FeedTableTableViewCell.identifier, for: indexPath) as! FeedTableTableViewCell
   
        return cell
    }
    
    
    
}
