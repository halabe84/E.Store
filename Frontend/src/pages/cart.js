import React, { useState,useEffect } from 'react';
import axios from 'axios';
import AppBar from './appbar';



const Cart = () => {
  const [product, setProduct] = useState({
    name: '',
    price: 0,
  });
  const token = localStorage.getItem('token'); // استرجاع التوكن من Local Storage

  // إعداد رأس الطلب لتضمين التوكن
  const headers = {
    'Authorization': `Bearer ${token}`,
  };

  
    const [cartData, setCartData] = useState([]);
  
    useEffect(() => {
      // استدعاء بيانات السلة من الخادم بانتظام
      const fetchCartData = async () => {
        try {
          const response = await axios.get('http://my_store.test/api/orders',{headers}); // استبدل بعنوان الواجهة الصحيح
          if (response.status === 200) {
            setCartData(response.data.order); // تحديث البيانات في الحالة الداخلية لعرضها
            console.log(response)
          } else {
            console.error('فشل في جلب بيانات السلة');
          }
        } catch (error) {
          console.error('حدث خطأ أثناء الجلب:', error);
        }
      };
  
      // استدعاء بيانات السلة عند تحميل المكون
      fetchCartData();
    }, []);
  
    const handleUpdateQuantity = async (productId, orderId,newQuantity) => {
        try {
          const response = await axios.put(`http://my_store.test/api/updateorder/${orderId}/product/${productId}`, {
            quantity: newQuantity,
          },{headers}); // استبدل بعنوان الواجهة الصحيح والبيانات الصحيحة
    
          if (response.status === 200) {
            // تحديث الحالة المحلية بالبيانات الجديدة من الخادم
            const updatedCartData = cartData.map((item) => {
              if (item.product === productId) {
                return { ...item, qty: newQuantity };
              }
              return item;
            });
            setCartData(updatedCartData);
          } else {
            console.error('فشل في تحديث العدد');
          }
        } catch (error) {
          console.error('حدث خطأ أثناء التحديث:', error);
        }
      };
      const handleRemoveItem = async (productId, orderId) => {
        try {
          const response = await axios.delete(`http://my_store.test/api/deletefromorder/${orderId}/product/${productId}`, {headers}); // استبدل بعنوان الواجهة الصحيح والبيانات الصحيحة
          if (response.status === 200) {
            // تحديث الحالة المحلية بالبيانات الجديدة من الخادم
            console.log('ok')
            }
            //setCartData(updatedCartData);
          
        } catch (error) {
          console.error('حدث خطأ أثناء التحديث:', error);
        }
      };
    
      return (
        <div>
          <h2>سلة الشراء</h2>
          <table >
            <thead >
              <tr>
                <th>اسم المنتج</th>
                <th>السعر </th>
                <th>العدد</th>
                <th>الصورة</th>
                <th>إجراءات</th>
              </tr>
            </thead>
            <tbody>

            {[...cartData.values()].map((item, index) => (
            <tr key={index}>
              <td>{item.product_object.name}</td>
              <td>{item.product_object.price}</td>
              <td>{item.qty}</td>
              <td>
                <img
                  src={`http://my_store.test/images/${item.product_object.image}.jpg`}
                  alt={item.product_object.name}
                  style={{ maxWidth: '100px' }}
                />
              </td>
              <td>
                <button onClick={() => handleUpdateQuantity(item.product, item.order, item.qty + 1)}>+</button>
                <button onClick={() => handleUpdateQuantity(item.product, item.order, item.qty - 1)}>-</button>
                <button onClick={() => handleRemoveItem(item.product, item.order)}>إزالة</button>
              </td>
            </tr>
          ))}
{/* 
              {cartData.map((item, index) => (
                <tr key={index}>
                  <td>{item.product_object.name}</td>
                  <td>{item.product_object.price}</td>
                  <td>{item.qty}</td>
                  
                  <td>
                    <img
                      src={`http://my_store.test/images/${item.product_object.image}.jpg`}
                      alt={item.product_object.name}
                      style={{ maxWidth: '100px' }}
                    />
                  </td>
                  <td>
                    <button onClick={() => handleUpdateQuantity(item.product,item.order, item.qty + 1)}>+</button>
                    <button onClick={() => handleUpdateQuantity(item.product,item.order, item.qty - 1)}>-</button>
                    <button onClick={() => handleRemoveItem(item.product,item.order)}>إزالة</button>
                  </td>
                </tr>
              ))} */}
            </tbody>
          </table>
        </div>
      );
    };
          
  export default Cart;