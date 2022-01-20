//
//  StockCell.swift
//  StocksAppUIKit
//
//  Created by Mohammad Azam on 1/20/22.
//

import Foundation
import UIKit
import SwiftUI

class StockCell: UITableViewCell {
    
    lazy var titleLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 11)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure(_ stock: StockViewModel) {
        
        titleLabel.text = stock.symbol
        subTitleLabel.text = stock.description
        priceLabel.text = stock.price.formatAsCurrency()
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(subTitleLabel)
        contentView.addSubview(priceLabel)
        
        // add constraints to the titleLabel
        titleLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        // add constraints to the subTitleLabel
        subTitleLabel.widthAnchor.constraint(equalTo: titleLabel.widthAnchor).isActive = true
        subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        subTitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        
        // add constraints on price
        priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        priceLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
}

struct StockCellRepresentable: UIViewRepresentable {
    
    func makeUIView(context: Context) -> some UIView {
        let cell = StockCell(style: .default, reuseIdentifier: "StockCell")
        cell.configure(StockViewModel(stock: Stock(symbol: "GOOG", description: "Google", price: 560)))
        return cell
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
}

struct StockCell_Previews: PreviewProvider {
    static var previews: some View {
        StockCellRepresentable()
    }
}
