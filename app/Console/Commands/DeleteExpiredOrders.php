<?php

namespace App\Console\Commands;

use App\Models\Order;
use Illuminate\Console\Command;

class DeleteExpiredOrders extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'delete:orders';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Delete Expired Orders Monthly';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        // Calculate the date threshold for deletion (e.g., 30 days ago)
        $thresholdDate = now()->subDays(60);
        // Delete the rows older than the threshold date
        Order::where('created_at', '<', $thresholdDate)->delete();
        $this->info('Expired Orders rows deleted successfully.');
    }
}