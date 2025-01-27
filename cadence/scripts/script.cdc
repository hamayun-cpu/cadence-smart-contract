import ExampleNFT from 0xf8d6e0586b0a20c7

// Print the NFTs owned by account 0x02.
pub fun main(): [UInt64] {
    // Get the public account object for account 0x02
    let nftOwner = getAccount(0xf8d6e0586b0a20c7)

    // Find the public Receiver capability for their Collection
    let capability = nftOwner.getCapability<&{ExampleNFT.NFTReceiver}>(/public/NFTReceiver)

    // borrow a reference from the capability
    let receiverRef = capability.borrow()
        ?? panic("Could not borrow the receiver reference")

    // Log the NFTs that they own as an array of IDs
    log("Account 2 NFTs")
    return receiverRef.getIDs()
}
 