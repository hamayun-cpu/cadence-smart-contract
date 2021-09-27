import ExampleToken from 0xf8d6e0586b0a20c7
pub fun main():UFix64 {
    // Get the accounts' public account objects
    let acct1 = getAccount(0xf8d6e0586b0a20c7)

    // Get references to the account's receivers
    // by getting their public capability
    // and borrowing a reference from the capability
    let acct1ReceiverRef = acct1.getCapability<&ExampleToken.Vault{ExampleToken.Balance}>(/public/MainReceiver)
        .borrow()
        ?? panic("Could not borrow a reference to the acct1 receiver")

   

    // Read and log balance fields
    log("Account 1 Balance")
    return(acct1ReceiverRef.balance)

}