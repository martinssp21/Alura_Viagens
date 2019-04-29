//
//  TableViewCell.swift
//  Alura_Viagens
//
//  Created by Rodrigo Martins on 24/04/19.
//  Copyright © 2019 Rodrigo Martins. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var labelQuantidadeDeDias: UILabel!
    @IBOutlet weak var labelPreco: UILabel!
    @IBOutlet weak var imageViewViagem: UIImageView!
    
    func setup (_ viagem: Viagem){
        self.labelTitulo.text = viagem.titulo
        self.labelQuantidadeDeDias.text = "\(viagem.quantidadeDeDias) dias"
        self.labelPreco.text = "R$ \(viagem.preco)"
        self.imageViewViagem.image = UIImage(named: viagem.caminhoDaImagem)
        self.imageViewViagem.layer.cornerRadius = 10
        self.imageViewViagem.layer.masksToBounds = true
    }
    
}
