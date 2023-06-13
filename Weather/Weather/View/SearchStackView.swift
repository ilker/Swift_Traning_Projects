//
//  SearchStackView.swift
//  Weather
//
//  Created by ILKER on 13.06.2023.
//

import UIKit

protocol SearchStackViewDelegate: AnyObject {
    func didFetchWeather(_ searchStackView: SearchStackView, weatherModel: WeatherModel)
    func didFailWithError(_ searchStackViw: SearchStackView, error: ServiceError)
    func updatingLocation(_ searchStackView: SearchStackView)
}

class SearchStackView: UIStackView {
    // MARK: - Properties
    weak var delegate: SearchStackViewDelegate?
    private let locationButton = UIButton(type: .system)
    private let searchButton = UIButton(type: .system)
    private let searchTextField = UITextField()
    private let service = WeatherService()
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
// MARK: - Helpers
extension SearchStackView {
    private func style() {
        //locationButton style
        locationButton.translatesAutoresizingMaskIntoConstraints = false
        locationButton.setImage(UIImage(systemName: "location.circle.fill"), for: .normal)
        locationButton.tintColor = .label
        locationButton.layer.cornerRadius = 40 / 2
        locationButton.contentVerticalAlignment = .fill
        locationButton.contentHorizontalAlignment = .fill
        locationButton.addTarget(self, action: #selector(handleLocationButton), for: .touchUpInside)
        //searchButton style
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchButton.tintColor = .label
        searchButton.layer.cornerRadius = 40 / 2
        searchButton.contentVerticalAlignment = .fill
        searchButton.contentHorizontalAlignment = .fill
        searchButton.addTarget(self, action: #selector(handleSearchButton), for: .touchUpInside)
        //searchTextField style
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        searchTextField.placeholder = "Search..."
        searchTextField.font = UIFont.preferredFont(forTextStyle: .title1) 
        searchTextField.borderStyle = .roundedRect
        searchTextField.textAlignment = .center
        searchTextField.backgroundColor = .systemFill
        searchTextField.delegate = self
    }
    private func layout() {
        addArrangedSubview(locationButton)
        addArrangedSubview(searchTextField)
        addArrangedSubview(searchButton)
        
        NSLayoutConstraint.activate([
            //locationButton layout
            locationButton.heightAnchor.constraint(equalToConstant: 40),
            locationButton.widthAnchor.constraint(equalToConstant: 40),
            
            //searhButton layout
            searchButton.heightAnchor.constraint(equalToConstant: 40),
            searchButton.widthAnchor.constraint(equalToConstant: 40),
        ])
    }
}

// MARK: - Selector
extension SearchStackView {
    @objc private func handleSearchButton(_ sender: UIButton) {
        self.searchTextField.endEditing(true)
    }
    @objc private func handleLocationButton(_ sender: UIButton) {
        self.delegate?.updatingLocation(self)
    }
}
// MARK: - UITextFieldDelegate
extension SearchStackView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return self.searchTextField.endEditing(true)
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if searchTextField.text != "" {
            return true
        }else {
            searchTextField.placeholder = "Search..."
            return false
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let cityName = searchTextField.text else { return }
        //Replacing Turkish characters with their Unicode equivalents
        let convertedCityName = cityName
            .replacingOccurrences(of: "İ", with: "\u{0069}")
            .replacingOccurrences(of: "ı", with: "\u{0049}")
            .replacingOccurrences(of: "ş", with: "\u{0073}")
            .replacingOccurrences(of: "Ş", with: "\u{0053}")
            .replacingOccurrences(of: "ğ", with: "\u{0067}")
            .replacingOccurrences(of: "Ğ", with: "\u{0047}")
            .replacingOccurrences(of: "ç", with: "\u{0063}")
            .replacingOccurrences(of: "Ç", with: "\u{0043}")
            .replacingOccurrences(of: "ö", with: "\u{006f}")
            .replacingOccurrences(of: "Ö", with: "\u{004f}")
            .replacingOccurrences(of: "ü", with: "\u{0075}")
            .replacingOccurrences(of: "Ü", with: "\u{0055}")
        
        service.fetchWeatherCityName(forCityName: convertedCityName) { result in
            switch result {
            case .success(let result):
                self.delegate?.didFetchWeather(self, weatherModel: result)
            case .failure(let error):
                self.delegate?.didFailWithError(self, error: error)
            }
        }
        self.searchTextField.text = ""
    }
}
