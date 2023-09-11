import { useEffect, useState } from "react";
import "./style/app.scss";
import img from "./product.jpg"
import logo from "./Online-shopping.png"
import { Navigate } from 'react-router-dom';
import axios from "axios";
import { redirect } from "react-router-dom";
export default function AppBar() {
    const [searchValue, setSearchValue] = useState([])
    const [searchResults, setSearchResults] = useState([]); // Store search results

    /*TODO this var should change when user login to true*/
    var loggedIn = null;
    //const [navigate, setNavigate] = useState(false);
    const token = localStorage.getItem('token');
    // const token = localStorage.getItem('token'); // استرجاع التوكن من Local Storage

    // إعداد رأس الطلب لتضمين التوكن
    const headers = {
      'Authorization': `Bearer ${token}`,
    };
  
    if (token) {
        loggedIn = true;
    }
    else { loggedIn = false; }

    const handlelogout = async e => {
        const headers = {
            'Authorization': `Bearer ${token}`,
        };
        console.log(headers)
        // const getUserData = async () => {
        const res = await axios.post('http://my_store.test/api/logout', null, { headers })
        console.log("res:", res)
        // check if api was called with no errors
        if (res.status === 200) {


            // update prodcuts list for UI   
            console.log(token)
            localStorage.removeItem("token")
            redirect("/login");
            //return <Redirect to="/"/>
        }
        else {
            alert('faild to logout')
        }

    }

    async function handleSearch(e) {
        e.preventDefault();
        console.log("searchValue:",searchValue)
        const data={
            name:searchValue
        }
        try {

            const response = await axios.get("http://my_store.test/api/products/search", {
                params: {
                    name: searchValue, // Pass the search value as a query parameter
                    
                    // you should handle this case how to know if the user search using name or desc or cats
                    // desc:searchValue
                  },
                  headers 
              })

        //     const response = await axios.get(`http://my_store.test/api/products/search/`, {headers}); // استبدل بعنوان الواجهة الصحيح والبيانات الصحيحة
           console.log("response:",response.data.products)
            if (response.status === 200) {
                setSearchResults(response.data.products)
            } else {
              console.error('فشل في تحديث  searchالعدد');
            }
          } catch (error) {
            console.error('حدث خطأsearch أثناء :', error);
          }

    }
    return <div className="home page">
        <div className="appbar sticky-top" >
            <a href="/home">
                <img class="ml-5 mr-3" src={logo} width="100px" alt="" />
            </a>{loggedIn === false ? <>
                <a className="link" href="/login">Login</a>
                <a className="link" href="/register">Register</a>
            </>
                :
                <>
                    <a onClick={handlelogout} className="link btn" >Log out</a>
                    <a className="link" href="/myorders">My Orders</a>
                </>
            }
            <div className="space"></div>
            <nav class="navbar bg-body-tertiary">
                <div class="container-fluid">
                    <form class="d-flex" role="search">
                        <input onChange={e => setSearchValue(e.target.value)} class="form-control me-2" type="search" placeholder="Search for product" aria-label="Search" />
                        <button onClick={handleSearch} class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                </div>
            </nav>

            {loggedIn ? <>
                <a class="mr-1" className="link" href="/cart">Cart</a>
                <a class="mr-3" className="link" href="/profile">Profile</a>
            </> : <></>}

        </div>
    </div>
}

