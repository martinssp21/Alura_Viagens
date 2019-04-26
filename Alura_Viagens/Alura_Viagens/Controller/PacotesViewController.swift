//
//  PacotesViewController.swift
//  Alura_Viagens
//
//  Created by Rodrigo Martins on 25/04/19.
//  Copyright © 2019 Rodrigo Martins. All rights reserved.
//

import UIKit

class PacotesViewController: UIViewController {
    @IBOutlet weak var colectionViewPacotes: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var labelTotalPacote: UILabel!
    
    let listaComTodasViagens: Array<Viagem> = ViagemDAO.retornaTodasAsViagens()
    var listaViagens:Array<Viagem> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.listaViagens = self.listaComTodasViagens
        
        self.colectionViewPacotes.dataSource = self
        self.colectionViewPacotes.delegate = self
        self.searchBar.delegate = self
        self.atualizaContadorPacotes()
    }
    
    public func atualizaContadorPacotes(){
        let contadorPacote = listaViagens.count
        labelTotalPacote.text = contadorPacote == 1 ? "1 pacote encontrado":"\(contadorPacote) pacotes encontrados"
    }
}

extension PacotesViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.listaViagens = self.listaComTodasViagens
        
        if searchText != "" {
            let filtroListaViagem = NSPredicate(format: "titulo contains %@", searchText)
            let listaFiltrada:Array<Viagem> = (self.listaViagens as NSArray).filtered(using: filtroListaViagem) as! Array
            print((listaFiltrada.count))
            self.listaViagens = listaFiltrada
        }
        
        self.atualizaContadorPacotes()
        self.colectionViewPacotes.reloadData()
    }
}

extension PacotesViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listaViagens.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellPacotes", for: indexPath) as! PacoteCollectionViewCell
        
        let viagemLinha = listaViagens[indexPath.row]
        cell.labelCidade.text = viagemLinha.titulo
        cell.labelDias.text = "\(viagemLinha.quantidadeDeDias) dias"
        cell.labelValor.text = "R$ \(viagemLinha.preco)"
        cell.imageViewPacote.image = UIImage(named: viagemLinha.caminhoDaImagem)
        
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
        
        cell.layer.borderWidth = 0.5
        cell.layer.borderColor = UIColor(displayP3Red: 85.0/255.0, green: 85.0/255.0, blue: 85.0/255.0, alpha: 1).cgColor
        
        
        return cell
    }
}

extension PacotesViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.bounds.width/2)-15, height: 160)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "detalhes") as! DetalhePacoteViewController
        self.present(controller, animated: true, completion: nil)
    }
}

