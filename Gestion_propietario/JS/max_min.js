window.addEventListener('resize', function() {
    var width = window.innerWidth;
    var height = window.innerHeight;

    var mod = document.getElementsByClassName("mod");

    if (width > 800 && height > 600) {

        for (var i = 0; i < mod.length; i++) {
            mod[i].style.justifyContent = "center";
            mod[i].style.alignItems = "center";
        }
        
    } else {

        for (var i = 0; i < mod.length; i++) {
            mod[i].style.justifyContent = "start";
            mod[i].style.alignItems = "start";
        }
    }
});