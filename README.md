Crowdfunding Platform for Education
Vision
The Crowdfunding Platform for Education aims to make education more accessible by providing a decentralized and transparent way for students to raise funds for their education fees. By leveraging blockchain technology,
the platform ensures trust, security, and traceability in campaigns. Students can create campaigns, donors can contribute, and everyone can track the progress transparently without the need for intermediaries.

Features
Campaign Creation: Students can create fundraising campaigns by setting their financial goals. Each campaign is tied to a unique creator and has a tracking mechanism for the collected balance.

Donation System: Donors can contribute to active campaigns with the desired amount, helping students reach their financial goals.

Fund Withdrawal: Once the campaign reaches its financial goal, the student can withdraw the funds, ensuring that contributions are only accessible upon reaching the target.

Messaging System: Donors and supporters can send messages to the campaign creators. This helps build a community around the campaign and keeps communication transparent.

Campaign Status: Each campaign has an active status and can be closed automatically when the goal is met and funds are withdrawn.

Smart Contract Overview
The platform is built using the Aptos blockchain smart contract system. The contract manages campaign creation, donations, fund transfers, and messaging functionality.

Modules & Functions
Campaign Creation:

create_campaign(creator: &signer, goal: u64): address:
Allows a student (creator) to start a campaign by specifying a financial goal. The campaign will be created under their address.
Donation System:

donate(campaign_address: address, amount: u64) acquires Campaign:
Enables donors to contribute to an active campaign. The contribution amount is added to the campaign’s balance.
Withdraw Funds:

withdraw<CoinType>(campaign_address: address, creator: &signer) acquires Campaign:
Allows the campaign creator to withdraw funds when the campaign goal is met. The campaign will be marked as inactive after funds are withdrawn.
Send Message:

send_message(campaign_address: address, sender: &signer, content: vector<u8>) acquires Campaign:
Allows anyone to send a message to the campaign creator. Messages are stored within the campaign for transparency and communication.
Contract Information
Campaign Structure:

creator: The address of the student who created the campaign.
goal: The target amount the campaign aims to raise.
balance: The current amount collected.
is_active: Boolean indicating whether the campaign is still open for donations.
messages: A vector of messages sent by donors or supporters.
Message Structure:

sender: The address of the sender.
content: The message content sent to the campaign.
The contract ensures transparency and security, leveraging the decentralized nature of blockchain for seamless and trusted crowdfunding for education.

This project aims to democratize access to education by empowering students to leverage global support through a decentralized crowdfunding model.
