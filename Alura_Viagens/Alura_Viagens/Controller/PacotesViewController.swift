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
    
    let listaComTodasViagens: Array<PacoteViagem> = PacoteViagemDAO.retornaTodasAsViagens()
    var listaViagens:Array<PacoteViagem> = []
    
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
            self.listaViagens = listaViagens.filter({ $0.viagem.titulo.contains(searchText) })
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
        
        let pacoteAtual = listaViagens[indexPath.row]
        
        cell.setup(pacoteAtual)
        
        
        return cell
    }
}

extension PacotesViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.bounds.width/2)-15, height: 160)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let pacote = listaViagens[indexPath.item]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "detalhes") as! DetalhePacoteViewController
        controller.pacoteSelecionado = pacote
        if let navigation = self.navigationController {
            navigation.pushViewController(controller, animated: true)
        }
    }
}

