//
//  ViewController.swift
//  LearningTask-6.3
//
//  Created by rafael.rollo on 14/04/2022.
//

import UIKit

class SessoesFilmeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var movieSessionsAPI: MovieSessionsAPI?
    var movie: Movie?
    var allSessions: [Sessions]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadMovieSessions()
        setupTableView()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        guard let movie = movie else { return }
        tableView.tableHeaderView = TableHeaderView.build(from: movie)
        
        tableView.register(UINib(nibName: "SessionTableViewCell", bundle: nil), forCellReuseIdentifier: "SessionCell")
        tableView.register(TableSectionHeaderView.self, forHeaderFooterViewReuseIdentifier: TableSectionHeaderView.reuseId)
        tableView.sectionHeaderHeight = TableSectionHeaderView.heightConstant
    }
    
    func loadMovieSessions() {
        guard let movie = movie else { return }
        allSessions = movieSessionsAPI?.getSessionBy(movie)
    }
}

extension SessoesFilmeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return allSessions!.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allSessions![section].movieSessions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SessionCell", for: indexPath) as? SessionTableViewCell else {
            fatalError("Não foi possível carregar as células")
        }
        
        let session = allSessions![indexPath.section].movieSessions[indexPath.row]
        cell.setup(for: session)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: TableSectionHeaderView.reuseId) as? TableSectionHeaderView else {
            fatalError("Não foi possível carregar a header view")
        }
        
        header.titulo = allSessions?[section].cinema.name
        return header
    }
    
    
}

extension SessoesFilmeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
