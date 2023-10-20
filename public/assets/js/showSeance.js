/*function ShowDivSeance()
{
    // Get the current display property of the div element
    let statusDivShow = window.getComputedStyle(document.getElementById('clSeancesInput')).display;
    let contentBtnSeance = document.querySelector('#clbtnShowDivSeance').textContent;
    console.log(contentBtnSeance);

    // Check the value of statusDivShow
    if (statusDivShow === "none") {
        // If statusDivShow is equal to "none", show the div element
        statusDivShow = "flex";
        contentBtnSeance.replaceAll("voir");
    } else {
        // Otherwise, hide the div element
        statusDivShow = "none";
        contentBtnSeance.innerHTML = "Masquer";
    }

    // Set the display property of the div element
    document.getElementById('clSeancesInput').style.display = statusDivShow;
}*/
function ShowDivSeance() {
    // Get the current display property of the div element
    let statusDivShow = window.getComputedStyle(document.getElementById('clSeancesInput')).display;
    let contentBtnSeance = document.querySelector('#clbtnShowDivSeance');

    // Check the value of statusDivShow
    if (statusDivShow === "none") {
        // If statusDivShow is equal to "none", show the div element
        statusDivShow = "flex";
        contentBtnSeance.textContent = "Masquer";
    } else {
        // Otherwise, hide the div element
        statusDivShow = "none";
        contentBtnSeance.textContent = "Réserver";
    }

    // Set the display property of the div element
    document.getElementById('clSeancesInput').style.display = statusDivShow;
}
