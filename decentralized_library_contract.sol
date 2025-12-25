pragma solidity >=0.5.0 <0.6.0;

contract liberarysystem {

    struct book {
        string title;
        uint Id;
    }

    book[] public books;

    mapping(uint => address) IdtoOwner;
    mapping(address => uint) count;

    event BookCreated(string title, uint Id, address owner);

    function createnewbook(string memory _title, uint _id) public {
        require(count[msg.sender] == 0);
        require(_id > 0);
        require(IdtoOwner[_id] == address(0));

        books.push(book(_title, _id));
        IdtoOwner[_id] = msg.sender;
        count[msg.sender]++;

        emit BookCreated(_title, _id, msg.sender);
    }

    function getBook(uint _index) public view returns (string memory, uint) {
        book storage b = books[_index];
        return (b.title, b.Id);
    }

    function ownerOf(uint _id) public view returns (address) {
        return IdtoOwner[_id];
    }
}
