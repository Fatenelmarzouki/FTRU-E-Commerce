<section id="search_page" class="admin_search">
    <div class="form_admin_search">
        <form id="submit_search" class="form_ad" action="{{ route('admin_search') }}" method="GET">
            @csrf
            <input autocomplete="off" id="search" class="search" type="text" name="query" >
            <button id="btn_search" class="btn" type="submit"><img src="{{ asset('img/Stars/search green.png') }}" alt="no"></button>
        </form>
        <div id="sugg_list" class="sugg_container">
        </div>
    </div>
</section>
