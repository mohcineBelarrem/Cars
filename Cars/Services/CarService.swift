//
//  CarService.swift
//  Cars
//
//  Created by Mohcine Belarrem on 14/10/2022.
//

import Foundation

class CarService {

    private func readLocalJSONFile(forName name: String) -> Data? {
        do {
            if let filePath = Bundle.main.path(forResource: name, ofType: "json") {
                let fileUrl = URL(fileURLWithPath: filePath)
                let data = try Data(contentsOf: fileUrl)
                return data
            }
        } catch {
            print("error: \(error)")
        }
        return nil
    }

    private func parse(jsonData: Data) -> [Car] {
        do {
            let decodedData = try JSONDecoder().decode([Car].self, from: jsonData)
            return decodedData
        } catch {
            print("error: \(error)")
        }
        return []
    }


    func getCars() -> [Car] {
        let jsonData = readLocalJSONFile(forName: "car_list")
        guard  let data = jsonData else { return [] }
        return parse(jsonData: data)
    }
}
