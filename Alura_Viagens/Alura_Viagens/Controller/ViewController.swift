//
//  ViewController.swift
//  Alura_Viagens
//
//  Created by Rodrigo Martins on 18/04/19.
//  Copyright © 2019 Rodrigo Martins. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableViewViagens: UITableView!
    
    let listaViagem: Array<Viagem> = ViagemDAO.retornaTodasAsViagens()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewViagens.delegate = self
        tableViewViagens.dataSource = self
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaViagem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellDestiny", for: indexPath) as! TableViewCell
        let viagemLinha = listaViagem[indexPath.row]
        cell.labelTitulo.text = viagemLinha.titulo
        cell.labelQuantidadeDeDias.text = "\(viagemLinha.quantidadeDeDias) dias"
        cell.labelPreco.text = "R$ \(viagemLinha.preco)"
        cell.imageViewViagem.image = UIImage(named: viagemLinha.caminhoDaImagem)
        
        cell.imageViewViagem.layer.cornerRadius = 10
        cell.imageViewViagem.layer.masksToBounds = true
        
        return cell
    }
    
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone ? 175 : 260
    }
    
}

