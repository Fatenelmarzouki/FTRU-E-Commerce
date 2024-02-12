@extends('Dashboard.Admin Layout.layout')
@section('title', $product->name)
@section('content')
    <section class="blobs">
        <div class="product">
            <h3>PRODUCT CODE</h3>
            <img src="{{ asset('img/dashboard/icons/box.png') }}" alt="nobe">
            <h1>{{ '#'.$product->product_code }}</h1>
        </div>
        <div class="text">
            <h1>FTRU PRODUCTS</h1>
            <p class="one">Discover the depth and breadth of our extensive product catalog with the FTRU Total Products
                Counter.
                This counter showcases the remarkable range of offerings we have curated for our valued customers. </p>
            <p class="two">From trending items to timeless classics, each increment in the counter represents a unique
                product waiting to enhance your lifestyle.
                Explore the diversity of our collection and experience the excitement of finding your perfect match.
                With every new addition, we strive to bring you the finest selection and exceed your expectations.
                Embrace the journey of exploration as you witness our product counter grow, reflecting our commitment to
                quality, innovation, and customer satisfaction.
            </p>
        </div>
    </section>

    <section class="all_categories">
        <h1>{{ $category->name . "'S PRODUCTS" }}</h1>
        <div class="main_image_cate">
            <img src="{{ asset('img/dashboard/category_images/man_cate.jpeg') }}" alt="">
        </div>
            @php
                $db_allsubname =$subcategory->name;
                $show_allsubname = str_replace('_', ' ', $db_allsubname)
            @endphp
        <h1>{{ $show_allsubname }}</h1>
        <div class="add_subcate">
            <a
                href="{{ route('Add new CS to product', ['category_id' => $category->id, 'subcategory_id' => encrypt($subcategory->id), 'product_id' => encrypt($product->id)]) }}">
                ADD COLOR & SIZE
            </a>
        </div>
        <div class="all_cate_blocks">
            <div class="cate one_prod">
                <div class="left">
                    <div class="img_name_left">
                        <div class="image">
                            <img src=" {{ asset("storage/$product->image") }}" alt="Product Image">
                        </div>
                        <div class="name">
                            <h1>{{ $product->name }}</h1>
                        </div>
                    </div>
                </div>
                <div class="right">
                    <div class="colors">
                        <div class="head_color">
                            <h1>Colors</h1>
                        </div>
                        <div class="pro_color_container">
                            @foreach ($product->productColor as $color)
                                @if ($color->color == 'Multi')
                                    <p><b>Multiple Color</b></p>
                                @else
                                    <div class="color_blobs" style="background-color: {{ $color->color }}">
                                    </div>
                                @endif
                            @endforeach
                        </div>
                    </div>
                    <div class="sizes">
                        <div class="head_size">
                            <h1>Size</h1>
                        </div>
                        <div class="pro_size_container">
                            @foreach ($product->productSize->sortBy('size') as $size)
                                @if ($size->size == 'ONE SIZE' || $size->size == 'NO SIZE')
                                    <p><b>{{ $size->size }}</b></p>
                                @else
                                    <div class="size_blobs">
                                        <p>{{ $size->size }}</p>
                                    </div>
                                @endif
                            @endforeach
                        </div>
                    </div>
                    <div class="price">
                        <h1>Price</h1>
                        <p>{{ $product->main_price }}</p>
                    </div>

                    <div class="quantity">
                        <h1>Quantity</h1>
                        @php
                            $allQuantity = 0;
                        @endphp
                        @foreach ($product->productSize as $size)
                            @foreach ($size->sizeColor as $cs)
                                @php
                                    $allQuantity += $cs->pivot->quantity;
                                @endphp
                            @endforeach
                        @endforeach
                        <p>{{ $allQuantity }}</p>
                    </div>
                </div>
                <div class="options">
                    <a href="{{ route('admin_edit product',['category_id'=>$category->id,'subcategory_id'=>$subcategory->id,'product_id'=>encrypt($product->id)]) }}">
                        <img src="{{ asset('img/dashboard/icons/edit.png') }}" alt="edit"
                            srcset="">
                    </a>
                    <form action="{{route('deleteProduct',['category_id'=>$category->id,'subcategory_id'=>encrypt($subcategory->id),'product_id'=>encrypt($product->id)]) }}" method="post">
                        @csrf
                        @method('DELETE')
                        <button type="submit"><img src="{{ asset('img/dashboard/icons/delete.png') }}" alt="not"></button>
                    </form>
                </div>
            </div>
        </div>
        <div class="sub_products">
            @foreach ($product->productColor as $color)
                @foreach ($color->colorSize as $item)
                    @if ($product->image != $item->pivot->image)
                        <div class="sub_product_container">
                            <div class="id_link">
                                <a href="#">{{'# '. $item->pivot->id }}</a>
                            </div>
                            @php
                                $prosize = DB::table('product_sizes')
                                    ->where('id', $item->pivot->product_size_id)
                                    ->first();
                                $procolor = DB::table('product_colors')
                                    ->where('id', $item->pivot->product_color_id)
                                    ->first();
                                $img = $item->pivot->image;
                            @endphp
                            <div class="img_name">
                                <div class="image">
                                    <img src="{{ asset("storage/$img") }}" alt="" srcset="">
                                </div>
                            </div>
                            <div class="colors">
                                <div class="head_color">
                                    <h1>Color</h1>
                                </div>
                                <div class="pro_color_container">
                                        @if ($procolor->color == 'Multi')
                                            <p><b>Multiple Color</b></p>
                                        @else
                                            <div class="color_blobs" style="background-color: {{ $procolor->color }}">
                                            </div>
                                        @endif
                                </div>
                            </div>
                            <div class="sizes">
                                <div class="head_size">
                                    <h1>Size</h1>
                                </div>
                                <div class="pro_size_container">
                                        @if ($prosize->size == 'ONE SIZE' || $prosize->size == 'NO SIZE')
                                            <p><b>{{ $prosize->size }}</b></p>
                                        @else
                                            <div class="size_blobs">
                                                <p>{{ $prosize->size }}</p>
                                            </div>
                                        @endif
                                </div>
                            </div>
                            <div class="quantity">
                                <h1>Quantity</h1>
                                <p>{{ $item->pivot->quantity }}</p>
                            </div>
                            <div class="options">
                                    <a
                                    href="{{ route('admin_edit productCS', [
                                    'category_id' => $category->id,
                                    'subcategory_id'=> $subcategory->id,
                                    'product_id' => encrypt($product->id),
                                    'productColor_id'=>$procolor->id,
                                    'productSize_id'=>$prosize->id,
                                    'productCS_id'=>$item->pivot->id]) }}"><img
                                        src="{{ asset('img/dashboard/icons/edit.png') }}" alt="not">
                                    </a>
                                <form action="{{ route('remove product color size',
                                ['category_id'=>$category->id,
                                'subcategory_id'=>$subcategory->id,
                                'product_id'=>encrypt($product->id),
                                'productColor_id'=>$procolor->id,
                                'productSize_id'=>$prosize->id,
                                'productCS_id'=>$item->pivot->id
                                ]) }}" method="post">
                                    @csrf
                                    @method('DELETE')
                                    <button type="submit"><img src="{{ asset('img/dashboard/icons/delete.png') }}"
                                            alt="not" srcset="">
                                    </button>
                                </form>
                            </div>
                        </div>
                    @endif
                @endforeach
            @endforeach
        </div>
    </section>


@endsection
