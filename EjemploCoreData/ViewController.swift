//
//  ViewController.swift
//  EjemploCoreData
//
//  Created by Cristhian Parrales on 8/4/17.
//  Copyright © 2017 Cristhian Parrales. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!

    let fetchRequest: NSFetchRequest<Persona> = Persona.fetchRequest()
    var searchResult: Array<Persona> = []
    var managedObjectContext: NSManagedObjectContext?
    
    // Funcion que devuelve un objeto de la clase NSManagedObjectContext
    func getContext() -> NSManagedObjectContext {
        let miDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        return miDelegate.persistentContainer.viewContext
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Cargar los datos almacenados en Core Data en mi array
        do {
            searchResult = try getContext().fetch(fetchRequest)
        } catch let error as NSError {
            print("El error es \(error)")
        }
        tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResult.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let CellID = "Cell"
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: CellID, for: indexPath) as UITableViewCell
        
        if (searchResult.count) > 0 {
            // Propiedades que voy a usar en la celda
            let nombre: String? = searchResult[indexPath.row].nombre
            let apellido: String? = searchResult[indexPath.row].apellido
            let edad: String? = searchResult[indexPath.row].edad
            
            // Lo pinto en la celdad
            cell.textLabel?.text = "\(nombre!), \(apellido!)"
            cell.detailTextLabel?.text = edad
        }
       return cell
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "actualizar" {
            
            // Crear el IndexPath, que es el encargado de almacenar el indice de la tabla
            var indexPath: IndexPath = self.tableView.indexPathForSelectedRow!
            
            // Crear un objeto de la clase NSManagedObject y le paso mi array de la fila seleccionada
            let selectedItem: NSManagedObject = searchResult[indexPath.row] as NSManagedObject
            
            // Crear una instancia de la vista detalle
            let vistaDetalle: VistaDetalleViewController = segue.destination as! VistaDetalleViewController
            
            vistaDetalle.existePersona = selectedItem
        
        }
    }
// Para borrar
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        do {
            if editingStyle == UITableViewCellEditingStyle.delete {
                if let tableV = self.tableView {
                    managedObjectContext?.delete(searchResult[indexPath.row] as NSManagedObject)
                    
                    searchResult.remove(at: indexPath.row)
                    
                    tableV.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
                }
                do {
                    try managedObjectContext?.save()
                } catch  let error as NSError {
                    print("El error e: \(error)")
                    abort()
                }
            }
        }
    }
}






















