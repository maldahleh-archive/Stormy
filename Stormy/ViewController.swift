//
//  ViewController.swift
//  Stormy
//
//  Created by Mohammed Al-Dahleh on 2017-12-08.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: Weather information UI elements
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var currentHumidityLabel: UILabel!
    @IBOutlet weak var currentPrecipitationLabel: UILabel!
    @IBOutlet weak var currentWeatherIcon: UIImageView!
    @IBOutlet weak var currentSummaryLabel: UILabel!
    
    // MARK: Refresh and activiy elements
    @IBOutlet weak var refreshButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: Model variables
    let client = DarkSkyAPIClient()
    let locationCoordinate = Coordinate(latitude: 37.8267, longitude: -122.4233)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayWeather(for: locationCoordinate)
    }
    
    @IBAction func refreshButtonTapped(_ sender: Any) {
        displayWeather(for: locationCoordinate)
    }
    
    // MARK: UI display methods
    
    func displayWeather(for coordinate: Coordinate) {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        
        client.getCurrentWeather(at: locationCoordinate) { [unowned self] currentWeather, error in
            self.activityIndicator.stopAnimating()
            
            if error != nil {
                self.displayAlertWith(title: "Error Occurred!", message: "Sorry, an error occurred!")
                return
            }
            
            let viewModel = CurrentWeatherViewModel(from: currentWeather!)
            self.displayWeather(using: viewModel)
        }
    }
    
    func displayWeather(using viewModel: CurrentWeatherViewModel) {
        currentTemperatureLabel.text = viewModel.temperature
        currentHumidityLabel.text = viewModel.humidity
        currentPrecipitationLabel.text = viewModel.precipitationProbability
        currentWeatherIcon.image = viewModel.icon
        currentSummaryLabel.text = viewModel.summary
    }
    
    func displayAlertWith(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
}
