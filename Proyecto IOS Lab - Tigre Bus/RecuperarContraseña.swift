//
//  RecuperarContraseña.swift
//  Proyecto IOS Lab - Tigre Bus
//
//  Created by iOSLabMini05 on 22/05/22.
//

import UIKit
import FirebaseDatabase


class RecuperarContrasen_a: UIViewController {
    @IBOutlet weak var campoMatricula: UITextField!
    @IBOutlet weak var campoFruta: UITextField!
    
    var ref: DatabaseReference! = Database.database().reference().child("Usuarios")
    
    var matricula: String = ""
    var fruta: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func botonIngresar(_ sender: UIButton) {
        obtenerTexto()
        if matricula == "" && fruta == ""{
            alerta()
        }else{
            iniciarSesion()
        }
        
    }
    
    func iniciarSesion(){
        ref.observe(.value, with: { (snapshot) in
            if snapshot.hasChild(self.matricula){
                print("Matricula iniciar sesion \(self.matricula)")
                print("Usuario correcto")
                self.obtenerFruta()
            }else{
                    self.alerta()
            }
            
            print(snapshot.childrenCount)
        }){ (error) in
            print("ERROR BASE DE DATOS")
        }
    }
    
    func pasarDato(){
        let controller = storyboard?.instantiateViewController(withIdentifier: "ContraseñaNueva") as! Contrasen_aNueva
        controller.matricula = self.matricula
        present(controller, animated: true, completion: nil)
    }
    
    
    func obtenerFruta(){
        ref.child(matricula).observe(.value, with: {(snapshot) in
            if let diccionario = snapshot.value as? [String: Any]{
                let contraseñaFirebase = diccionario["Fruta"] as! String
                if self.fruta.elementsEqual(contraseñaFirebase){
                    self.pasarDato()
                }else{
                    self.alerta2()
                }
                
            }
        })
        {(error) in
            print("Error base de datos")
        }
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
        let dialogMessage = UIAlertController(title: "Error", message: "La respuesta es incorrecta", preferredStyle: .alert)
         
         // Create OK button with action handler
         let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
             print("Ok button tapped")
          })
         
         //Add OK button to a dialog message
         dialogMessage.addAction(ok)
         // Present Alert to
         self.present(dialogMessage, animated: true, completion: nil)
        
    }
    
    
    func obtenerTexto(){
        if let textoMatricula = campoMatricula.text{
            matricula = textoMatricula
            print("Matricula = \(matricula)")
        }else{
            print("No hay texto")
        }
        if let textoContraseña = campoFruta.text{
            fruta = textoContraseña
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
