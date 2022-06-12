//
//  TableViewController.swift
//  CustomizeNavigationBarLargeTitleView
//
//  Created by Shameem A. Khan on 11/06/2022.
//

import UIKit

class TableViewController: UITableViewController {

    enum Constant {
        static let reuseableIdentifier = "ListItemView"
    }
    
    let firstButton = CustomButton.button(image: UIImage(named: "arrow.png")) {
        print("firstButton clicked")
    }

    let secondButton = CustomButton.button(image: UIImage(named: "video.png")) {
        print("secondButton clicked")
    }

    let viewModel = ListViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Title"
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constant.reuseableIdentifier)
        addButtonOnNavigationBar()
    }

    // MARK: - Veiw Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.dataSource = self
        tableView.reloadData()
        showCustomNavigationBarView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
        
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        hideCustomNavigationBarView()
    }
    
    // MARK: - Add button on LargeTitleView
    func addButtonOnNavigationBar() {
        navigationController?.navigationBar.addButtonOnNavigationBar([firstButton, secondButton])
    }
    
    func showCustomNavigationBarView() {
        navigationController?.navigationBar.showCustomNavigationBarView([firstButton, secondButton])
    }

    func hideCustomNavigationBarView() {
        navigationController?.navigationBar.hideCustomNavigationBarView([firstButton, secondButton])
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.reuseableIdentifier, for: indexPath)
        cell.textLabel?.text = viewModel.items[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Data"
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detail  = DetailViewController(nibName: "DetailViewController", bundle: Bundle.main)
        if indexPath.row%2 == 0 {
            present(detail, animated: true, completion: nil)
        } else {
            navigationController?.pushViewController(detail, animated: true)
        }
    }
    
    //MARK: - ScrollView delegates
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let height = navigationController?.navigationBar.frame.height else { return }
        print(height)
        if scrollView.contentOffset.y > 0 {
            
        }
    }
}

