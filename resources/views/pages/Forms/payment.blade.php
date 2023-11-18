@extends('pages.layout.layout')
@section('title')
Payment
@endsection
@section('content')
    <section class="reg_form">
        <div class="containt">
            <h1 class="reg">Pay</h1>
            <div class="all_product">
                <h1>Your Products</h1>
                <a href="">
                    <div class="one_product">
                        <h3 class="pro_name">pro_1</h3>
                        <div class="delete_price">
                            <p class="pro_price">135.50 $</p>
                            <form class="delete" action="">
                                <button type="submit"><img src="../../img/Stars/delete pro.png" alt=""></button>
                            </form>
                        </div>
                    </div>
                </a>
                <div class="line"></div>

                <a href="">
                    <div class="one_product">
                        <h3 class="pro_name">pro_1</h3>
                        <div class="delete_price">
                            <p class="pro_price">135.50 $</p>
                            <form class="delete" action="">
                                <button type="submit"><img src="../../img/Stars/delete pro.png" alt=""></button>
                            </form>
                        </div>
                    </div>
                </a>
                <div class="line"></div>

                <a href="">
                    <div class="one_product">
                        <h3 class="pro_name">pro_1</h3>
                        <div class="delete_price">
                            <p class="pro_price">135.50 $</p>
                            <form class="delete" action="">
                                <button type="submit"><img src="../../img/Stars/delete pro.png" alt=""></button>
                            </form>
                        </div>
                    </div>
                </a>
                <div class="line"></div>

                <a href="">
                    <div class="one_product">
                        <h3 class="pro_name">pro_1</h3>
                        <div class="delete_price">
                            <p class="pro_price">135.50 $</p>
                            <form class="delete" action="">
                                <button type="submit"><img src="../../img/Stars/delete pro.png" alt=""></button>
                            </form>
                        </div>
                    </div>
                </a>
                <div class="line"></div>
                <div class="total">
                    <h1>Total</h1>
                    <p class="total_price">135.50 $</p>
                </div>
                <div class="total_line"></div>
            </div>
            <form action="">
                <h1>Credit Card Details</h1>

                <label class="reg_label" for="">Cardholder Name</label>
                <input  class="reg_inputs_one" type="text">

                <label class="reg_label" for="">Card Number</label>
                <input  class="reg_inputs_six" type="text">

                <div class="zip">
                    <div>
                        <label class="reg_label" for="">Expiration Date</label>
                        <input  class="reg_inputs_three" type="text">
                    </div>
                    <div>
                        <label class="reg_label" for="">CVV "ZIP"</label>
                        <input  class="reg_inputs_four" type="text">
                    </div>
                </div>

                <h1>Address Details</h1>

                <label class="reg_label" for="">Address</label>
                <input class="reg_inputs_five" type="email">
                <div class="zip_address">
                    <div>
                        <label class="reg_label" for="">Country</label>
                        <input class="reg_inputs_three" type="password">
                    </div>
                    <div>
                        <label class="reg_label" for="">City</label>
                        <input class="reg_inputs_four" type="password">
                    </div>
                </div>

                <div class="zip_address">
                    <div>
                        <label class="reg_label" for="">Street</label>
                        <input class="reg_inputs_six" type="password">
                    </div>
                    <div>
                        <label class="reg_label" for="">Building Number</label>
                        <input class="reg_inputs_seven" type="password">
                    </div>
                </div>
                <h1>Communication Details</h1>
                <label class="reg_label" for="">Email</label>
                <input class="reg_inputs_one" type="email">
                <label class="reg_label" for="">Phone</label>
                <input class="reg_inputs_four" type="email">
                <input class="submit" type="submit" value="Submit">
            </form>
        </div>
        <div class="gif_video_pay">
        </div>
    </section>
@endsection
