//
//  ContraseñaNueva.swift
//  Proyecto IOS Lab - Tigre Bus
//
//  Created by iOSLabMini05 on 22/05/22.
//

import UIKit
import FirebaseDatabase

class Contrasen_aNueva: UIViewController {
    
    var ref: DatabaseReference! = Database.database().reference().child("Usuarios")

    @IBOutlet weak var campoContraseña: UITextField!
    
    var matricula: String?
    var matriculaFirebase: String = ""
    
    var contraseña: String = ""
    func obtenerMatricula(){
        if matricula != nil {
            matriculaFirebase = matricula!
        }
        print("MATRICULA OBTENIDA \(matriculaFirebase)")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        obtenerMatricula()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func botonIngresar(_ sender: UIButton) {
        obtenerTexto()
        if contraseña == ""{
            alerta()
        }else{
            iniciarSesion()
        }
    }
    
    func alerta(){
        let dialogMessage = UIAlertController(title: "Error", message: "Por favor rellene el campo", preferredStyle: .alert)
         
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
        let dialogMessage = UIAlertController(title: "Error", message: "No se encuentra este usuario", preferredStyle: .alert)
         
         // Create OK button with action handler
         let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
             print("Ok button tapped")
          })
         
         //Add OK button to a dialog message
         dialogMessage.addAction(ok)
         // Present Alert to
         self.present(dialogMessage, animated: true, completion: nil)
        
    }
    
    
    func iniciarSesion(){
        ref.observe(.value, with: { (snapshot) in
            if snapshot.hasChild(self.matriculaFirebase){
                self.cambiarContraseña()
            }else{
                    self.alerta2()
            }
            
            print(snapshot.childrenCount)
        }){ (error) in
            print("ERROR BASE DE DATOS")
        }
    }
    
    func cambiarContraseña(){
        ref.child(matriculaFirebase).child("Contraseña").setValue(contraseña)
        self.alerta3()
    
    }
    
    func alerta3(){
        let dialogMessage = UIAlertController(title: "Aviso", message: "Se ha cambiado su contraseña", preferredStyle: .alert)
         
         // Create OK button with action handler
         let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
             self.pantallaInicioSesion()
             print("Ok button tapped")
          })
         
         //Add OK button to a dialog message
         dialogMessage.addAction(ok)
         // Present Alert to
         self.present(dialogMessage, animated: true, completion: nil)
        
    }
    
    func pantallaInicioSesion(){
        performSegue(withIdentifier: "PantallaInicioSesionContraseña", sender: self)
    }
    
    func obtenerTexto(){
        if let textoMatricula = campoContraseña.text{
            contraseña = textoMatricula
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
