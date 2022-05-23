//
//  ViewControllerInicioSesion.swift
//  Proyecto IOS Lab - Tigre Bus
//
//  Created by iOSLabMini05 on 12/05/22.
//

import UIKit
import FirebaseDatabase
import SwiftUI

class ViewControllerInicioSesion: UIViewController {

    @IBOutlet weak var campoMatricula: UITextField!
    
    var ref: DatabaseReference! = Database.database().reference().child("Usuarios")
    
    
    @IBAction func botonIniciarSesion(_ sender: UIButton) {
        obtenerTexto()
        if matricula == "" && contraseña == ""{
            alerta()
        }else{
            iniciarSesion()
        }
    }
    @IBOutlet weak var botonOlvideContraseña: UIButton!
    @IBOutlet weak var campoContraseña: UITextField!
    var contador: Int = 0
    var matricula: String = ""
    var contraseña: String = ""
    
    @IBOutlet weak var botonRegistrarse: UIButton!
    
    @IBOutlet weak var botonIngresar: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        campoMatricula.returnKeyType = .done
        campoMatricula.autocapitalizationType = .words
        campoMatricula.autocorrectionType = .no
        campoContraseña.isSecureTextEntry = true
        // Do any additional setup after loading the view.
    }
    
    func limpiarCeldas(){
        campoMatricula.text = ""
        campoContraseña.text = ""
    }
    
    func alerta(){
        let dialogMessage = UIAlertController(title: "Error", message: "El usuario no existe", preferredStyle: .alert)
         
         // Create OK button with action handler
         let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
             print("Ok button tapped")
          })
         
         //Add OK button to a dialog message
         dialogMessage.addAction(ok)
         // Present Alert to
         self.present(dialogMessage, animated: true, completion: nil)
        
    }
    
    func alerta2(){
        let dialogMessage = UIAlertController(title: "Error", message: "La contraseña es incorrecta", preferredStyle: .alert)
         
         // Create OK button with action handler
         let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
             print("Ok button tapped")
          })
         
         //Add OK button to a dialog message
         dialogMessage.addAction(ok)
         // Present Alert to
         self.present(dialogMessage, animated: true, completion: nil)
        
    }
    
    func alerta3(){
        let dialogMessage = UIAlertController(title: "Bienvenido", message: "Ha ingresado correctamente", preferredStyle: .alert)
         
         // Create OK button with action handler
         let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
             self.limpiarCeldas()
             self.usuarioPantalla()
             print("Ok button tapped")
          })
         
         //Add OK button to a dialog message
         dialogMessage.addAction(ok)
         // Present Alert to
         self.present(dialogMessage, animated: true, completion: nil)
        
    }
    
    func alerta4(){
        let dialogMessage = UIAlertController(title: "Bienvenido", message: "Ha ingresado como chofer", preferredStyle: .alert)
         
         // Create OK button with action handler
         let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
             self.limpiarCeldas()
             self.choferPantalla()
             print("Ok button tapped")
          })
         
         //Add OK button to a dialog message
         dialogMessage.addAction(ok)
         // Present Alert to
         self.present(dialogMessage, animated: true, completion: nil)
        
    }
    
    func iniciarSesion(){
        ref.observe(.value, with: { (snapshot) in
            if snapshot.hasChild(self.matricula){
                print("Matricula iniciar sesion \(self.matricula)")
                print("Usuario correcto")
                self.obtenerContraseña()
            }else{
                if self.matricula.elementsEqual("123456789"){
                    self.obtenerContraseña()
                }else{
                    self.alerta()
                }
                
            }
            
            print(snapshot.childrenCount)
        }){ (error) in
            print("ERROR BASE DE DATOS")
        }
    }
    func observeSingleEvent(of eventType: DataEventType, with block: @escaping (DataSnapshot) -> Void){
        
    }
    func obtenerTexto(){
        if let textoMatricula = campoMatricula.text{
            matricula = textoMatricula
            print("Matricula = \(matricula)")
        }else{
            print("No hay texto")
        }
        if let textoContraseña = campoContraseña.text{
            contraseña = textoContraseña
            print("Contraseña = \(contraseña)")
        }else{
            print("No hay texto")
        }
    }
    
    func obtenerContraseña(){
        
        if self.contraseña.elementsEqual("admin1849107"){
            self.alerta4()
        }else{
        ref.child(matricula).observe(.value, with: {(snapshot) in
            if let diccionario = snapshot.value as? [String: Any]{
                let contraseñaFirebase = diccionario["Contraseña"] as! String
                if self.contraseña.elementsEqual(contraseñaFirebase){
                    self.alerta3()
                }else{
                    self.alerta2()
                }
                
            }
        })
        {(error) in
            print("Error base de datos")
        }
        }
        
    }
    
    func usuarioPantalla(){
        performSegue(withIdentifier: "LoginUsuario", sender: self)
    }
    
    func choferPantalla(){
        performSegue(withIdentifier: "LoginChofer", sender: self)
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
