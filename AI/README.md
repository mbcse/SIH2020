# SIH2020
## Pre-requisite libraries
### Setting up for Textract Service

1) Installing the AWS CLI <br />
	* Download the AWS CLI MSI installer for Windows (64-bit) present in the Installers folder. <br />
	* Run the downloaded MSI installer and follow the on-screen instructions. By default, the AWS CLI installs to C:\Program Files\Amazon\AWSCLIV2 <br />
	* To confirm the installation, open the Start menu, search for cmd to open a command prompt window, and at the command prompt use the aws --version command. <br />

2) Configuring the AWS CLI
	* In the command line type- $aws configure <br />
	* AWS Access Key ID [None]: In whatsapp group description <br />
	  AWS Secret Access Key [None]: In whatsapp group description <br />
	  Default region name [None]: us-west-1 <br />
	  Default output format [None]: json <br />

3) $pip install boto3


### Setting up for pdf2image library. It is used to convert pdf file to images. <br />

1) Extract the poppler folder present in the installer folder onto your local system.<br />
2) Add the bin\ folder in your path . https://www.architectryan.com/2018/03/17/add-to-the-path-on-windows-10/ <br />
3) $pip install pdf2image </br>

### Other Libararies 
Run pip install -r requirement.txt to all the other libraries.<br />
Other libraries include: <br />

* webbrowser <br />
* jsonlib <br />
* io <br />
* sys <br />
* pprint <br />
* os <br />
* csv <br />
* shutil <br />

**Note:**
* *Textract services won't work if aws cli is not configured properly* <br />
* *pdf2print library won't work if poppler's bin\ folder is not added in the path* <br />
