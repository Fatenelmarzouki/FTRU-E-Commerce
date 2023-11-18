@extends('pages.layout.layout')
@section('title')
Change Password
@endsection
@section('content')
    <section class="reg_form">
        <div class="containt">
            <h1 class="reg">Change Your Password</h1>
            {{-- <div id="responseContainer"></div> --}}
            <form action="{{ route('change_password_handle') }}" method="POST" id="myForm">
                @csrf
                @method('PUT')
                <label class="reg_label" for="">Old Password</label>
                <input class="reg_inputs_two" type="password" name="old_password">
                @error('old_password')
                    {{ $message }}
                @enderror
                <br>
                <label class="reg_label" for="">New Password</label>
                <input class="reg_inputs_three" type="password" name="new_password">
                @error('new_password')
                    {{ $message }}
                @enderror
                <br>
                <label class="reg_label" for="">Confirm Password</label>
                <input class="reg_inputs_four" type="password" name="new_password_confirmation">
                @error('password_confirmation')
                    {{ $message }}
                @enderror
                <br>
                <button class="submit" type="submit" >Submit</button>
            </form>
        </div>
        <div class="gif_video_reset">
        </div>
    </section>
    {{-- <script>
        $(document).ready(function() {
            $('#myForm').submit(function(e) {
                e.preventDefault(); // Prevent the default form submission

                var formData = new FormData(this); // Create a FormData object with the form data

                $.ajax({
                    url: '{{ route('change_password_handle') }}',
                    type: 'PUT',
                    data: formData,
                    processData: false,
                    contentType: false,
                    success: function(response) {
                        // Handle the response from the server

                        // Update the page content dynamically based on the response
                        // For example, update a specific element's content
                        $('#responseContainer').text(response);
                    }
                });
                return false;
            });
        });
    </script> --}}
@endsection
