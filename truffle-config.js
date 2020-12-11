let secrets = require('./secrets');
const HDWalletProvider = require("@truffle/hdwallet-provider");

let infura_id = secrets.infura_id;
let key = secrets.kovan_key;
let infura_url = "https://kovan.infura.io/v3/" + infura_id;

module.exports = {
  networks: {
    development: {
      host: "localhost",
      port: 7545,
      network_id: "*",
      gas: 4465030
    },

    kovan: {
      provider: () => new HDWalletProvider(key, infura_url),
      network_id: "42",
      gas: 4465030
    },
  },
};
