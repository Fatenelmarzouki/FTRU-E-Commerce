<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use App\Models\Visitor;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // \App\Models\User::factory(10)->create();
        \App\Models\User::factory()->create([
            'name' => 'Admin',
            'email' => 'admin@FTRU.com',
            'password' => Hash::make("12345789"),
            'user_type'=>'0',
            'country_id'=>'4',
        ]);
        Visitor::create([
            "count" => 0
        ]);
    }
}