async function main() {
    // Grab the contract factory 
    const CheckAddress = await ethers.getContractFactory("CheckAddress");
    const library = await CheckAddress.deploy();

    console.log("Library deployed to address:", library.address);

    const KikiToken = await ethers.getContractFactory("KikiToken", {
      libraries: {
        CheckAddress: library.address,
      },
    });
    const kikiToken = await KikiToken.deploy("https://gateway.pinata.cloud/ipfs/QmeEgFjTpscHYtizAQZoefNJh6fPfayzvnoQAvACThpqej"); // Instance of the contract

    console.log("Contract deployed to address:", kikiToken.address);
 }
 
 main()
   .then(() => process.exit(0))
   .catch(error => {
     console.error(error);
     process.exit(1);
   });

   