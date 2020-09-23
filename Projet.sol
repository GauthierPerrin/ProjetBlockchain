pragma solidity ^0.6.12;
import "./Ownable.sol";

contract Local is Ownable{
    
     address[] public listWhited;

    function addIntervenantsInWhiteList(address[] memory _intervenantsWhited) public {
        listWhited = _intervenantsWhited;
	}
    
    modifier onlyWhitedIntervenant() {
        bool isWhited = false;
        for (uint256 i = 0; i < listWhited.length - 1; i++ ) {
            if (listWhited[i] == msg.sender) {
                isWhited = true;
                break;
            }
        }
        require(isWhited);
        _;
    }
   

    
   //Model FournisseurMatierePremiere
   struct Fournisseur{
       int id;
       string Nomduproduit;
       int Quantiteparlot; 
       int Nombredelots;
      
   }
   //Fournisseur
    struct MatierePremiere{
        string Nom;
        string Type; 
        int Quantiteparlot; 
        int Nombredelots; 
    }
    struct Fournisseurr{
        int IdLot;
        string IdFournisseur;
    }
    struct Transporteur{
        string IdTransporteurF;    
        uint DateExpedition;
        int IdLot;
        int Nombredelots; 
    }
    struct ControleMP{
        int IdLot;
        string IdTransporteurF;
        int Nombredelots;
    }

    //Local
    struct SuivieElevage {
        string Etat;
    }
    struct ControleTransformation {
        string Lieu;
        uint Dateabattage;
    }
    struct Conditionnement {
        uint Limiteconsommation;
	    uint DateEmballage;
    }
    struct ControleSortie {
        int NombredelotsS;
        uint DateSortie;
    }
	    
    //Client 
    struct TransporteurC{
        string IdTransporteur;
        uint DateEnlevement;
        
    }
     struct Client{
        uint DateAchat;
        int Quanite;
     }
    
    
    uint FournisseurCount;
    mapping(uint => Fournisseur) public FournisseurL;

    function addFournisseur (int _FournisseurCount, string memory _nomduproduit, int  _quantitelot, int  _nombrelot) public {
        FournisseurCount++;
        FournisseurL[FournisseurCount] = Fournisseur(_FournisseurCount, _nomduproduit, _quantitelot, _nombrelot);
    }
    
    function matierePremiere (string memory _nom, string memory _Ttype,  int  _nombrelot, int  _quantitelot) public{
       MatierePremiere(_nom, _Ttype, _nombrelot, _quantitelot);
    }
    
    function fournisseur (int _idl, string memory _idf) public {
        Fournisseurr(_idl,_idf);
    }
    
    function transporteur (string memory _idt, uint _de, int _idl, int _ndl) public{
        Transporteur(_idt, _de, _idl, _ndl);
    }
    
    function controleMp (int _idl, string memory _idtf, int _ndl) public{
        ControleMP(_idl, _idtf, _ndl);
    }
    
    function suivieElevage (string memory _etat) public{
        SuivieElevage(_etat);
    }
    function controleTransformation (string memory _l, uint _da) public{
        controleTransformation(_l, _da);
    }
    function conditionnement (uint _lc,uint _de) public{
        Conditionnement(_lc, _de);
    }
    function controleSortie (int _ndl,uint _ds) public{
        ControleSortie(_ndl,_ds);
    }
    function transporteurC(string memory _idtransporteur, uint _denlevement)public{
        TransporteurC (_idtransporteur,_denlevement);
    }
    
    function client(uint _DateAchat, int _Quanite)public{
        Client (_DateAchat, _Quanite);
    }
}