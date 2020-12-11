const GreatestShow = artifacts.require("./GreatestShow.sol");

module.exports = (deployer, network, accounts) => {
  let deployAddress = accounts[0];
  console.log('Preparacion para el deploy de GreatestShow');

  if ( network == "mainnet" ) {
    throw "Halt. Sanity check. Not ready for deployment to mainnet. Manually remove this throw and try again";
  }

  console.log('deploying from:' + deployAddress);

  deployer.deploy(GreatestShow, "vhpvmx", {from: deployAddress});
};
