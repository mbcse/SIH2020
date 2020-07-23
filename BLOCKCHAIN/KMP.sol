pragma solidity ^0.5.*;
contract AAI_LICENSING{
    
    address public owner;
/*
***************************************Applicant Details*****************************************
*/    
    struct applicant{
        string name;
        string addresss;
        string telephone_no;
        string nationality;
    }
    
    mapping(address=>uint[]) applicantId;//Mapping address to all apllications aplied
    mapping(uint=>applicant) applicantDetails;
    mapping(uint=>address) applicantETHAddress;
    

/*
***************************************Aerdrome Details*****************************************
*/
    struct aerodromeDetails{
            string  aerodromeName;//Location of the proposed aerodrome/ helipad site with reference to the nearest IAF aerodrome
            string  aerodromeOwner;
            string  latitude; //Latitude and Longitude of the place 
            string  longitude;
            string  district; //State/ District in which proposed location is situated 
            string  state;
            string  category; //public or private
            
    }
    mapping(uint=>aerodromeDetails) applicantAerodrome;//map Id to its aerodomeDetails
    mapping(uint=>string) internal HM_ApprovalDoc;//Home Ministry Approval
    mapping(uint=>string) internal DF_ApprovalDoc;//Defence approval
    mapping(uint=>string) internal OW_ApprovalDoc;//Owner of Land
    mapping(uint=>string) internal aerodromeManual;//Aerodome Manual
    mapping(uint=>uint8)  internal status;//status 0-rejected 1-pending 2-acccepted
    
/*
***************************************Approval Details*****************************************
*/
    
    mapping(address=>uint) internal isAdmin;//0-No Admin Permission & 1-Yes Admin Permission
    mapping(address=>string) internal admins;
    mapping(uint=>bool) internal DGapproval;
    mapping(uint=>bool) internal DOASapproval;
    mapping(uint=>bool)internal AIapproval;
    
    
/*
***************************************License Details*****************************************
*/
    mapping(uint=>string) applicantLicenceIssued;
    mapping(string=>uint) licenseDetails;//mapping id to license number for getting license information later on

/*
***************************************constructor*****************************************
*/
    constructor() public{
        owner=msg.sender;
    }
    
/*
***************************************Modifiers*****************************************
*/    
    
    modifier onlyAdmin(){
        require(isAdmin[msg.sender]==1 || msg.sender==owner);
        _;
    }
    
    modifier onlyAdminApplicant(uint _id){
        require(isAdmin[msg.sender]==1 || msg.sender==owner || msg.sender==applicantETHAddress[_id]);
        _;
    }
/*
***************************************Admin Functions*****************************************
*/    
    
    function grantAdminAccess(address _addresss) public onlyAdmin{
        isAdmin[_addresss]=1;
    }
/*
***************************************Registration Functions*****************************************
*/    function registerApplicant(uint _id, string memory _name, string memory _Haddress, string memory _telephone, string memory _nationality) public{
        applicantId[msg.sender].push(_id);
        applicantETHAddress[_id]=msg.sender;
        applicantDetails[_id]=applicant(_name,_Haddress,_telephone,_nationality);
    }
    
    function registerAerodome(uint _id, string memory _aerodromeName, string memory _aerodromeOwner, string memory _latitude, string memory _longitude, string memory _district,string memory _state, string memory  _category) public{
        applicantAerodrome[_id]=aerodromeDetails(_aerodromeName, _aerodromeOwner, _latitude, _longitude, _district, _state, _category);
    }
    
/*
***************************************Get Application Details Function*****************************************
*/    function getApplicantApplications() public view returns(uint[] memory applications){
        return applicantId[msg.sender];
    }
    
    
    function getapplicantDetails(uint _id) public view returns(uint id, string memory name, string memory Haddress, string memory telephone, string memory nationality){
        return(_id, applicantDetails[_id].name,applicantDetails[_id].addresss, applicantDetails[_id].telephone_no, applicantDetails[_id].nationality);
    }
    
    function getAerodromeDetails(uint _id) public view returns(string memory aerodromeName, string memory aerodromeOwner, string memory latitude, string memory longitude, string memory district,string memory state, string memory  category){
        return(applicantAerodrome[_id].aerodromeName, applicantAerodrome[_id].aerodromeOwner, applicantAerodrome[_id].latitude, applicantAerodrome[_id].longitude, applicantAerodrome[_id].district, applicantAerodrome[_id].state, applicantAerodrome[_id].category);
    }
    
/*
***************************************Approval Functions*****************************************
*/
    function AIapprove(uint _id, string memory _approverName) public onlyAdmin{
        require(keccak256(abi.encodePacked(admins[msg.sender]))==keccak256(abi.encodePacked("AI")));
        AIapproval[_id]=true;
    }
    
    function DOASapprove(uint _id, string memory _approverName) public onlyAdmin{
        require(keccak256(abi.encodePacked(admins[msg.sender]))==keccak256(abi.encodePacked("DOAS")));
        require(AIapproval[_id]==true);
        DOASapproval[_id]=true;
    }
    
    function DGapprove(uint _id, string memory _approverName) public onlyAdmin{
        require(keccak256(abi.encodePacked(admins[msg.sender]))==keccak256(abi.encodePacked("DG")));
        require(AIapproval[_id]==true);
        require(DOASapproval[_id]==true);
        DGapproval[_id]=true;
    }
    
    
    function approvalStatus(uint _id) public onlyAdminApplicant(_id) view returns(bool DG, bool DOAS, bool AI){
        return(DGapproval[_id], DOASapproval[_id], AIapproval[_id]);
    }
    
    
    function grantLicense(uint _id, string memory _license) public onlyAdmin{
        require(DGapproval[_id]==true && DOASapproval[_id]==true && AIapproval[_id]==true);
        applicantLicenceIssued[_id]=_license;
        licenseDetails[_license]=_id;
    }
    
    
    
    
    
    
    
    
    

    
    
    
    
    
    
    

    
    
    
        
        
   
    
 
    
    
    
    
    
}