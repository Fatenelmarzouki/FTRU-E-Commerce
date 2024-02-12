<?php

namespace App\Console\Commands;

use App\Models\Product;
use App\Models\CartItem;
use App\Models\OrderDetail;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Storage;

class AdminDeleteProduct extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'admin:delete-product';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Once the delete_status is updated to Yes, the system removes the product';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        $thresholdDate = now()->subDays(7);
        $products=Product::where('delete_status','Yes')->whereDate('updated_at', '=', $thresholdDate)->get();
        if ($products) {
            foreach ($products as $product) {
                $product_review = $product->productReview;
                $product_wishlist = $product->productWishlist;
                foreach ($product->productColor as $color) {
                    foreach ($color->colorSize as $productCS) {
                        $product_cartitems = CartItem::where('product_color_size_id', $productCS->pivot->id)->get();
                        $product_orderdetails = OrderDetail::where('product_color_size_id', $productCS->pivot->id)->get();
                        if ($product_cartitems) {
                            foreach ($product_cartitems as $procart) {
                                $procart->delete();
                            }
                        }
                        if ($product_orderdetails) {
                            foreach ($product_orderdetails as $proorderdetail) {
                                $proorderdetail->delete();
                            }
                        }
                        if ($productCS->pivot->image != null) {
                            Storage::delete($productCS->pivot->image);
                        }
                        $productCS->pivot->delete();
                    }
                    $color->delete();
                }
                foreach ($product->productSize as $size) {
                    $size->delete();
                }
                if ($product_review) {
                    foreach ($product_review as $proreview) {
                        $proreview->delete();
                    }
                }
                if ($product_wishlist) {
                    foreach ($product_wishlist as $prowishlist) {
                        $prowishlist->pivot->delete();
                    }
                }
                if ($product->image != null) {
                    Storage::delete($product->image);
                }
                $product->delete();
            }
            $this->info('Products Deleted Successfully');
        } else{
            $this->comment('There are no products where the delete_status has been updated to Yes');
        }
    }
}