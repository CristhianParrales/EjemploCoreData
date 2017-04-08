//
//  Persona+CoreDataProperties.swift
//  EjemploCoreData
//
//  Created by Cristhian Parrales on 8/4/17.
//  Copyright © 2017 Cristhian Parrales. All rights reserved.
//

import Foundation
import CoreData


extension Persona {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Persona> {
        return NSFetchRequest<Persona>(entityName: "Persona")
    }

    @NSManaged public var nombre: String?
    @NSManaged public var apellido: String?
    @NSManaged public var edad: String?

}
