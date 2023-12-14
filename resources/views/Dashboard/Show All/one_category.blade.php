@extends('Dashboard.Admin Layout.layout')
@section('title')
    Men's Subcategory
@endsection
@section('content')
        <section class="blobs">
            <div class="category">
                <h3>TOTAL CATEGORY</h3>
                <img src="{{ asset('img/dashboard/icons/category.png') }}" alt="nobe">
                <h1>800</h1>
            </div>
            <div class="text">
                <h1>FTRU TOTAL CATEGORY COUNTER</h1>
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
            <h1>MEN CATEGORY</h1>
            <div class="main_image_cate">
                <img src="{{ asset('img/dashboard/category_images/man_cate.jpeg') }}" alt="">
            </div>
            <h1>MEN'S SUBCATEGORY</h1>
            <div class="all_cate_blocks">
                @foreach ($category->categorySubcategory as $subcate)
                <div class="cate">
                    <div class="id_link">
                        <a href="{{route('onesubcate',["id"=>$subcate->id])}}">{{"#".$subcate->id}}</a>
                    </div>
                    <div class="img_name">
                        <div class="image">
                            <img src="{{ asset('img/Man/Jackets/Malakhi-jacket_Jackets_673_12.png') }}" alt="" srcset="">
                        </div>
                        <div class="name">
                            @php
                                $db_allsubname =$subcate->name;
                                $show_allsubname = str_replace('_', ' ', $db_allsubname)
                            @endphp
                            <h1>{{$show_allsubname}}</h1>
                        </div>
                    </div>
                    <div class="cate_pro">
                        <h3>Products</h3>
                        <p>{{$subcate->subcategoryProduct->count()}} <span>Items</span></p>
                    </div>
                </div>
            @endforeach
            </div>
        </section>
        <section class="add_links">
            <div class="add_subcate">
                <a href="{{ route('add subcategory') }}">ADD SUBCATEGORY</a>
            </div>
        </section>
@endsection
