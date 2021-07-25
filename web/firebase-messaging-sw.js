importScripts("https://www.gstatic.com/firebasejs/8.6.1/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/8.6.1/firebase-messaging.js");

firebase.initializeApp({
    apiKey: "AIzaSyAdOFolTxzij4gF6PN6fhXzYQYubAaaA9s",
    authDomain: "flutter-learn-0225.firebaseapp.com",
    projectId: "flutter-learn-0225",
    storageBucket: "flutter-learn-0225.appspot.com",
    measurementId: "G-D7VNE9LN0Q",
    messagingSenderId: "163290319108",
    appId: "1:163290319108:web:b7e396c8f4242fc2376851",
});
// Necessary to receive background messages:
const messaging = firebase.messaging();

// Optional:
messaging.onBackgroundMessage((m) => {
    console.log("onBackgroundMessage", m);
});