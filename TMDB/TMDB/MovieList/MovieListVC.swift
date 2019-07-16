//
//  MovieListVC.swift
//  TMDBMVVM
//
//  Created by techflitter on 12/03/19.
//  Copyright © 2019 Monali. All rights reserved.
//
import Foundation
import UIKit

class MovieListVC: UIViewController {
    
    @IBOutlet weak var tblMovieList: UITableView!
    lazy var presenter = MovieListPresenter(delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.fetchAllMovie()
        tblMovieList.tableFooterView = UIView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    @IBAction func btnFilterClicked(_ sender: Any) {
        let alert = Alert()
        alert.showAlertWithTextFields { (minYear, maxYear) in
            self.presenter.filterMoviesUsingYears(minYear: minYear, maxYear: maxYear)
        }
    }
    
    @IBAction func btnLogoutClicked(_ sender: Any) {
        for controller in self.navigationController!.viewControllers as Array {
            if controller.isKind(of: LoginViewController.self) {
                self.navigationController!.popToViewController(controller, animated: true)
                break
            }
        }
    }
    
    @IBAction func btnClearFilterClicked(_ sender: Any) {
        self.presenter.clearFilter()
    }
    
}

extension MovieListVC : UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.filteredMovie.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MovieListTableViewCell", for: indexPath) as? MovieListTableViewCell {
            cell.configureCell(movie: presenter.filteredMovie[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let moviedetailvc = self.storyboard?.instantiateViewController(withIdentifier: "MovieDetailViewController") as? MovieDetailViewController {
            moviedetailvc.movieDetail = presenter.filteredMovie[indexPath.row]
            self.navigationController?.pushViewController(moviedetailvc, animated: true)
        }
    }
}

extension MovieListVC:MovieListViewDelegate {
    func refresh() {
        DispatchQueue.main.async {
            self.tblMovieList.reloadData()
        }
    }
    
    func showError(message: String) {
        let alert = Alert()
        alert.showAlert(title: "", message: message, btnTitle: "Ok") {}
    }
}


