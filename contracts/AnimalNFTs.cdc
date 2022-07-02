import NonFungibleToken from 0x631e88ae7f1d7c20;
import MetadataViews from 0x631e88ae7f1d7c20;

pub contract AnimalNFT: NonFungibleToken {
    pub var totalSupply: UInt64

    pub event ContractInitialized()
    pub event Withdraw(id:UInt64, address: Address?)
    pub event Deposit(id: UInt64, address: Address?)

    public let CollectionStoragePath: StoragePath
    public let CollectionPublicStoragePath: PublicPath

    pub resource NFT: NonFungibleToken.INFT, MetadataViews.Resolver {
        pub let id: UInt64
        pub let name: String
        pub let description: String
        pub let thumbnail: String

        init(  id: UInt64, name: String, description: String, thumbnail: String) {
                self.id = id
                self.name = name
                self.description = description
                self.thumbnail = thumbnail
        }

        pub fun getViews(): [Type] {
            return [Type<MetadataViews.Display>()]
        }

        pub fun resolveView(_ view:Type): AnyStruct {
        switch view {
                case Type<MetadataViews.Display>():
                  return MetadataViews.Display(
                    name: self.name,
                    description: self.description,
                    thumbnail: MetadataViews.HTTPFile(
                      url: self.thumbnail
                    )
                  )
              }
              return nil
            }
        }
    }

     pub resource interface AnimalMojiCollectionPublic {
                pub fun deposit(token: @NonFungibleToken.NFT)
                pub fun getIDs(): [UInt64]
                pub fun borrowNFT(id: UInt64): &NonFungibleToken.NFT
    }


    pub resource Collection: AnimalMojiCollectionPublic, NonFungibleToken.Provider, NonFungibleToken.Receiver, NonFungibleToken.CollectionPublic, MetadataViews.ResolverCollection {
        pub var ownedNFTs: @{UInt64: NonFungibleToken.NFT}

        init () {
          self.ownedNFTs <- {}
        }

        pub fun getIDs(): [UInt64] {
          return self.ownedNFTs.keys
        }

        pub fun withdraw(withdrawID: UInt64): NonFungibleToken.NFT {
        let token <- self.ownerNFTs.remove(key: withdrawID) ?? panic("The requested NFT is missing")

        emit Withdraw(id: withdrawID, from: self.owner?.address)

        return <-token

        }
        // destorys the old token and create a new one
        pub fun deposit(token: @NonFungibleToken.NFT) {
        let token <- token as! @AnimalNFTs.NFT
        token ?? panic("Token is not Valid")

        let id = token.id

        let oldToken <- self.ownedNFTs[id] <- token

        emit Deposit(id: id, address: self.owner?.address)

        destroy oldToken

        }

       pub fun borrowNFT(id: UInt64): &NonFungibleToken.NFT {
            return (&self.ownedNFTs[id] as &NonFungibleToken.NFT?)
       }

    }







}