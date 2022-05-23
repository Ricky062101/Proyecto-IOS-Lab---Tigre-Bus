//
//  ViewControllerRegistrarse.swift
//  Proyecto IOS Lab - Tigre Bus
//
//  Created by iOSLabMini05 on 13/05/22.
//

import UIKit
import FirebaseDatabase
import SwiftUI

class ViewControllerRegistrarse: UIViewController {
    
    var ref: DatabaseReference!

    var matricula: String = ""
    var contraseña: String = ""
    var fruta: String = ""
    
    
    
    
    @IBOutlet weak var campoMatricula: UITextField!
    @IBOutlet weak var campoContraseña: UITextField!
    @IBOutlet weak var campoFruta: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        campoMatricula.keyboardType = .numberPad
        // Do any additional setup after loading the view.
    }
    
    
    func alerta(){
        let dialogMessage = UIAlertController(title: "Aviso", message: "Se ha agregado su cuenta", preferredStyle: .alert)
         
         // Create OK button with action handler
         let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
             self.InicioSesionPantalla()
             print("Ok button tapped")
          })
         
         //Add OK button to a dialog message
         dialogMessage.addAction(ok)
         // Present Alert to
         self.present(dialogMessage, animated: true, completion: nil)
        
    }
    
    func alerta2(){
        let dialogMessage = UIAlertController(title: "Aviso", message: "Por favor rellene todos los campos", preferredStyle: .alert)
         
         // Create OK button with action handler
         let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
             print("Ok button tapped")
          })
         
         //Add OK button to a dialog message
         dialogMessage.addAction(ok)
         // Present Alert to
         self.present(dialogMessage, animated: true, completion: nil)
        
    }
    
    func InicioSesionPantalla(){
        performSegue(withIdentifier: "InicioSesionPantallaRegistro", sender: self)
    }
    
    @IBAction func botonRegistrarAccion(_ sender: UIButton) {
        obtenerTexto()
        if contraseña == "" || matricula == "" || fruta == ""{
            alerta2()
        }else{
            Database.database().reference().child("Usuarios").child(matricula).setValue(["Matricula":matricula,"Contraseña":contraseña,"Fruta":fruta])
            limpiarCeldas()
            alerta()
        }
    }
    
    
    func limpiarCeldas(){
        campoMatricula.text = ""
        campoContraseña.text = ""
        campoFruta.text = ""
    }
    
    func obtenerTexto(){
        if let texto = campoMatricula.text{
            matricula = texto
            print("MATRICULA = \(matricula)")
        }else{
            print("No hay texto")
        }
        if let textoContraseña = campoContraseña.text{
            contraseña = textoContraseña
            print("Contraseña = \(contraseña)")
        }else{
            print("No hay texto")
        }
        if let textoFruta = campoFruta.text{
            fruta = textoFruta
            print("Fruta = \(fruta)")
        }else{
            print("No hay texto")
        }
        

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
