pragma solidity ^0.5.*;
contract Ministry_defense{
    
        
            
            
            string  name;
            string  addresss;
            uint  telephone_no;
            string nationality;
        
        
    
        struct aircraftDetails{
            string  location_iaf; //Location of the proposed aerodrome/ helipad site with reference to the nearest IAF aerodrome
            string  latitude; //Latitude and Longitude of the place 
            string  longitude;
            string  district; //State/ District in which proposed location is situated 
            string  state;
            string  category; //Type/category of aerodrome proposed to be constructed (ICAO Aerodrome Reference Code) 
            string  type_aircraft; //Type of aircraft intended to use the aerodrome 
            uint  elevation; //Elevation of the site 
            
           
        
        }
         enum OperationAirfield{Public,Commercial} //Purpose of operation of airfield i.e. private/ commercial.
            enum MedicalFacilities{Yes,No}
            struct Aircraft{
                OperationAirfield operationairfield;
                MedicalFacilities medicalfacilities;
                
            }
            Aircraft public myAircraft;
            
        mapping(address=> aircraftDetails) public formFiller;
        address[] public applicantAccts;
        
        
   
    
    function applicant(string memory _name,string memory _addresss,uint _telephone,string memory _nationality) public returns(string memory,string memory,uint,string memory){
    
        name=_name;
        addresss=_addresss;
        telephone_no= _telephone;
        nationality= _nationality;
        
    }
    function getApplicantDetails() public view returns(string memory,string memory,uint,string memory){
        return (name,addresss,telephone_no,nationality);
    }
    function helipad(address _address,string memory _location,string memory _latitude,string memory _longitude,string memory _district,string memory _state,string memory _category,string memory _typeAircraft ) public returns(string memory ){
        var formfiller= formFiller[_address];
        formfiller.location_iaf=_location;
        formfiller.latitude=_latitude;
        formfiller.longitude=_longitude;
        formfiller.district=_district;
        formfiller.state= _state;
        formfiller.category=_category;
        formfiller.type_aircraft=_typeAircraft;
        applicantAccts.push(_address-1);
        
    }
    function getApplicantAccounts() view public returns (address[]) {
        return applicantAccts;
    }
    function getHelipadDetails(address app) public view returns(string memory,string memory,string memory,string memory,string memory,string memory,string memory){
        return(formFiller[app].location_iaf,formFiller[app].latitude,formFiller[app].longitude,formFiller[app].district,formFiller[app].state,formFiller[app].category,formFiller[app].type_aircraft);
    }
    function airfieldMedical(OperationAirfield _OperationAirfield,MedicalFacilities _MedicalFacilities) public returns(OperationAirfield,MedicalFacilities){
        myAircraft.operationairfield=_OperationAirfield;
        myAircraft.medicalfacilities=_MedicalFacilities;
    }
    function getairfieldMedical() public view returns(OperationAirfield,MedicalFacilities){
        return(myAircraft.operationairfield,myAircraft.medicalfacilities);
    }
    
    
    
    
    
    
}
