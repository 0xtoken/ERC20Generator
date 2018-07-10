require('dotenv').config();
const HDWalletProvider = require("truffle-hdwallet-provider");
const mnemonic = process.env.MNEMONIC;
const infuraAccessToken = process.env.INFURA_ACCESS_TOKEN;

module.exports = {
    // See <http://truffleframework.com/docs/advanced/configuration>
    // to customize your Truffle configuration!
    networks: {
        development: {
            host: 'localhost',
            port: 9545,
            network_id: 5777
        },
        ropsten: {
            provider: function () {
                return new HDWalletProvider(
                    mnemonic,
                    'https://ropsten.infura.io/' + infuraAccessToken
                );
            },
            network_id: 3,
            gas: 2000000,
            gasPrice: 20000000000	// 20 Gwei
        },
        mainnet: {
            provider: function () {
                return new HDWalletProvider(
                    mnemonic,
                    'https://mainnet.infura.io/' + infuraAccessToken
                );
            },
            network_id: 1,
            gas: 2000000,
            gasPrice: 20000000000 // 20 Gwei
        }
    }
};
