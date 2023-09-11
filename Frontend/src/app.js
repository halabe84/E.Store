import React,{useState} from "react";
import Login from "./pages/login";
import HomePage from "./pages/home";
import { BrowserRouter, Routes, Route, Link } from "react-router-dom";
import Register from "./pages/register";
import ProductDetails from "./pages/productdetails"
import UserProfile from "./pages/userprofile";
import Cart from "./pages/cart";
import axios from "axios";
export default function APP() {
    
    // if(!token) {
    //     return <Login setToken={setToken} />
    const token = localStorage.getItem('token'); // استرجاع التوكن من Local Storage

    // إعداد رأس الطلب لتضمين التوكن
    const headers = {
      'Authorization': `Bearer ${token}`,
    };
    const addToCart = async ( productId,orderId) => {
     console.log("productId:", productId)
        try {
          // إعداد البيانات التي ستتم إرسالها إلى الخادم
          const data = {
            products: [
              {
                id: productId,
                qty: 1
              }
            ]
          };
          
      
          // إرسال طلب POST إلى واجهة API لإضافة المنتج إلى السلة
          const response = await axios.post('http://my_store.test/api/orders',data,{headers} );
      console.log(response)
          if (response.status === 200) {
            console.log('تمت إضافة المنتج إلى السلة بنجاح');
          } else {
            console.error('فشل في إضافة المنتج إلى السلة');
          }
        } catch (error) {
          console.error('حدث خطأ أثناء الإرسال:', error);
        }
      };
    
    
    //     }
  
    return<BrowserRouter>

      
        <Routes>
                <Route index  path="/" element={<HomePage props={addToCart}/>} />
                <Route path="/home" element={<HomePage props={addToCart}/>} />
                <Route path="login" element={<Login />} />
                <Route path="register" element={<Register />} />
                <Route path="details" element={<ProductDetails props={addToCart} />} />
                <Route path="Profile" element={<UserProfile />} />
                <Route path="cart" element={<Cart />} />
            </Routes >
        </BrowserRouter>
}