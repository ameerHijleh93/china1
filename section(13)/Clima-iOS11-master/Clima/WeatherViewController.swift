//
//  ViewController.swift
//  WeatherApp
//
//  Created by Angela Yu on 23/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire
import SwiftyJSON


class WeatherViewController: UIViewController ,CLLocationManagerDelegate ,changCityDelegat {
 
    
    
    //Constants
    let WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather"
    let APP_ID = "bb782ac7cf0138f4fd6d91d24eeac6df"
    

    //TODO: Declare instance variables here
    let locationManegar = CLLocationManager()
    let weatherDataModel = WeatherDataModel()

    
    //Pre-linked IBOutlets
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManegar.delegate = self
        locationManegar.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManegar.requestWhenInUseAuthorization()
        locationManegar.startUpdatingLocation()
        
        //TODO:Set up the location manager here.
    
        
        
    }
    
    
    
    //MARK: - Networking
    /***************************************************************/
    
    //Write the getWeatherData method here:
    
    func getWeatherData(url : String , parameters : [String : String]){
        Alamofire.request(url , method : .get , parameters : parameters).responseJSON {
            response in
            if response.result.isSuccess {
                print("git the wither data ")
                let weatharJSON = JSON(response.result.value!)
                print(weatharJSON)
                self.updatWetharDate(json: weatharJSON)
            }
            else {
                print("error \(response.result.error)")
                self.cityLabel.text = "canat isuius"
            }
        }
        
    }
    
    
    
    
    
    //MARK: - JSON Parsing
    /***************************************************************/
   
    
    //Write the updateWeatherData method here:
    
    func updatWetharDate(json : JSON){
        if   let tempResult = json["main"]["temp"].double {
        weatherDataModel.tempriterature = Int(tempResult - 273.15)
        weatherDataModel.city = json["name"].stringValue
        weatherDataModel.condition = json["weather"][0]["id"].intValue
        weatherDataModel.weatherIconName = weatherDataModel.updateWeatherIcon(condition: weatherDataModel.condition)
            updateUIWithWeatherData()
        } else{
            cityLabel.text = "lolo is not avalabej"
        }
    }
    
    
    
    //MARK: - UI Updates
    /***************************************************************/
    
    
    //Write the updateUIWithWeatherData method here:
    
    
    func updateUIWithWeatherData (){
        cityLabel.text = weatherDataModel.city
        temperatureLabel.text = "\(weatherDataModel.tempriterature)°"
        weatherIcon.image = UIImage(named: weatherDataModel.weatherIconName)
    }
    
    
    
    //MARK: - Location Manager Delegate Methods
    /***************************************************************/
    
    
    //Write the didUpdateLocations method here:
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[locations.count - 1]
        if location.horizontalAccuracy > 0{
            locationManegar.startUpdatingLocation()
            print("longitude = \(location.coordinate.longitude)  latitude = \(location.coordinate.latitude)")
            let longitude = String(location.coordinate.longitude)
            let latitude = String(location.coordinate.latitude)
            let parms : [String : String] = ["lat" : latitude , "lon" : longitude , "appid" : APP_ID]
            getWeatherData(url :WEATHER_URL , parameters : parms)
            
        }
    }
    
    
    //Write the didFailWithError method here:
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
        cityLabel.text = "the location is eroer"
    }

    
    //MARK: - Change City Delegate methods
    /***************************************************************/
    
    
    //Write the userEnteredANewCityName Delegate method here:
    
    func userEnterdAnewCityName(cityName: String) {
        let params : [String : String] = ["q" : cityName , "appid" : APP_ID]
        getWeatherData(url: WEATHER_URL, parameters: params)
    }

    
    //Write the PrepareForSegue Method here
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "changeCityName" {
            
            let destinationvc = segue.destination as! ChangeCityViewController
            destinationvc.delegate = self
        }
        
    }
    
    
    
}


