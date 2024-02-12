<?php

namespace App\Console\Commands;

use App\Models\CartItem;
use Illuminate\Console\Command;

class DeleteExpiredCartItems extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'delete:cartitem';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Delete Expired Cart item Monthly';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        // Calculate the date threshold for deletion (e.g., 30 days ago)
        $thresholdDate = now()->subDays(30);
        // Delete the rows older than the threshold date
        CartItem::where('created_at', '<', $thresholdDate)->delete();
        $this->info('Expired Cart item rows deleted successfully.');
    }
}
