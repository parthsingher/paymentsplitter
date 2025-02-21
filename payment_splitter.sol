pragma solidity ^0.8.0;

contract PaymentSplitter {
    address payable[3] recipients = [
        payable(0x1234567890123456789012345678901234567890),
        payable(0x0987654321098765432109876543210987654321),
        payable(0xABcdEFABcdEFabcdEfAbCdefabcdeFABcDEFabCD)
    ];
    
    function deposit() external payable {
        uint256 share = msg.value / recipients.length;
        for (uint256 i = 0; i < recipients.length; i++) {
            recipients[i].transfer(share);
        }
    }
}
