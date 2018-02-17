import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';
admin.initializeApp(functions.config().firebase);

interface ContactForm {
    contactFormMessage : String;
    contactFormEmail : String;
    contactFormName : String
};

exports.addMessage = functions.https.onRequest((req, res) => {
    const original = req.query.text;

    const redirect303 = (snapshot) => res.redirect(303, snapshot.ref); 
    return admin.database().ref('/messages').push({original: original}).then((snapshot) => {
        return redirect303;
    });
});
// // Start writing Firebase Functions
// // https://firebase.google.com/docs/functions/typescript
//
// export const helloWorld = functions.https.onRequest((request, response) => {
//  response.send("Hello from Firebase!");
// });
