@extends('Dashboard.Admin Layout.layout')
@section('title')
One Product
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
                    This counter showcases the remarkable range of offerings we have curated for our valued customers. </p>

                <p class="two">From trending items to timeless classics, each increment in the counter represents a unique product waiting to enhance your lifestyle.
                    Explore the diversity of our collection and experience the excitement of finding your perfect match. 
                    With every new addition, we strive to bring you the finest selection and exceed your expectations. 
                    Embrace the journey of exploration as you witness our product counter grow, reflecting our commitment to quality, innovation, and customer satisfaction.
                </p>
            </div>
        </section>

        <section class="all_categories">
            <h1>MEN'S PRODUCTS</h1>
            <div class="main_image_cate">
                <img src="../../../img/dashboard/category_images/man_cate.jpeg" alt="">
            </div>
            <h1>JACKETS</h1>
            <div class="all_cate_blocks">
                <div class="cate one_prod">
                    <div class="id_link">
                        <a href="#">#15</a>
                    </div>
                    <div class="left">
                        <div class="img_name_left">
                            <div class="image">
                                <img src="../../../img/Man/Jackets/Malakhi-jacket_Jackets_673_12.png" alt="" srcset="">
                            </div>
                            <div class="name">
                                <h1>DFREEJ JACKETS</h1>
                            </div>
                        </div>
                    </div>
                    <div class="right">
                        <div class="colors">
                            <div class="head_color">
                                <h1>Colors</h1>
                            </div>
                            <div class="pro_color_container">
                                <div class="color_blobs">
                                </div>
                                <div class="color_blobs">
                                </div>
                                <div class="color_blobs">
                                </div>
                            </div>
                        </div>
                        <div class="sizes">
                            <div class="head_size">
                                <h1>Size</h1>
                            </div>
                            <div class="pro_size_container">
                                <div class="size_blobs">
                                    <p>X</p>
                                </div>
                                <div class="size_blobs">
                                    <p>XL</p>
                                </div>
                            </div>
                        </div>
                        <div class="price">
                            <h1>Price</h1>
                            <p>235 $</p>
                        </div>
                        <div class="quantity">
                            <h1>Quantity</h1>
                            <p>15</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="add_links">
            <div class="add_subcate">
                <a href="#">ADD COLOR & SIZE</a>
            </div>
        </section>
@endsection
