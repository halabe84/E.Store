import React,{  useState,useEffect } from "react";
// import  from "react";
import "./style/app.scss";
import AppBar from "./appbar";
import { Link } from "react-router-dom";

export default function HomePage({ addToCart }) {
    // console.log("addToCart:", addToCart)
    const [products, setProducts] = useState([])
    const [categories, setCategories] = useState([])
    const getProducts = async (categoryId) => {
        const url = categoryId ? `http://my_store.test/api/products/category/${categoryId}` : 'http://my_store.test/api/products';
        const res = await fetch(url);
        if (res.ok) {
            const response = await res.json();
            setProducts(response.products);
        } else {
            alert('Failed to get products from API');
        }
    };
    const [selectedCategory, setSelectedCategory] = useState(null);

const handleCategoryClick = (categoryId) => {
    setSelectedCategory(categoryId);
    getProducts(categoryId); 
};
    const getCategoreis = async () => {
        const res1 = await fetch('http://my_store.test/api/categories');
            if (res1.ok) {
                const categoriesData = await res1.json();
                console.log(categories)
                setCategories(categoriesData.categories);
            } else {
                alert('Failed to get categories from API');
            }
        }
    useEffect(() => {
        getProducts();
       
    }, [])
    useEffect(() => {
        getCategoreis();
       
    }, [])
   
   
    return <div className="home page">

        <AppBar />
        <div class="container">
            <h2 class="mt-3 container d-flex align-items-center justify-content-center">Categories</h2>
            <ul className="row container d-flex align-items-center justify-content-center">
    {categories.map((el) => (
        <li
            onClick={() => handleCategoryClick(el.id)} 
            className={`list-group-item ${selectedCategory === el.id ? 'active' : ''}`} 
            key={el.id}
        >
            {el.name}
        </li>
    ))}
</ul>
        </div>

        <div className="body">
            {
                products.length === 0 ?
                    <h1>Loading ...</h1>
                    :
                    products.map(
                        el =>
                            <div  className="product" style={{ width: "18rem" }} class="card m-3" key={el.id}>
                                <img width="100%" src={`http://my_store.test/images/${el.image}.jpg`} alt="" />
                                <div class="card-body">
                                    <h1 class="card-title">{el.name}</h1>
                                    <p class="card-text">{el.description.substring(0, 50)}</p>
                                    <a onClick={() => addToCart(el.id, el.cat_id)} class="btn btn-primary">Add To Cart</a>
                                    <Link to="/details" state={{ el }} class="ml-5 btn btn-warning">details</Link>
                                </div>
                            </div>
                    )
            }
        </div>
    </div>;
}