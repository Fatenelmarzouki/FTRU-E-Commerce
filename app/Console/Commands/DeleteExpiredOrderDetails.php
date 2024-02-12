<?php

namespace App\Console\Commands;

use App\Models\OrderDetail;
use Illuminate\Console\Command;

class DeleteExpiredOrderDetails extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'delete:orderdetails';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Delete Expired Order details Monthly';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        // Calculate the date threshold for deletion (e.g., 30 days ago)
        $thresholdDate = now()->subDays(30);
        // Delete the rows older than the threshold date
        OrderDetail::where('created_at', '<', $thresholdDate)->delete();
        $this->info('Expired Order details rows deleted successfully.');
    }
}