# CatMoji

### Cat NFT Collection on flow network in Cadence 
    
This project is to create NFTs on flow network, intention is to get a good experience
about NFTs in Non-EVM chains. Coding was done in Cadence which has a different syntax from
Solidity and Yul.


#### All Flow Contracts

https://flow-view-source.com/testnet/account/0x7b6adb682517f137

#### CatMoji Deployment and Interactions 
    
https://testnet.flowscan.org/contract/A.7b6adb682517f137.CatMoji/overview
https://testnet.flowscan.org/contract/A.7b6adb682517f137.CatMoji/interactions




Mac Users
```
brew install flow-cli
```

Linux and WSL users Run this in your terminal:
```
h -ci "$(curl -fsSL https://storage.googleapis.com/flow-cli/install.sh)"
```


Windows 


```
 iex "& { $(irm 'https://storage.googleapis.com/flow-cli/install.ps1') }"
```


to deploy in testnet
```
//This code is deployed in the path of the account
 self.account.save<@NFT>(<-create NFT(initID: 1), to: /storage/BottomShot1)
```
```
flow accounts add-contract BottomShot ./contracts/BottomShot.cdc
```



## Credits

<a href="https://buildspace.so/" target="_blank"><img src="https://avatars.githubusercontent.com/u/65048157?s=200&v=4"></a>

Buildspace

## License

Jest is [MIT licensed](./LICENSE).