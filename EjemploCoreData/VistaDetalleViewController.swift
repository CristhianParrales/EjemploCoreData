//
//  VistaDetalleViewController.swift
//  EjemploCoreData
//
//  Created by Cristhian Parrales on 8/4/17.
//  Copyright © 2017 Cristhian Parrales. All rights reserved.
//

import UIKit
import CoreData

class VistaDetalleViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtApellido: UITextField!
    @IBOutlet weak var txtEdad: UITextField!
    
    var existePersona: NSManagedObject!
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.isEqual(txtNombre) {
            txtApellido.becomeFirstResponder()
        } else if textField.isEqual(txtApellido) {
            txtEdad.becomeFirstResponder()
        } else if textField.isEqual(txtEdad) {
            txtEdad.resignFirstResponder()
        }
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MEDIANTE UN CONDICIONAL VOY A COMPROBAR SI EXISTTE PERSONA TIENE ALGO
        
        if existePersona != nil {
            self.txtNombre.text = existePersona.value(forKey: "nombre") as! String?
            self.txtApellido.text = existePersona.value(forKey: "apellido") as! String?
            self.txtEdad.text = existePersona.value(forKey: "edad") as! String?
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func cancelar(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

    @IBAction func guardarRegistro(_ sender: Any) {
        // Objeto de la clae ManagedObjectContext
        let miDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let objetcContext = miDelegate.persistentContainer.viewContext
 
        if existePersona != nil {
            // actualizar datos
            existePersona.setValue(txtNombre.text, forKey: "nombre")
            existePersona.setValue(txtApellido.text, forKey: "apellido")
            existePersona.setValue(txtEdad.text, forKey: "edad")
        
        } else {
        
        
        
            // CREAR UNA INSTANCIA A LA CLASE PERSONA, Y LE ASIGNAMOS LA ENTIDAD Y CONTEXTE
            let newPersona = NSEntityDescription.insertNewObject(forEntityName: "Persona", into: objetcContext) as! Persona
        
            // Mapear cada textField con las propiedades
            newPersona.nombre = txtNombre.text
            newPersona.apellido = txtApellido.text
            newPersona.edad = txtEdad.text
        
        }
        miDelegate.saveContext()
        
        navigationController?.popViewController(animated: true)
        

    }
    
    
}
