# Decentralized-College-President-Election
Our project is a decentralized college president election platform built using Solidity, HTML, CSS, and JavaScript.

By leveraging the power of blockchain technology and the Ethereum network,
we have created a transparent and secure system for conducting college president elections.


### Getting Started
To run the Decentralized College President Election locally on your machine,
follow these steps:

1. Clone the repository : 
 
 		git clone https://github.com/sandeshchh30/Decentralized-College-President-Election.git
2. Navigate to the project directory :
		
		cd Decentralized-College-President-Election
3. Install Dependencies : 

		npm install
4. Configure Truffle :
  
		truffle init
5. Paste the Voting.sol file under contracts folder
6. Under migration folder make a new file named 1_vote_migration.js and write : 

		const myContract = artifacts.require("Vote");

		module.exports = function (deployer){
			deployer.deploy(myContract);
		}
7. Paste your metamask MNEMONIC in .env file
8. Configure the truffle-config.js file (Ex. Deploying in matic network)

		require('dotenv').config();
		const HDWalletProvider = require('@truffle/hdwallet-provider');
		const MNEMONIC = process.env.MNEMONIC;
		
		module.exports = {
			networks: {
				matic: {
      				provider: () => new HDWalletProvider(MNEMONIC, `https://rpc-mumbai.maticvigil.com`),
     				network_id: 80001,       // network id
      				confirmations: 2,    // # of confirmations to wait between deployments. (default: 0)
      				timeoutBlocks: 200,  // # of blocks before a deployment times out  (minimum/default: 50)
      				skipDryRun: true     // Skip dry run before migrations? (default: false for public nets )
   			 	},
			}
			
		}
9. Then, Depoly the Contract using

		truffle migrate --network matic
10. Lastly Under build/contracts/Vote.json Copy the abi and Contract address and Paste it in index.js and admin.js
11. Now you are Good to go and Vote


* Note: Make sure you have MetaMask installed in your browser and switch to the appropriate Ethereum network (e.g., mumbai) 
to interact with the smart contract.


### Acknowledgements
* This project is for educational purposes only.
