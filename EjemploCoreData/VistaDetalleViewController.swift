//
//  VistaDetalleViewController.swift
//  EjemploCoreData
//
//  Created by Cristhian Parrales on 8/4/17.
//  Copyright © 2017 Cristhian Parrales. All rights reserved.
//

import UIKit
import CoreData

class VistaDetalleViewController: UIViewController {

    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtApellido: UITextField!
    @IBOutlet weak var txtEdad: UITextField!
    
    var existePersona: NSManagedObject!
    
    
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
    }
    
    

    @IBAction func guardarRegistro(_ sender: Any) {
    }
    
    
}
