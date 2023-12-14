@extends('Dashboard.Admin Layout.layout')
@section('title')
    Add Product
@endsection
@section('content')
        <section class="blobs">
            <div class="product">
                <h3>TOTAL PRODUCTS</h3>
                <img src="../../../img/dashboard/icons/box.png" alt="nobe">
                <h1>800</h1>
            </div>
            <div class="text">
                <h1>FTRU TOTAL PRODUCTS COUNTER</h1>
                <p class="one">Discover the depth and breadth of our extensive product catalog with the FTRU Total Products Counter. 
                    This counter showcases the remarkable range of offerings we have curated for our valued customers.
                </p>
                <p class="two">From trending items to timeless classics, each increment in the counter represents a unique product waiting to enhance your lifestyle.
                    Explore the diversity of our collection and experience the excitement of finding your perfect match. 
                    With every new addition, we strive to bring you the finest selection and exceed your expectations. 
                    Embrace the journey of exploration as you witness our product counter grow, reflecting our commitment to quality, innovation, and customer satisfaction.
                </p>
            </div>
        </section>
        <section class="form">
            <h1>ADD PRODUCT</h1>
            <form action="">
                <div class="label_inputs">
                    <div class="right">
                        <label for="">NAME</label>
                        <input name="name" class="input" type="text">
                        <label for="">DESCRIPTION</label>
                        <input name="description" class="input" type="text">
                        <label for="">SUBCATEGORY</label>
                        <input name="subcategory" class="input" type="text">
                        <div class="main_PQ">
                            <div>
                                <label for="">MAIN SIZE</label>
                                <input name="size" class="main_input" type="text">
                            </div>
                            <div>
                                <label for="">QUANTITY</label>
                                <input name="quantity" class="main_input" type="text">
                            </div>
                        </div>
                    </div>
                    <div class="left">
                        <label for="">IMAGE</label>
                        <div class="input_image">
                            <input name="image" type="file"/>
                        </div>
                        <div class="main_PQ">
                            <div>
                                <label for="">MAIN PRICE</label>
                                <input name="price" class="main_input" type="text">
                            </div>
                            <div class="sec">
                                <label for="">MAIN DISCOUNT</label>
                                <input name="discount" class="main_input" type="text">
                            </div>
                            <div class="color_carry">
                                <label for="">COLOR</label>
                                <input name="color" class="color_input" type="color" value="#3F4045">
                            </div>
                        </div>
                    </div>
                </div>
                <button class="submit" type="submit">SUBMIT</button>
            </form>
        </section>
@endsection