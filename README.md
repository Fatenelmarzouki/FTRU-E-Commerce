
# FTRU E-commerce

FTRU is a comprehensive E-Commerce platform built on Laravel, designed to provide users with a seamless shopping experience. Whether you're a customer browsing products or an admin managing category, subCategory, products, customers, orders and inventory, FTRU offers a user-friendly interface and robust features to meet your needs.

## Table of Contents
* Installation
* Usage
* Features
* Technologies Used
* License


## Installation
1. clone this repo to your local machine: 

```bash
git clone https://github.com/Fatenelmarzouki/FTRU-E-Commerce.git && cd FTRU-E-Commerce
```
2. Run `composer install`

## Usage
1. Create a new database
2. Rename or copy `.env.example` file to `.env`
3. Set your configuration settings in your `.env` file
4. Run `php artisan key:generate`
5. Run `php artisan serve`
6. Run `php artisan migrate`
7. Run `php artisan database:seed`
8. Run `php artisan storage:link`
9. Run `php artisan schedule:run`
10. You can access the Home page from `http://127.0.0.1:8000/FTRU/Home`
11. Credentials to access admin panel (email: `admin@FTRU.com`, password: `12345789`)
12. You can access the admin page from `http://127.0.0.1:8000/Dashboard`

## Features
* ### User Features
    * #### __User Management:__
        * User registration
        * User login and authentication
        * User profile management 
    * #### __Product Browsing and Shopping:__
        * Browse products by categories and subCategory
        * Search products by keywords
        * View product details, including images,  sizes, colors, and prices
        * Add products to the shopping cart
        * Manage the shopping cart (update quantities, remove items)
        * Proceed to checkout and place orders
        * Track order status and history
        * Leave reviews and ratings for products
        * Create and manage a wishlist
    * #### __Account Management:__
        * Update user profile information
        * View and manage order history

* ### Admin Features
    * #### __Admin Dashboard:__
        * Admin login and authentication
        * Dashboard overview with key statistics and  reports
    * #### __Product Management:__
        * Add new products
        * Edit existing product information
        * Manage product categories and subCategory
        * Upload and manage product images
        * Set product pricing and inventory levels
    * #### __Order Management:__
        * View and manage orders (view details, update status, generate invoices)
        * Track order fulfillment and delivery
    * #### __User Management:__
        * View all user accounts
    * #### __Coupon and Discount Management:__
        * Create and manage discount codes and coupons
    * #### __Sales Reports and Analytics:__
        * Generate sales reports and analytics
    * #### __Responsive Design:__
        * Ensure the website is optimized for all devices and screen sizes

## Technologies Used
**Front-End:** HTML, CSS, SCSS, JavaScript

**Back-End:** PHP, Laravel

## License
The Laravel framework is open-sourced software licensed under the (MIT license).








