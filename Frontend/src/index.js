import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import reportWebVitals from './reportWebVitals';
// import HomePage from './pages/home';
// import LOGIN from './pages/login';
// import Registr from './pages/register';
// import ProductDetails from './pages/productdetails';
// import UserProfile from './pages/userprofile';
import APP from './app';
const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  // <React.StrictMode>
   <APP/>
   // <UserProfile/>
//<ProductDetails/>
    // <Registr/>
    //{/* <HomePage /> */}
  // </React.StrictMode>
);

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals();
