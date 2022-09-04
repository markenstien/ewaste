<?php build('content')?>
    <div id="responseDiv"></div>
<?php endbuild()?>
    <?php build('scripts')?>
        <script>
            $(document).ready(function() {
                let responseDiv = $("#responseDiv");

                $.ajax({
                    url: getURL('api/payment/add'),
                    type: 'POST',
                    data: {
                        orders: [7,8],
                        payment: {
                            amount: 4781,
                            payment_method: 'CASH',
                            mobile_number : '09063387451'
                        }
                    },
                    success: function(response) {
                        console.log(response);
                    }
                });
            });
        </script>
    <?php endbuild()?>
<?php loadTo()?>