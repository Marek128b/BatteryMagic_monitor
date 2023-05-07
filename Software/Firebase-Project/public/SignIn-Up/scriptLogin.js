import { getAuth, signInWithPopup, GoogleAuthProvider } from "https://www.gstatic.com/firebasejs/9.21.0/firebase-auth.js";
import { initializeApp } from 'https://www.gstatic.com/firebasejs/9.21.0/firebase-app.js'
import { getDatabase, ref, child, get } from 'https://www.gstatic.com/firebasejs/9.21.0/firebase-database.js'

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
    apiKey: "AIzaSyBHIc9XTrsoHxUlgKc1kuCGbg0P6JbSXSY",
    authDomain: "magicbattery-1abba.firebaseapp.com",
    databaseURL: "https://magicbattery-1abba-default-rtdb.europe-west1.firebasedatabase.app",
    projectId: "magicbattery-1abba",
    storageBucket: "magicbattery-1abba.appspot.com",
    messagingSenderId: "299109678971",
    appId: "1:299109678971:web:28eb7629059c68c4cf07de",
    measurementId: "G-F2QCJ3GG6E"
};

// Initialize Firebase
initializeApp(firebaseConfig);

const provider = new GoogleAuthProvider();
const auth = getAuth();

const button = document.getElementById("loginWithgoogleButton");
button.addEventListener("click", function (e) {
    signInWithPopupClick();
});

function signInWithPopupClick() {
    console.log("clicked")
    signInWithPopup(auth, provider)
        .then((result) => {
            // This gives you a Google Access Token. You can use it to access the Google API.
            const credential = GoogleAuthProvider.credentialFromResult(result);
            const token = credential.accessToken;
            // The signed-in user info.
            const user = result.user;
            // IdP data available using getAdditionalUserInfo(result)
            // ...
        }).catch((error) => {
            // Handle Errors here.
            const errorCode = error.code;
            const errorMessage = error.message;
            // The email of the user's account used.
            const email = error.customData.email;
            // The AuthCredential type that was used.
            const credential = GoogleAuthProvider.credentialFromError(error);
            // ...
        });
}

