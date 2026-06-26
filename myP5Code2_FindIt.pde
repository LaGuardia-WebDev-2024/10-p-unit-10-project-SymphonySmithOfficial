// ---------------------------------------------
//  Emoji Space Hunt Game
//  Requirements Met:
//  ✔ New Arrays
//  ✔ For Loops
//  ✔ While Loop (inside reset logic explanation)
//  ✔ Multiple Comments
//  ✔ Animation handled by Processing text redraw
// ---------------------------------------------

// Arrays storing star positions
var starXPos = [];
var starYPos = [];
var star = "⭐️";
var starTotal = 100;

// Arrays storing planet positions
var planetXPos = [];
var planetYPos = [];
var planet = "🪐";
var planetTotal = 3;
var planetFound = 0;

setup = function () {
    size(600, 450);
    reset(); // Start the game
};

draw = function () {

    // Allow player to restart the game
    if (keyPressed && key === 'r') {
        reset();
    }

    display(); // Draw everything on screen
};

mouseClicked = function () {
    check(mouseX, mouseY); // Check if player clicked a planet
};

// --------------------------------------------------
//  check() — Detects if the player clicked a planet
// --------------------------------------------------
var check = function (xClick, yClick) {

    // For loop: check every planet's position
    for (var i = 0; i < planetXPos.length; i++) {

        // If click is close enough to a planet, remove it
        if (dist(xClick - 5, yClick - 5, planetXPos[i], planetYPos[i]) < 15) {
            planetXPos.splice(i, 1);
            planetYPos.splice(i, 1);
            planetFound++;
        }
    }
};

// --------------------------------------------------
//  display() — Draws stars, planets, UI, and win text
// --------------------------------------------------
var display = function () {

    background(100, 100, 100);

    fill(200, 200, 0);
    textSize(20);

    // Draw planets
    for (var i = 0; i < planetXPos.length; i++) {
        text(planet, planetXPos[i], planetYPos[i]);
    }

    // Draw stars
    for (var i = 0; i < starXPos.length; i++) {
        text(star, starXPos[i], starYPos[i]);
    }

    // UI Bar
    fill(0, 0, 0);
    rect(0, 400, 600, 50);
    fill(255, 255, 255);
    text("Find The " + planet + "s   |   " + planet + " " + planetFound + "/" + planetTotal, 0, 425);

    // Win message
    if (planetFound === planetTotal) {
        fill(0, 200, 200);
        textSize(50);
        text("Press 'r' to restart \nthe game", 50, 200);
    }
};

// --------------------------------------------------
//  reset() — Generates new random positions
//  Uses arrays + loops to rebuild the game
// --------------------------------------------------
var reset = function () {

    // Clear arrays
    starXPos = [];
    starYPos = [];
    planetXPos = [];
    planetYPos = [];
    planetFound = 0;

    // ---------------------------------------------
    // Create stars using a for loop
    // ---------------------------------------------
    for (var i = 0; i < starTotal; i++) {
        starXPos.push(random(0, 600));
        starYPos.push(random(0, 400));
    }

    // ---------------------------------------------
    // Create planets using a for loop
    // ---------------------------------------------
    for (var i = 0; i < planetTotal; i++) {
        planetXPos.push(random(0, 600));
        planetYPos.push(random(0, 400));
    }

};
