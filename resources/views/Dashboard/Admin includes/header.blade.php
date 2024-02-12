        <header class="dashboard_header">
            <div class="logo">
                <img src="{{ asset('img/dashboard/logo/FTRU (2).svg') }}" alt="">
            </div>
            <div class="links">
                <a class="nav-link" id="dash" href="{{ route('dash') }}">DASHBOARD</a>
                <a class="nav-link" href="{{ route('admin_orderhistory') }}">ORDERS</a>
                <a class="nav-link"  href="{{ route('show all category') }}" id="cate">CATEGORY</a>
                <a class="nav-link"  href="{{ route('all customers') }}">CUSTOMERS</a>
                <a class="nav-link" href="{{ route('adminlogout') }}">LOGOUT</a>
            </div>
            <div class="search_icons">
                <a id="search_link_click" class="nav-link" href="#">SEARCH<img src="{{asset('img/Stars/search green.png')}}" alt="" srcset=""></a>
            </div>
        </header>
<div class="sub_links" id="all_cate">
    <ul class="cates">
        @foreach ($category_name as $category)
            <li class="li_header"><a class="a_header" href="{{ route('Show_one category',['category_id'=>encrypt($category->id) ]) }}" >{{$category->name}}</a>
                <ul class="inner_sub">
                    @foreach ($category->categorySubcategory as $subcategory)
                    @php
                        $db_allsubname =$subcategory->name;
                        $show_allsubname = str_replace('_', ' ', $db_allsubname)
                    @endphp
                        <li><a href="{{ route('Show_one subcategory',['category_id'=>encrypt($category->id),'subcategory_id'=>encrypt($subcategory->id)]) }}">{{$show_allsubname}}</a></li>
                    @endforeach
                </ul>
            </li>
        @endforeach
    </ul>
</div>
