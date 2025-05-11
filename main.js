//sidepanel color changing thingy
$(document).ready(function () {
  let selectedItem = localStorage.getItem("selectedItem");
  if (selectedItem) {
    $(".sidepanelitem").css({
      "color": "white",
      "font-weight": "normal"
    }); // reset all items
    
    $(`[href='${selectedItem}']`).css({
      "color": "black",
      "font-weight": "bold"
    }); // highlight selected item with black color and bold font
  }

  $(".sidepanelitem").on("click", function () {
    $(".sidepanelitem").css({
      "color": "white",
      "font-weight": "normal"
    }); // reset all items
    
    $(this).css({
      "color": "black",
      "font-weight": "bold"
    }); // change clicked item to black and bold

    localStorage.setItem("selectedItem", $(this).attr("href"));
  });
});


// popup for side bar
function showPopup(popupId) { //gets the id of the popup
  const popup = document.getElementById(popupId);
  if (popup) {
    popup.style.display = 'block';
  }
}

function closePopup(popupId) {
  const popup = document.getElementById(popupId);
  if (popup) {
    popup.style.display = 'none';
  }
}

//user management popup validation
function validateAndRedirect() {
  let reasonInput = document.getElementById("reason").value.trim();

  if (reasonInput === "") { // checking if input is empty
    alert("Please enter a reason before proceeding.");
  } else { //change to the location of the php that deletes acc
    window.location.href = '../del-acc.php';
  }
}

//Collapsible
document.addEventListener("DOMContentLoaded", function () {
  var coll = document.querySelectorAll(".collapsible"); //the collapsible itself
  var reset = document.querySelectorAll(".reset"); //that stupid reset button
  var leaderboardContents = document.querySelectorAll(".leaderboardcontent"); //collapsible content

  coll.forEach((button, index) => { //depending on which collapsible you clicked
    button.addEventListener("click", function (event) {
      this.classList.toggle("active");
      leaderboardContents[index].classList.toggle("open"); //open to let it trigger the overflow-y
      
      if (leaderboardContents[index].style.maxHeight) {
        leaderboardContents[index].style.maxHeight = null;
        reset[index].style.display = "none";
      } else {
        // Calculate the proper height based on content
        leaderboardContents[index].style.maxHeight = "400px"; //max height set
        reset[index].style.display = "block"; //showing that reset button
      }
    });
  });
});
