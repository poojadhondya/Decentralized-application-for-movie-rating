pragma solidity ^0.5.1;
contract MovieRating {
    uint maxMovies = 0;
    string[] allMovies;
    mapping(string=>uint) rater;
    event ratingRegister(string name, uint rating);
    constructor(string memory defaultMovieName) public {
        rater[defaultMovieName] = 0;
        allMovies.push(defaultMovieName);
        maxMovies++;
    }
    // Adding new movies 
    function inputMovie(string memory MovieName) public {
        rater[MovieName] = 0;
        allMovies.push(MovieName);
        maxMovies++;
    }
    function rateMovies(string memory MovieName) public {
        // ????? add conditions to check if Movie exists
        uint currentRating = rater[MovieName];
        rater[MovieName] = currentRating + 1;
        emit ratingRegister(MovieName,currentRating +1);
    }
    // Get the rating of the Movie
    function getMovieRating(string memory MovieName) public view returns (uint) {
        // ????? add conditions to check if Movie exists
        uint currentRating = rater[MovieName];
        return  currentRating;
    }
    function getMaxMovieCount() public view returns (uint) {
        return maxMovies;
    }
    function getAllMovies(uint MovieCount) public view returns(string memory) {
        return allMovies[MovieCount];
    }
}
