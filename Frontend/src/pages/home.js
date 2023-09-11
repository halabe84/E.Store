import { useEffect, useState } from "react";
import "./style/app.scss";
import img from "./product.jpg"
import logo from "./Online-shopping.png"
import AppBar from "./appbar";
import { Link } from "react-router-dom";
import Cart from "./cart";

export default function HomePage({ props }) {
    console.log("props:", props)
    const [products, setProducts] = useState([])
    const [categories, setCategories] = useState([])
    /*TODO this var should change when user login to true*/
    const loggedIn = false;
    const getProducts = async () => {

        // setProducts([
        //     {price:"45", name: "product 1", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." },
        //     {price:"12", name: "product 2", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." },
        //     {price:"16", name: "product 3", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." },
        //     {price:"33", name: "product 4", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." },
        //     {price:"25", name: "product 5", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." },
        //     {price:"78", name: "product 6", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." }
        // ])
        /*TODO remove this method and bring the categories from the API  */
        setCategories(["Electronics", "Fashion", "Home and Garden", "Sports and Outdoors", "Health and Beauty"])
        // call api for getting products from server
        const res = await fetch('http://my_store.test/api/products')
        // check if api was called with no errors
        if (res.ok) {
            // convert from json to object
            const response = await res.json();
            // show success message to the user
            // alert(response.message)
            // update prodcuts list for UI            
            setProducts(response.products)
        } else {
            alert('failed to get products form API')
        }
    }
    useEffect(() => {
        getProducts()
    }, [])
    return <div className="home page">



        <AppBar />

        <div class="container">
            <h2 class="mt-3 container d-flex align-items-center justify-content-center">Categories</h2>
            <ul class="row container d-flex align-items-center justify-content-center">
                {
                    categories.map(el => < li class="list-group-item">{el}</li>)
                }
            </ul>
        </div>

        <div className="body">
            {
                products.length === 0 ?
                    <h1>Loading ...</h1>
                    :
                    products.map(
                        el =>
                            <div className="product" style={{ width: "18rem" }} class="card m-3" key={el.id}>
                                {/*TODO replace the img elemnt */}
                                {/* <img width="100%" src={img} alt="" /> */}
                                <img width="100%" src={`http://my_store.test/images/${el.image}.jpg`} alt="" />
                                <div class="card-body">
                                    <h1 class="card-title">{el.name}</h1>
                                    <p class="card-text">{el.description.substring(0, 50)}</p>

                                    <a onClick={() => props(el.id, el.cat_id)} class="btn btn-primary">Add To Cart</a>
                                    {/* <a href="/details" alt="" class="ml-5 btn btn-warning">details</a> */}
                                    <Link to="/details" state={{ el }} class="ml-5 btn btn-warning">details</Link>
                                </div>
                            </div>
                    )
            }
        </div>
    </div>;
}

