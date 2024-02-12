<?php

namespace App\Listeners;

use App\Models\Visitor;
use App\Events\PageVisited;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Support\Facades\Auth;

class IncrementVisitorCount
{
    /**
     * Create the event listener.
     */
    public function __construct()
    {
    }

    /**
     * Handle the event.
     */
    public function handle(PageVisited $event)
    {
        $visitor_count=$event->count + 1 ;
        $visitor=Visitor::updateOrCreate([
            "id" => 1
        ],[
            'count'=> $visitor_count
        ]);
    }
}