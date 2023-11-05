//
//  ViewController.swift
//  Weather App
//
//  Created by Leonardo Barrocal on 11/4/23.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageBackground: String = "background"
    private let iconSun: String = "sun-icon"
    private let mainColor: String = "main-color"
    private let cityMock: String = "São Paulo"
    private let temperatureMock: String = "25ºC"
    
    private lazy var backgroundView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: imageBackground)
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    private lazy var headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        
       return view
    }()
    
    private lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = cityMock
        label.textAlignment = .center
        label.textColor = UIColor(named: mainColor)
        
        return label
    }()

    private lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 70, weight: .bold)
        label.text = temperatureMock
        label.textAlignment = .left
        label.textColor = UIColor(named: mainColor)
        
        return label
    }()
    
    private lazy var weatherIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: iconSun)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .red
        
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy() {
        view.addSubview(backgroundView)
        view.addSubview(headerView)

        headerView.addSubview(cityLabel)
        headerView.addSubview(temperatureLabel)
        headerView.addSubview(weatherIcon)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            headerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            headerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            headerView.heightAnchor.constraint(equalToConstant: 148)
        ])
        
        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 12),
            cityLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 12),
            cityLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -12),
            cityLabel.heightAnchor.constraint(equalToConstant: 20),
            
            temperatureLabel.topAnchor.constraint(equalTo: cityLabel.topAnchor, constant: 24),
            temperatureLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 26),
            
            weatherIcon.heightAnchor.constraint(equalToConstant: 76),
            weatherIcon.widthAnchor.constraint(equalToConstant: 76),
            weatherIcon.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -26),
            weatherIcon.centerYAnchor.constraint(equalTo: temperatureLabel.centerYAnchor),
            weatherIcon.leadingAnchor.constraint(equalTo: temperatureLabel.trailingAnchor, constant: 12)
            
        ])
    }
}

