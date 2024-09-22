module CrowdfundingPlatform::Campaign {
    use aptos_framework::signer;
    use 0x1::coin::{Coin, transfer}; // Import Coin and transfer function
    use aptos_framework::vector; // Import vector module

    struct Campaign has key {
        creator: address,
        goal: u64,
        balance: u64,
        is_active: bool,
        messages: vector<Message>,
    }

    struct Message has copy, drop, store {
        sender: address,
        content: vector<u8>,
    }

    public fun create_campaign(creator: &signer, goal: u64): address {
        let campaign = Campaign {
            creator: signer::address_of(creator),
            goal,
            balance: 0,
            is_active: true,
            messages: vector::empty<Message>(),
        };
        move_to(creator, campaign);
        signer::address_of(creator) // return creator's address instead
    }

    public fun donate(campaign_address: address, amount: u64) acquires Campaign {
        let campaign = borrow_global_mut<Campaign>(campaign_address);
        assert!(campaign.is_active, 1);
        campaign.balance = campaign.balance + amount;
    }

    public fun withdraw<CoinType>(campaign_address: address, creator: &signer) acquires Campaign {
        let campaign = borrow_global_mut<Campaign>(campaign_address);
        assert!(campaign.balance >= campaign.goal, 1);
        transfer<CoinType>(creator, campaign.creator, campaign.balance); // Call transfer with correct parameters
        campaign.balance = 0;
        campaign.is_active = false;
    }

    public fun send_message(campaign_address: address, sender: &signer, content: vector<u8>) acquires Campaign {
        let campaign = borrow_global_mut<Campaign>(campaign_address);
        let message = Message {
            sender: signer::address_of(sender),
            content,
        };
        vector::push_back(&mut campaign.messages, message);
    }
}
