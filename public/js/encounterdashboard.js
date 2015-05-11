function loadchar(location) {
  var correctpath = "/character/" + $("#charselect").find(":selected").val();
  $.get(correctpath, function(data) {
      if (location !== "initiative") {
        buildchar(data, location);
      } else {
        addinit(data);
      }     
    });
}

function buildchar(character, location) {
  var chardiv = $("#templates .character").clone();
  //TODO: Add data
  chardiv.find(".acrobatics").text(character.acrobatics);
  chardiv.find(".alignment").text(character.alignment);
  chardiv.find(".animalhandling").text(character.animalhandling);
  chardiv.find(".arcana").text(character.arcana);
  chardiv.find(".athletics").text(character.athletics);

  $.get("/attack", {"character_id": character.id}, function(attacks) {
    for(var x in attacks) {
      var attackrow = $("#templates .attack").clone();
      attackrow.find(".attackname").text(attacks[x].name);
      attackrow.find(".bonus").text(attacks[x].bonus);
      attackrow.find(".damage").text(attacks[x].damage);
      chardiv.find(".attacks").append(attackrow);     
    }
  });
  chardiv.find(".background").text(character.background);
  chardiv.find(".ac").text(character.ac);
  chardiv.find(".speed").text(character.speed);
  chardiv.find(".charisma").text(character.charisma);
  chardiv.find(".charismasave").text(character.charismasave);
  chardiv.find(".classlevel").text(character.classlevel);
  chardiv.find(".constitution").text(character.constitution);
  chardiv.find(".constitutionsave").text(character.constitutionsave);
  chardiv.find(".cr").text(character.cr);
  chardiv.find(".deception").text(character.deception);
  chardiv.find(".dexterity").text(character.dexterity);
  chardiv.find(".dexteritysave").text(character.dexteritysave);
  chardiv.find(".experiencepoints").text(character.experiencepoints);
  chardiv.find(".featurestraits").text(character.featurestraits);
  chardiv.find(".history").text(character.history);
  chardiv.find(".hitdicemax").text(character.hitdicemax);
  chardiv.find(".hpmax").text(character.hpmax);
  chardiv.find(".insight").text(character.insight);
  chardiv.find(".intelligence").text(character.intelligence);
  chardiv.find(".intimidation").text(character.intimidation);
  chardiv.find(".intelligencesave").text(character.intelligencesave);
  chardiv.find(".investigation").text(character.investigation);
  chardiv.find(".medicine").text(character.medicine);
  chardiv.find(".name").text(character.name);
  chardiv.find(".nature").text(character.nature);
  chardiv.find(".passiveperception").text(character.passiveperception);
  chardiv.find(".perception").text(character.perception);
  chardiv.find(".performance").text(character.performance);
  chardiv.find(".persuasion").text(character.persuasion);
  chardiv.find(".equipment").text(character.equipment);
  chardiv.find(".proficiencybonus").text(character.proficiencybonus);
  chardiv.find(".race").text(character.race);
  chardiv.find(".religion").text(character.religion);
  chardiv.find(".slightofhand").text(character.slightofhand);
  chardiv.find(".stealth").text(character.stealth);
  chardiv.find(".strength").text(character.strength);
  chardiv.find(".strengthsave").text(character.strengthsave);
  chardiv.find(".survival").text(character.survival);
  chardiv.find(".wisdom").text(character.wisdom);
  chardiv.find(".wisdomsave").text(character.wisdomsave);
  chardiv.find(".accordion").accordion({
      heightStyle: "content",
      collapsible: true
    });
  //Append
  chardiv.find(".delete").click(function() {
    $(this).parent().remove();
  });
  $("#" + location).append(chardiv);  
}

function addinit(character) {
  addrow();
  var initiative = Math.floor((character.dexterity - 10)/2);
  $("#chartablebody tr:last-child .charname").val(character.name);
  $("#chartablebody tr:last-child .charinit").val(initiative);
}

$(document).ready(function () {
$.get('/character', function(data) {
  for (var character in data) {
    var option = $("<option></option>");    
    option.text(data[character].name);
    option.val(data[character].id);
    $("#charselect").append(option);
  }
});

$("#addparty").click(function(){
  loadchar("party");
  });

$("#addencounter").click(function(){
  loadchar("encounter");
  });

$("#addinitiative").click(function() {
  loadchar("initiative");
});

});
