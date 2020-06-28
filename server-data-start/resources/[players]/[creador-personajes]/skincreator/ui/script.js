$(document).ready(function(){
  // Listen for NUI Events
  window.addEventListener('message', function(event){
    // Open Skin Creator
    if(event.data.openSkinCreator == true){
      $(".skinCreator").css("display","block");
	  $(".rotation").css("display","flex");
    }
    // Close Skin Creator
    if(event.data.openSkinCreator == false){
      $(".skinCreator").fadeOut(400);
	  $(".rotation").css("display","none");
    }

    // Menu TIO
    if(event.data.openMale == true){
      $(".barba").css("display","block");
      $(".vetements").css("display","block");
	  $('.vetements').addClass('active');
    }

    if(event.data.openMale == false){
      $(".barba").css("display","none");
      $(".vetements").css("display","none");
	  $('.vetements').removeClass('active');
    }

    // Menu TIA

    if(event.data.openFemale == true){
      $(".vetements2").css("display","block");
	  $('.vetements2').addClass('active');
      $(".colorete").css("display","block");
      $(".pintalabios").css("display","block");
      $(".sombras").css("display","block");
    }

    if(event.data.openFemale == false){
      $(".vetements2").css("display","none");
	  $('.vetements2').removeClass('active');
      $(".colorete").css("display","none");
      $(".pintalabios").css("display","none");
      $(".sombras").css("display","none");
    }
	});
  // Form update
  $('input').bind("input",function(){
    $.post('http://skincreator/updateSkin', JSON.stringify({
      value: false,
      // Face
      dad: $('input[name=pere]:checked', '#formSkinCreator').val(),
      mum: $('input[name=mere]:checked', '#formSkinCreator').val(),
      sex: $('.sex').val(),
      dadmumpercent: $('.morphologie').val(),
      skin: $('input[name=peaucolor]:checked', '#formSkinCreator').val(),
      eyecolor: $('input[name=eyecolor]:checked','#formSkinCreator').val(),
      skinproblem: $('.pbpeau').val(),
      skinproblemopacity: $('.pbpeauopacity').val(),
      freckle: $('.tachesrousseur').val(),
      freckleopacity: $('.tachesrousseuropacity').val(),
      wrinkle: $('.rides').val(),
      wrinkleopacity: $('.rides').val(),
      hair: $('.hair').val(),
      haircolor: $('input[name=haircolor]:checked', '#formSkinCreator').val(),
      haircolor2: $('input[name=haircolor2]:checked', '#formSkinCreator').val(),
      eyebrow: $('.sourcils').val(),
      eyebrowopacity: $('.epaisseursourcils').val(),
      beard: $('.barbe').val(),
      beardopacity: $('.epaisseurbarbe').val(),
      beardcolor: $('input[name=barbecolor]:checked', '#formSkinCreator').val(),
      makeuptype: $('.makeuptype').val(),
      makeupintensidad: $('.makeupintensidad').val(),
      makeupcolor1: $('input[name=makeupcolor1]:checked', '#formSkinCreator').val(),
      makeupcolor2: $('input[name=makeupcolor2]:checked', '#formSkinCreator').val(),
      lipsticktype: $('.lipsticktype').val(),
      lipstickintensidad: $('.lipstickintensidad').val(),
      lipstickcolor1: $('input[name=lipstickcolor1]:checked', '#formSkinCreator').val(),
      blushtype: $('.blushtype').val(),
      blushintensidad: $('.blushintensidad').val(),
      blushcolor: $('input[name=blushcolor]:checked', '#formSkinCreator').val(),

      // Clothes
      hats: $('.chapeaux .active').attr('data'),
      glasses: $('.lunettes .active').attr('data'),
      ears: $('.oreilles .active').attr('data'),
      tops: $('.hauts .active').attr('data'),
      pants: $('.pantalons .active').attr('data'),
      shoes: $('.chaussures .active').attr('data'),
      watches: $('.montre .active').attr('data'),
      //  Ropa de tia
      hats2: $('.chapeaux2 .active').attr('data'),
      glasses2: $('.lunettes2 .active').attr('data'),
      ears2: $('.oreilles2 .active').attr('data'),
      tops2: $('.hauts2 .active').attr('data'),
      pants2: $('.pantalons2 .active').attr('data'),
      shoes2: $('.chaussures2 .active').attr('data'),
      watches2: $('.montre2 .active').attr('data'),
    }));
  });
  $('.arrow').on('click', function(e){
    e.preventDefault();
    $.post('http://skincreator/updateSkin', JSON.stringify({
      value: false,
      // Face
      dad: $('input[name=pere]:checked', '#formSkinCreator').val(),
      mum: $('input[name=mere]:checked', '#formSkinCreator').val(),
      sex: $('.sex').val(),
      dadmumpercent: $('.morphologie').val(),
      skin: $('input[name=peaucolor]:checked', '#formSkinCreator').val(),
      eyecolor: $('input[name=eyecolor]:checked','#formSkinCreator').val(),
      skinproblem: $('.pbpeau').val(),
      skinproblemopacity: $('.pbpeauopacity').val(),
      freckle: $('.tachesrousseur').val(),
      freckleopacity: $('.tachesrousseuropacity').val(),
      wrinkle: $('.rides').val(),
      wrinkleopacity: $('.rides').val(),
      hair: $('.hair').val(),
      haircolor: $('input[name=haircolor]:checked', '#formSkinCreator').val(),
      haircolor2: $('input[name=haircolor2]:checked', '#formSkinCreator').val(),
      eyebrow: $('.sourcils').val(),
      eyebrowopacity: $('.epaisseursourcils').val(),
      beard: $('.barbe').val(),
      beardopacity: $('.epaisseurbarbe').val(),
      beardcolor: $('input[name=barbecolor]:checked', '#formSkinCreator').val(),
      makeuptype: $('.makeuptype').val(),
      makeupintensidad: $('.makeupintensidad').val(),
      makeupcolor1: $('input[name=makeupcolor1]:checked', '#formSkinCreator').val(),
      makeupcolor2: $('input[name=makeupcolor2]:checked', '#formSkinCreator').val(),
      lipsticktype: $('.lipsticktype').val(),
      lipstickintensidad: $('.lipstickintensidad').val(),
      lipstickcolor1: $('input[name=lipstickcolor1]:checked', '#formSkinCreator').val(),
      blushtype: $('.blushtype').val(),
      blushintensidad: $('.blushintensidad').val(),
      blushcolor: $('input[name=blushcolor]:checked', '#formSkinCreator').val(),
      // Clothes
      hats: $('.chapeaux .active').attr('data'),
      glasses: $('.lunettes .active').attr('data'),
      ears: $('.oreilles .active').attr('data'),
      tops: $('.hauts .active').attr('data'),
      pants: $('.pantalons .active').attr('data'),
      shoes: $('.chaussures .active').attr('data'),
      watches: $('.montre .active').attr('data'),
      //  Ropa de tia
      hats2: $('.chapeaux2 .active').attr('data'),
      glasses2: $('.lunettes2 .active').attr('data'),
      ears2: $('.oreilles2 .active').attr('data'),
      tops2: $('.hauts2 .active').attr('data'),
      pants2: $('.pantalons2 .active').attr('data'),
      shoes2: $('.chaussures2 .active').attr('data'),
      watches2: $('.montre2 .active').attr('data'),
    }));
  });

  // Form submited
  $('.yes').on('click', function(e){
    e.preventDefault();
    $.post('http://skincreator/updateSkin', JSON.stringify({
      value: true,
      // Face
      dad: $('input[name=pere]:checked', '#formSkinCreator').val(),
      mum: $('input[name=mere]:checked', '#formSkinCreator').val(),
      sex: $('.sex').val(),
      dadmumpercent: $('.morphologie').val(),
      skin: $('input[name=peaucolor]:checked', '#formSkinCreator').val(),
      eyecolor: $('input[name=eyecolor]:checked','#formSkinCreator').val(),
      skinproblem: $('.pbpeau').val(),
      skinproblemopacity: $('.pbpeauopacity').val(),
      freckle: $('.tachesrousseur').val(),
      freckleopacity: $('.tachesrousseuropacity').val(),
      wrinkle: $('.rides').val(),
      wrinkleopacity: $('.rides').val(),
      hair: $('.hair').val(),
      haircolor: $('input[name=haircolor]:checked', '#formSkinCreator').val(),
      haircolor2: $('input[name=haircolor2]:checked', '#formSkinCreator').val(),
      eyebrow: $('.sourcils').val(),
      eyebrowopacity: $('.epaisseursourcils').val(),
      beard: $('.barbe').val(),
      beardopacity: $('.epaisseurbarbe').val(),
      beardcolor: $('input[name=barbecolor]:checked', '#formSkinCreator').val(),
      makeuptype: $('.makeuptype').val(),
      makeupintensidad: $('.makeupintensidad').val(),
      makeupcolor1: $('input[name=makeupcolor1]:checked', '#formSkinCreator').val(),
      makeupcolor2: $('input[name=makeupcolor2]:checked', '#formSkinCreator').val(),
      lipsticktype: $('.lipsticktype').val(),
      lipstickintensidad: $('.lipstickintensidad').val(),
      lipstickcolor1: $('input[name=lipstickcolor1]:checked', '#formSkinCreator').val(),
      blushtype: $('.blushtype').val(),
      blushintensidad: $('.blushintensidad').val(),
      blushcolor: $('input[name=blushcolor]:checked', '#formSkinCreator').val(),
      // Clothes
      hats: $('.chapeaux .active').attr('data'),
      glasses: $('.lunettes .active').attr('data'),
      ears: $('.oreilles .active').attr('data'),
      tops: $('.hauts .active').attr('data'),
      pants: $('.pantalons .active').attr('data'),
      shoes: $('.chaussures .active').attr('data'),
      watches: $('.montre .active').attr('data'),
      //  Ropa de tia
      hats2: $('.chapeaux2 .active').attr('data'),
      glasses2: $('.lunettes2 .active').attr('data'),
      ears2: $('.oreilles2 .active').attr('data'),
      tops2: $('.hauts2 .active').attr('data'),
      pants2: $('.pantalons2 .active').attr('data'),
      shoes2: $('.chaussures2 .active').attr('data'),
      watches2: $('.montre2 .active').attr('data'),
    }));
  }); 
  // Rotate player
  $(document).keypress(function(e) {
    if(e.which == 97){ // A pressed
      $.post('http://skincreator/rotaterightheading', JSON.stringify({
        value: 10
      }));
    }
    if(e.which == 100){ // D pressed
      $.post('http://skincreator/rotateleftheading', JSON.stringify({
        value: 10
      }));
    }
  });

  // Zoom out camera for clothes
  $('#tabs label').on('click', function(e){
    //e.preventDefault();
    $.post('http://skincreator/zoom', JSON.stringify({
      zoom: $(this).attr('data-link')
    }));
  });

  // Test value
  var xTriggered = 0;
  $(document).keypress(function(e){
    e.preventDefault();
    xTriggered++;
    if(e.which == 13){
      $.post('http://skincreator/test', JSON.stringify({
        value: xTriggered
      }));
    }
  });

});
