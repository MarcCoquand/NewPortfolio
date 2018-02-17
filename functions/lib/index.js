"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp(functions.config().firebase);
;
exports.addMessage = functions.https.onRequest((req, res) => {
    const original = req.query.text;
    const redirect303 = (snapshot) => res.redirect(303, snapshot.ref);
    return admin.database().ref('/messages').push({ original: original }).then((snapshot) => {
        return redirect303;
    });
});
// // Start writing Firebase Functions
// // https://firebase.google.com/docs/functions/typescript
//
// export const helloWorld = functions.https.onRequest((request, response) => {
//  response.send("Hello from Firebase!");
// });
//# sourceMappingURL=index.js.map