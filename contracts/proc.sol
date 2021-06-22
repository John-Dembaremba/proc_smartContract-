pragma solidity >=0.7.0 <0.9.0;



contract procurement {
    
    struct Supplier_details {
        string[] name;
        string[] zimraITF263;
        string[] praz;
        string[] validity;
    }
    
   // supplier_details[] public suppliers;
    
    struct Client {
        string name;
        string product_type;
        string product;
        string requirements;
        string date;
        string delivery_period;
        string supplier;
        mapping(string => Supplier_details) suppliers;
    }
    
    mapping(address => Client) public transaction;
    
    function addTransaction(string memory _name, string memory _productType, string memory _product, string memory _req, string memory _date, string memory _del) public {
       
        Client storage client = transaction[msg.sender];
        client.name = _name;
        client.product_type = _productType;
        client.product = _product;
        client.requirements = _req;
        client.date = _date;
        client.delivery_period = _del;
    }
    
    function addSuppliers(string memory _sup, string[] memory _supNm, string[] memory _zimraITF263, string[] memory _praz, string[] memory _validity) public {
        Client storage client = transaction[msg.sender];
        client.suppliers[_sup] = Supplier_details({name: _supNm, zimraITF263: _zimraITF263, praz: _praz, validity: _validity});
        
    }
    
    
    
    
    
}