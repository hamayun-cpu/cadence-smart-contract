import HelloWorld from  0xf8d6e0586b0a20c7
transaction() {
  let guest: Address

  prepare(authorizer: AuthAccount) {
    self.guest = authorizer.address
  }

  execute {
    log(HelloWorld.hello())
  }
}
 