// Initialize Elm
var node = document.getElementById('main');
var app = Elm.Main.embed(node);

// Firebase 
firebase.initializeApp(config);
var dbRef = firebase.database().ref().child("messages");

// Ports

app.ports.sendContactInfo.subscribe(formInfo => {
    var ref = dbRef.push();
    ref.set(formInfo).catch(error => 
        app.ports.formResult.send(false)).then(() => app.ports.formResult.send(true));
});


// Don't show image before loading
var headerImg = new Image();
headerImg.addEventListener('load', () => {app.ports.headerImg.send(true)}, false);
headerImg.src = "img/bg2.jpg";
