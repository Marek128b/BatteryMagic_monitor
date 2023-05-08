// Note: changes to the plugin code is not reflected to the chart, because the plugin is loaded at chart construction time and editor changes only trigger an chart.update().

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
get(child(dbRef, "/Users/" + window.uid + "/Device Name")).then((snapshot) => {
    if (snapshot.exists()) {
        console.log(snapshot.val());
    } else {
        console.log("No data available");
    }
}).catch((error) => {
    console.error(error);
});

let chart = new Chart(document.getElementById("myFirstChart"), {
    type: 'line',
    data: {
        labels: ["07.05.2023 - 10:20", "07.05.2023 - 10:25", "07.05.2023 - 10:30", "07.05.2023 - 10:35", "07.05.2023 - 10:40", "07.05.2023 - 10:45"],
        datasets: [{
            label: "Battery1 1s",
            data: [
                4.2,
                3.7,
                4.0,
                4.1,
                4.0,
                3.8
            ],
            color: 'rgba(0, 0, 200, 0.4)',
            borderColor: 'rgba(0, 0, 255, 1)'
        }, {
            label: "Battery1 2s",
            data: [
                7.4,
                7.2,
                7.0,
                7.2,
                6.9,
                7.0
            ],
            color: 'rgba(200, 0, 0, 0.4)',
            borderColor: 'rgba(255, 0, 0, 1)'
        }
        ]
    },
    options: {
        animation: {
            duration: 500, // general animation time
        },
        hover: {
            animationDuration: 0, // duration of animations when hovering an item
        },
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
});
