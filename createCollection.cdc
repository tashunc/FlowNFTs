import BottomShot from 0xf8d6e0586b0a20c7

transaction {

  prepare(acct: AuthAccount) {
    acct.save(<- BottomShot.createCollection(), to: /storage/BottomShot)
  }

  execute {
    log("Stored a collection for our NUTTY empty NFTs")
  }
}