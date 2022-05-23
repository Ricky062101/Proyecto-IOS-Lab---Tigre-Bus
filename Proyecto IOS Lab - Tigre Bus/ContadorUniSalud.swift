//
//  ContadorUniSalud.swift
//  Proyecto IOS Lab - Tigre Bus
//
//  Created by iOSLabMini05 on 19/05/22.
//

import UIKit
import FirebaseDatabase

class ContadorUniSalud: UIViewController {
    
    
    @IBOutlet weak var botonPrincipal: UIButton!
    var ref: DatabaseReference! = Database.database().reference().child("Rutas").child("Ruta 4")
    
    var contador: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        botonPrincipal.layer.cornerRadius = botonPrincipal.frame.size.width / 2
        botonPrincipal.layer.masksToBounds = true
        botonPrincipal.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        ref.observe(.value, with: {(snapshot) in
            if let diccionario =  snapshot.value as? [String: Any]{
                let firebaseContadorRuta1 = diccionario["Numero Parada"] as! Int
                self.contador = firebaseContadorRuta1
            }
        })
        // Do any additional setup after loading the view.
    }
    

    @IBAction func botonParada(_ sender: UIButton) {
        contadorMas()
        if contador == 1 {
            ref.setValue([
                "Numero Parada":contador, "Parada 1":true, "Parada 2": false])
        }
        if contador == 2 {
            ref.setValue([
                "Numero Parada":contador, "Parada 1":false, "Parada 2": true])
        }
        if contador == 3{
            contador = 0
            ref.setValue([
                "Numero Parada":contador, "Parada 1":false, "Parada 2": false])
        }
    }
    
    func contadorMas(){
        if contador != nil{
            contador += 1
            print(contador)
        }else{
            print("ESTA MAL XD")
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
