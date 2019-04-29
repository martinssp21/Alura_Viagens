//
//  PacoteCollectionViewCell.swift
//  Alura_Viagens
//
//  Created by Rodrigo Martins on 25/04/19.
//  Copyright © 2019 Rodrigo Martins. All rights reserved.
//

import UIKit

class PacoteCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageViewPacote: UIImageView!
    @IBOutlet weak var labelCidade: UILabel!
    @IBOutlet weak var labelDias: UILabel!
    @IBOutlet weak var labelValor: UILabel!
    
    func setup(_ pacoteAtual: PacoteViagem){
        self.labelCidade.text = pacoteAtual.viagem.titulo
        self.labelDias.text = "\(pacoteAtual.viagem.quantidadeDeDias) dias"
        self.labelValor.text = "R$ \(pacoteAtual.viagem.preco)"
        self.imageViewPacote.image = UIImage(named: pacoteAtual.viagem.caminhoDaImagem)
        
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor(displayP3Red: 85.0/255.0, green: 85.0/255.0, blue: 85.0/255.0, alpha: 1).cgColor
    }
 
}
