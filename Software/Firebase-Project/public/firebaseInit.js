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
const app = initializeApp(firebaseConfig);

//init service
const rtdb = getDatabase();

//firebase rtdb reference
const dbRef = ref(rtdb);

//get data from rtdb
get(child(dbRef, "/")).then((snapshot) => {
    if (snapshot.exists()) {
        console.log(snapshot.val());
    } else {
        console.log("No data available");
    }
}).catch((error) => {
    console.error(error);
});