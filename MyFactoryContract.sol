// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract MyContract {
    mapping(string => mapping(string => uint)) product;
    mapping(string => uint) konums;
    string[5] konumsList = ["uretici","fabrika","depo","magaza","satildi"];

    constructor()
    {
        konums["uretici"] = 1; 
        konums["fabrika"] = 2; 
        konums["depo"] = 3; 
        konums["magaza"] = 4; 
        konums["satildi"] = 5; 
    }    

    function createProduct(string memory barcode, uint stock) public {
        if (product[barcode]["konum"] == 0)
        {
            product[barcode]["konum"] = 1;
            product[barcode]["stock"] = stock;
        }
    }

    function transferProduct(string memory barcode, string memory konum) public {
        uint fark = konums[konum] - product[barcode]["konum"];
        if (fark == 1 && konums[konum]<5)
        {
            product[barcode]["konum"] = konums[konum];
        }
    }

    function deleteProduct(string memory barcode, uint stock) public {
        if (product[barcode]["konum"] == 4 && product[barcode]["stock"] - stock >= 0)
        {
            product[barcode]["stock"] = product[barcode]["stock"] - stock;
            if (product[barcode]["stock"] == 0)
                product[barcode]["konum"] = 5;
        }
    }

    function addStock(string memory barcode, uint stock) public {
        if (product[barcode]["konum"] < 5)
        {
            product[barcode]["stock"] = product[barcode]["stock"] + stock;
        }
    }

    function reStock(string memory barcode, uint stock) public {
        if (product[barcode]["konum"] == 5)
        {
            product[barcode]["stock"] = product[barcode]["stock"] + stock;
            product[barcode]["konum"] = 2;
        }
    }

    function getKonum(string memory barcode) public view returns(string memory){
        return konumsList[product[barcode]["konum"] - 1];
    }

    function getStock(string memory barcode) public view returns(uint){
        return product[barcode]["stock"];
    }
}
