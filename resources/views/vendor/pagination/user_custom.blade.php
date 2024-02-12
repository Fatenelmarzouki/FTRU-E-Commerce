<section class="user_pagination">
    <div class="pagination_links">
        @if ($paginator->hasPages())
            <nav class="nav">
                <ul class="list">
                    {{-- Previous Page Link --}}
                    @if ($paginator->onFirstPage())
                        <li class="li_prev disabled" aria-disabled="true" aria-label="@lang('pagination.previous')">
                            <img src="{{asset('img/Stars/left.png')}}" aria-hidden="true">
                        </li>
                    @else
                        <li class="li_prev">
                            <a href="{{ $paginator->previousPageUrl() }}" rel="prev"
                                aria-label="@lang('pagination.previous')">
                                <img src="{{asset('img/Stars/left.png')}}" alt="" srcset="">
                            </a>
                        </li>
                    @endif

                    {{-- Pagination Elements --}}
                    @foreach ($elements as $element)
                        {{-- "Three Dots" Separator --}}
                        @if (is_string($element))
                            <li class="disabled" aria-disabled="true"><span>{{ $element }}</span></li>
                        @endif

                        {{-- Array Of Links --}}
                        @if (is_array($element))
                            @foreach ($element as $page => $url)
                                @if ($page == $paginator->currentPage())
                                    <li class="{{'li_'.$page.'_active'}}" aria-current="page"><a href="#">{{ $page }}</a></li>
                                @else
                                    <li class="{{ 'li_'.$page }}"><a href="{{ $url }}">{{ $page }}</a></li>
                                @endif
                            @endforeach
                        @endif
                    @endforeach

                    {{-- Next Page Link --}}
                    @if ($paginator->hasMorePages())
                        <li class="li_next">
                            <a href="{{ $paginator->nextPageUrl() }}" rel="next"
                                aria-label="@lang('pagination.next')">&rsaquo;</a>
                        </li>
                    @else
                        <li class="li_next disabled" aria-disabled="true" aria-label="@lang('pagination.next')">
                            <img src="{{asset('img/Stars/right.png')}}" alt="" srcset="">
                        </li>
                    @endif
                </ul>
            </nav>
        @endif
    </div>
</section>
