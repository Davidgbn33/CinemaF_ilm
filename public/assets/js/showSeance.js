function ShowDivSeance()
{
    // Get the current display property of the div element
    let statusDivShow = window.getComputedStyle(document.getElementById('clSeancesInput')).display;

    // Check the value of statusDivShow
    if (statusDivShow === "none") {
        // If statusDivShow is equal to "none", show the div element
        statusDivShow = "flex";
    } else {
        // Otherwise, hide the div element
        statusDivShow = "none";
    }

    // Set the display property of the div element
    document.getElementById('clSeancesInput').style.display = statusDivShow;
}

