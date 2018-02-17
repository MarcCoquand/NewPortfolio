// Initialize Elm
var node = document.getElementById('main');
var app = Elm.Main.embed(node);

// Firebase 
var config = {
  apiKey: "AIzaSyBlc6u3UHeMHGtp2jYEePxxWZZi2d-Knfo",
  authDomain: "portfolio-34ea9.firebaseapp.com",
  databaseURL: "https://portfolio-34ea9.firebaseio.com/",
  projectId: "portfolio-34ea9",
  storageBucket: "",
  messagingSenderId: "349119519939"
};
firebase.initializeApp(config);
var dbRef = firebase.database().ref().child("messages");

// Ports

app.ports.sendContactInfo.subscribe(formInfo => {
    var ref = dbRef.push();
    ref.set(formInfo).catch(error => 
        console.log(error))
});


// Don't show image before loading
var headerImg = new Image();
headerImg.addEventListener('load', () => {app.ports.headerImg.send(true)}, false);
headerImg.src = "img/bg.jpg";
