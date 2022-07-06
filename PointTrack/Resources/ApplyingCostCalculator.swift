//
//  ApplyingCostCalculator.swift
//  PointTrack
//
//  Created by Ethan Evans on 7/5/22.
//

import Foundation
import Firebase
import FirebaseFirestore

class ApplyingCostCalculator {
    
    var isResident: Bool = false
    let RESIDENT = "resident"
    let NONRESIDENT = "nonresident"
    
    func calculateApplyingCost(state: String, documentSnapshot: DocumentSnapshot, species: [String], resident: Bool) -> Int {
        self.isResident = resident

        switch (state) {
            case "Alaska":
                return calculateAlaskaApplyingCost(documentSnapshot: documentSnapshot, species: species)
            case "Arizona":
                return calculateArizonaApplyingCost(documentSnapshot: documentSnapshot, species: species)
            case "California":
                return calculateCaliforniaApplyingCost(documentSnapshot: documentSnapshot, species: species)
            case "Colorado":
                return calculateColoradoApplyingCost(documentSnapshot: documentSnapshot, species: species)
            case "Idaho":
                return calculateIdahoApplyingCost(documentSnapshot: documentSnapshot, species: species)
            case "Maine":
                return calculateMaineApplyingCost(documentSnapshot: documentSnapshot)
            case "Montana":
                return calculateMontanaApplyingCost(documentSnapshot: documentSnapshot, species: species)
            case "Nevada":
                return calculateNevadaApplyingCost(documentSnapshot: documentSnapshot, species: species)
            case "New Mexico":
                return calculateNewMexicoApplyingCost(documentSnapshot: documentSnapshot, species: species)
            case "Oregon":
                return calculateOregonApplyingCost(documentSnapshot: documentSnapshot, species: species)
            case "South Dakota":
                return calculateSouthDakotaApplyingCost(documentSnapshot: documentSnapshot, species: species)
            case "Utah":
                return calculateUtahApplyingCost(documentSnapshot: documentSnapshot, species: species)
            case "Washington":
                return calculateWashingtonApplyingCost(documentSnapshot: documentSnapshot, species: species)
            case "Wyoming":
                return calculateWyomingApplyingCost(documentSnapshot: documentSnapshot, species: species)
            default:
                return -1;
        }
    }
    
    private func getIntFromDocumentSnapshot(documentSnapshot: DocumentSnapshot, documentField: String) -> Int {
        return documentSnapshot[documentField] as? Int ?? 0
    }
    
    private func calculateAlaskaApplyingCost(documentSnapshot: DocumentSnapshot, species: [String]) -> Int {
        
        var totalCost = 0
        
        if (isResident) {
            totalCost += getIntFromDocumentSnapshot(documentSnapshot: documentSnapshot, documentField: RESIDENT + "_hunting_license")
        } else {
            totalCost += getIntFromDocumentSnapshot(documentSnapshot: documentSnapshot, documentField: NONRESIDENT + "_hunting_license")
        }
        
        for specie in species {
            if (specie.lowercased().elementsEqual("bison") || specie.lowercased().elementsEqual("muskox")) {
                totalCost += getIntFromDocumentSnapshot(documentSnapshot: documentSnapshot, documentField: "trophy_species_cost")
            } else {
                totalCost += getIntFromDocumentSnapshot(documentSnapshot: documentSnapshot, documentField: "other_species_cost")
            }
        }
        
        return totalCost
    }
    
    
    private func calculateArizonaApplyingCost(documentSnapshot: DocumentSnapshot, species: [String]) -> Int {
        var totalCost = 0
        
        if isResident {
            totalCost += getIntFromDocumentSnapshot(documentSnapshot: documentSnapshot, documentField: "_hunting_license")
        } else {
            totalCost += getIntFromDocumentSnapshot(documentSnapshot: documentSnapshot, documentField: NONRESIDENT + "_hunting_license")
        }
        
        totalCost += (species.count * getIntFromDocumentSnapshot(documentSnapshot: documentSnapshot, documentField: "cost_per_species"))
        
        return totalCost
    }

    private func calculateCaliforniaApplyingCost(documentSnapshot: DocumentSnapshot, species: [String]) -> Int {
        var totalCost = 0
        
        if isResident {
            totalCost += getIntFromDocumentSnapshot(documentSnapshot: documentSnapshot, documentField: "_hunting_license")
        } else {
            totalCost += getIntFromDocumentSnapshot(documentSnapshot: documentSnapshot, documentField: NONRESIDENT + "_hunting_license")
        }
        
        totalCost += (species.count * getIntFromDocumentSnapshot(documentSnapshot: documentSnapshot, documentField: "cost_per_species"))
        
        return totalCost
    }

    private func calculateColoradoApplyingCost(documentSnapshot: DocumentSnapshot, species: [String]) -> Int {
        var totalCost = 0
        
        if isResident {
            totalCost += getIntFromDocumentSnapshot(documentSnapshot: documentSnapshot, documentField: RESIDENT + "_hunting_license")
            for specie in species {
                if (specie.lowercased().elementsEqual("moose") || specie.lowercased().elementsEqual("bighorn_sheep") || specie.lowercased().elementsEqual("mountain_goat")) {
                    totalCost += getIntFromDocumentSnapshot(documentSnapshot: documentSnapshot, documentField: RESIDENT + "_trophy_species_cost")
                } else {
                    totalCost += getIntFromDocumentSnapshot(documentSnapshot: documentSnapshot, documentField: RESIDENT + "other_species_cost")
                }
            }
        } else {
            totalCost += getIntFromDocumentSnapshot(documentSnapshot: documentSnapshot, documentField: NONRESIDENT + "_hunting_license")
            for specie in species {
                if (specie.lowercased().elementsEqual("moose") || specie.lowercased().elementsEqual("bighorn_sheep") || specie.lowercased().elementsEqual("mountain_goat")) {
                    totalCost += getIntFromDocumentSnapshot(documentSnapshot: documentSnapshot, documentField: NONRESIDENT + "_trophy_species_cost")
                } else {
                    totalCost += getIntFromDocumentSnapshot(documentSnapshot: documentSnapshot, documentField: NONRESIDENT + "other_species_cost")
                }
            }
        }
        
        totalCost += getIntFromDocumentSnapshot(documentSnapshot: documentSnapshot, documentField: "habitat_stamp")
        
        return totalCost;
    }

    private func calculateIdahoApplyingCost(documentSnapshot: DocumentSnapshot, species: [String]) -> Int {
        var totalCost = 0
        
        if isResident {
            totalCost += getIntFromDocumentSnapshot(documentSnapshot: documentSnapshot, documentField: RESIDENT + "_hunting_license")
            for specie in species {
                if (specie.lowercased().elementsEqual("moose") || specie.lowercased().elementsEqual("bighorn sheep") || specie.lowercased().elementsEqual("mountain_goat")) {
                    totalCost += getIntFromDocumentSnapshot(documentSnapshot: documentSnapshot, documentField: RESIDENT + "_trophy_species_cost")
                } else {
                    totalCost += getIntFromDocumentSnapshot(documentSnapshot: documentSnapshot, documentField: RESIDENT + "_other_species_cost")
                }
            }
        } else {
            totalCost += getIntFromDocumentSnapshot(documentSnapshot: documentSnapshot, documentField: NONRESIDENT + "_hunting_license")
            for specie in species {
                if (specie.lowercased().elementsEqual("moose") || specie.lowercased().elementsEqual("bighorn sheep") || specie.lowercased().elementsEqual("mountain_goat")) {
                    totalCost += getIntFromDocumentSnapshot(documentSnapshot: documentSnapshot, documentField: NONRESIDENT + "_trophy_species_cost")
                } else {
                    totalCost += getIntFromDocumentSnapshot(documentSnapshot: documentSnapshot, documentField: NONRESIDENT + "_other_species_cost")
                }
            }
        }
        
        return totalCost
    }

    private func calculateMaineApplyingCost(documentSnapshot: DocumentSnapshot) -> Int {
        return getIntFromDocumentSnapshot(documentSnapshot: documentSnapshot, documentField: "moose_point_fee")
    }

    private func calculateMontanaApplyingCost(documentSnapshot: DocumentSnapshot, species: [String]) -> Int {
        return 0
    }

    private func calculateNevadaApplyingCost(documentSnapshot: DocumentSnapshot, species: [String]) -> Int {
        var totalCost = 0
        
        if isResident {
            totalCost += getIntFromDocumentSnapshot(documentSnapshot: documentSnapshot, documentField: RESIDENT + "_hunting_license")
            for specie in species {
                if specie.lowercased().elementsEqual("elk") {
                    totalCost += getIntFromDocumentSnapshot(documentSnapshot: documentSnapshot, documentField: RESIDENT + "_elk_cost")
                } else {
                    totalCost += getIntFromDocumentSnapshot(documentSnapshot: documentSnapshot, documentField: RESIDENT + "_other_species_cost")
                }
            }
        } else {
            totalCost += getIntFromDocumentSnapshot(documentSnapshot: documentSnapshot, documentField: NONRESIDENT + "_hunting_license")
            for specie in species {
                if specie.lowercased().elementsEqual("elk") {
                    totalCost += getIntFromDocumentSnapshot(documentSnapshot: documentSnapshot, documentField: NONRESIDENT + "_elk_cost")
                } else {
                    totalCost += getIntFromDocumentSnapshot(documentSnapshot: documentSnapshot, documentField: NONRESIDENT + "_other_species_cost")
                }
            }
        }
        
        return totalCost
    }

    private func calculateNewMexicoApplyingCost(documentSnapshot: DocumentSnapshot, species: [String]) -> Int {
        var totalCost = 0
        
        if (isResident) {
            totalCost += getIntFromDocumentSnapshot(documentSnapshot: documentSnapshot, documentField: RESIDENT + "_hunting_license")
        } else {
            totalCost += getIntFromDocumentSnapshot(documentSnapshot: documentSnapshot, documentField: NONRESIDENT + "_hunting_license")
        }
        
        totalCost += getIntFromDocumentSnapshot(documentSnapshot: documentSnapshot, documentField: "habitat_stamp")
        totalCost += (species.count * getIntFromDocumentSnapshot(documentSnapshot: documentSnapshot, documentField: "cost_per_species"))
        
        return totalCost
    }

    private func calculateOregonApplyingCost(documentSnapshot: DocumentSnapshot, species: [String]) -> Int {
        var totalCost = 0
        
        if (isResident) {
            totalCost += getIntFromDocumentSnapshot(documentSnapshot: documentSnapshot, documentField: RESIDENT + "_hunting_license")
        } else {
            totalCost += getIntFromDocumentSnapshot(documentSnapshot: documentSnapshot, documentField: NONRESIDENT + "_hunting_license")
        }
        
        totalCost += (species.count * getIntFromDocumentSnapshot(documentSnapshot: documentSnapshot, documentField: "cost_per_species"))
        
        return totalCost
    }

    private func calculateSouthDakotaApplyingCost(documentSnapshot: DocumentSnapshot, species: [String]) -> Int {
        var totalCost = 0
        
        if (isResident) {
            totalCost += getIntFromDocumentSnapshot(documentSnapshot: documentSnapshot, documentField: RESIDENT + "_hunting_license")
        } else {
            totalCost += getIntFromDocumentSnapshot(documentSnapshot: documentSnapshot, documentField: NONRESIDENT + "_hunting_license")
        }
        
        totalCost += getIntFromDocumentSnapshot(documentSnapshot: documentSnapshot, documentField: "habitat_stamp")
        totalCost += (species.count * getIntFromDocumentSnapshot(documentSnapshot: documentSnapshot, documentField: "cost_per_species"))
        
        return totalCost
    }

    private func calculateUtahApplyingCost(documentSnapshot: DocumentSnapshot, species: [String]) -> Int {
        var totalCost = 0
        
        if (isResident) {
            totalCost += getIntFromDocumentSnapshot(documentSnapshot: documentSnapshot, documentField: RESIDENT + "_hunting_license")
        } else {
            totalCost += getIntFromDocumentSnapshot(documentSnapshot: documentSnapshot, documentField: NONRESIDENT + "_hunting_license")
        }
        
        totalCost += (species.count * getIntFromDocumentSnapshot(documentSnapshot: documentSnapshot, documentField: "cost_per_species"))
        
        return totalCost
    }

    private func calculateWashingtonApplyingCost(documentSnapshot: DocumentSnapshot, species: [String]) -> Int {
        return 0
    }


    private func calculateWyomingApplyingCost(documentSnapshot: DocumentSnapshot, species: [String]) -> Int {
        var totalCost = 0
        
        for specie in species {
            switch (specie) {
                case "antelope":
                    totalCost += getIntFromDocumentSnapshot(documentSnapshot: documentSnapshot, documentField: "antelope_preference_point_cost")
                case "deer":
                    totalCost += getIntFromDocumentSnapshot(documentSnapshot: documentSnapshot, documentField: "deer_preference_point_cost")
                case "elk":
                    totalCost += getIntFromDocumentSnapshot(documentSnapshot: documentSnapshot, documentField: "elk_preference_point_cost")
                case "bighorn sheep":
                    if (isResident) {
                        totalCost += getIntFromDocumentSnapshot(documentSnapshot: documentSnapshot, documentField: RESIDENT + "_bighorn_sheep_preference_point_cost")
                    } else {
                        totalCost += getIntFromDocumentSnapshot(documentSnapshot: documentSnapshot, documentField: "bighorn_sheep_preference_point_cost")
                    }
                case "moose":
                    if (isResident) {
                        totalCost += getIntFromDocumentSnapshot(documentSnapshot: documentSnapshot, documentField: RESIDENT + "_moose_preference_point_cost")
                    } else {
                        totalCost += getIntFromDocumentSnapshot(documentSnapshot: documentSnapshot, documentField: "moose_preference_point_cost")
                    }
                default:
                    totalCost += 0
            }
        }
        
        return totalCost
    }
}
