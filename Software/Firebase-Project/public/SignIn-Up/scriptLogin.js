import { getAuth, onAuthStateChanged, signInWithEmailAndPassword, createUserWithEmailAndPassword, signInWithPopup, GoogleAuthProvider } from "https://www.gstatic.com/firebasejs/9.21.0/firebase-auth.js";
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

//Sign Up with Email and Password
const buttonSignUp = document.getElementById("SignupButton");
buttonSignUp.addEventListener("click", function (e) {

    const email = document.getElementById("SignupEmail").value;
    const password1 = document.getElementById("SignupPassword1").value;
    const password2 = document.getElementById("SignupPassword2").value;

    if (password1 == password2) {
        console.log("passwords are equal.. SignUp");
        createUserWithEmailAndPassword(auth, email, password1)
            .then((userCredential) => {
                // Signed in 
                const user = userCredential.user;

                console.log("Signed In and Created User");
                // ...
                document.getElementById("SignIn-SignUp_Label").innerHTML = "SignedIn";
                window.isSignedIn = true;
                //redirect to Home
                window.location.href = "../index.html";
            })
            .catch((error) => {
                const errorCode = error.code;
                const errorMessage = error.message;
                // ..
            });
    }
});


//Sign In with Email and Password
const buttonLogin = document.getElementById("LoginButton");
buttonLogin.addEventListener("click", function (e) {

    const email = document.getElementById("LoginEmail").value;
    const password = document.getElementById("LoginPassword").value;

    signInWithEmailAndPassword(auth, email, password)
        .then((userCredential) => {
            // Signed in 
            console.log("Signed in");
            const user = userCredential.user;
            // ...
            document.getElementById("SignIn-SignUp_Label").innerHTML = "SignedIn";
            window.isSignedIn = true;
            //redirect to Home
            window.location.href = "../index.html";
        })
        .catch((error) => {
            const errorCode = error.code;
            const errorMessage = error.message;
        });
});


//Sign In with Google Auth
const button = document.getElementById("loginWithgoogleButton");
button.addEventListener("click", function (e) {
    signInWithPopupClick();
    //redirect to Home
    window.location.href = "../index.html";
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

            document.getElementById("SignIn-SignUp_Label").innerHTML = "SignedIn";
            window.isSignedIn = true;
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


//getThe current User
onAuthStateChanged(auth, (user) => {
    if (user) {
        // User is signed in, see docs for a list of available properties
        // https://firebase.google.com/docs/reference/js/firebase.User
        const uid = user.uid;
        console.log(uid);
        // ...
    } else {
        // User is signed out
        // ...
    }
});