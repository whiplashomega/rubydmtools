var currentchar;

function fillform(creature) {
  $("#charform").removeClass("hidden");
  for(var trait in creature) {
    $("#" + trait).val(creature[trait]);
    currentchar = creature;
  }
  $("#charid").val(creature["id"]);
  $.ajax({type: "GET", url: "/attack", data: {character_id: creature["id"]}, success: function(attacks) {
    $("#attacksdiv .attackrow").remove();
    for(var x = 0; x < attacks.length; x++) {
      var newrow = createRow(attacks[x]);
      newrow.find(".attack").val(attacks[x].name);
      newrow.find(".bonus").val(attacks[x].bonus);
      newrow.find(".damage").val(attacks[x].damage);
      onerow = true;
    }
  }});
  /**/
}


function loadlist() {
  $.get("/character", {}, function(characters) {
      var select = $("#charselect");
      select.children().remove();
      for (var x = 0; x < characters.length; x++) {
        var option = $("<option></option>").val(characters[x].id).html(characters[x].name);
        option.appendTo(select);
      }
      var newchar = $("<option></option>").val("new").html("New Character");
      newchar.appendTo(select);
    });
};

function loadchar() {
  var selected = $("#charselect").find(":selected").val();
  if (selected == "new") {
    $.post("/character", function(creature) {
        fillform(creature);
        loadlist();
      });
  } else if(selected == "undefined") {
  } else {
    var correctpath = "/character/" + $("#charselect").find(":selected").val();
    $.get(correctpath, function(creature) {
      fillform(creature);
    });
  }
}

function savechar() {
  var charid = $("#charid").val();
  if (charid === "NOCHARLOADED") {
    alert("you must create a new character or load an existing character before you can save.");
  } else {
    var newchar = {};
    for(var trait in currentchar) {
      newchar[trait] = $("#" + trait).val();
      console.log(newchar.trait);
    }
    newchar.id = $("#charid").val();
    attacks = [];
    $(".attackrow").each(function() {
      row = $(this);
      attacks.push({
          "character_id": newchar.id,
          "id": row.find(".id").val(),
          "name": row.find(".attack").val(),
          "bonus": row.find(".bonus").val(),
          "damage": row.find(".damage").val()
        });   
    });
    
    var correctpath = "/character/" + newchar.id;
    $.ajax({ url: correctpath, contentType: 'application/json', type: 'PUT', data: JSON.stringify(newchar),         success: function() {
      
        for(var attack in attacks) {
          $.ajax({url: "/attack/" + attacks[attack].id, contentType: "application/json",                 type: "PUT", data: JSON.stringify({attack: attacks[attack] }), success: function() {
            console.log("attack successfully updated");
          }});
        }
      $("#charform").addClass("hidden");        
      loadlist();
    }});
  }
}

function deletechar() {
  var charid = $("#charselect").find(":selected").val();
  if (charid !== "new" && charid !== "") {
    var correctpath = "/character/" + charid;
    $.ajax({ url: correctpath, contentType: 'application/json', type: 'DELETE',  success: function() {
        loadlist();
      }});
  }
}
function createRow(data) {
      var newrow = $("<div class='row attackrow'><input type='hidden' class='id' value='" + data.id + "' /><div class='col-md-4'><label>Attack: <input type='text' class='form-control attack' /></label>" +
          "</div><div class='col-md-2'><label for='attackbonus1'>Bonus: <input type='number' class='form-control bonus' /></label>" +
          "</div><div class='col-md-3'><label for='attackdamage1'>Damage: <input type='text' class='form-control damage' /></label></div></div>");
    $("#attacksdiv").append(newrow); 
  return newrow;
}
function addAttack() {
  $.ajax({url: 'attack', data: JSON.stringify({character_id: $("#charid").val()}), type: "POST", contentType: 'application/json', success: function(data) {
   createRow(data);
  }});
}

function deleteAttack(btn) {
  $(btn).parent().remove();
}

//implement our callbacks, then load the list
$(document).ready(function() {
  $("#loadchar").click(function() {
    loadchar();
  });
  $("#savechar").click(function() {
    savechar();  
  });
  $("#deletechar").on("click", function() {
    deletechar();  
  });

  $("#addattack").click(function() {
    addAttack();
  });

  loadlist();
});
