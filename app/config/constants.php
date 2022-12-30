<?php

    #################################################
	##             THIRD-PARTY APPS                ##
    #################################################

    define('DEFAULT_REPLY_TO' , '');

    const MAILER_AUTH = [
        'username' => 'main@e-waste.shop',
        'password' => '2.hd@AlJV7w;',
        'host'     => 'e-waste.shop',
        'name'     => 'e-waste',
        'replyTo'  => 'main@e-waste.shop',
        'replyToName' => 'main@e-waste.shop',
        'port' => '465'
    ];

    const THIRD_PARTY = [
        'paypal' => [
            'clientID' => 'AeTxGYye5QLyXZokGiE4hhND5GEeu3dxePRXiqa921Sv0z3fz3dWdOCfjF9ChHOd0ldZLq45zxp8f4B4',
            'secret' => 'EIVtrmYqTH-lX927ZuLCuX8IVVjQtqWA5YCMxxhaaTXVco9JkWwi0zuydpu5K2-9rCH-7yipPUtiZDhY'
        ]
    ];


    const ITEXMO = [
        'key' => '',
        'pwd' => ''
    ];

	#################################################
	##             SYSTEM CONFIG                ##
    #################################################


    define('GLOBALS' , APPROOT.DS.'classes/globals');

    define('SITE_NAME' , 'e-waste.pro');

    define('COMPANY_NAME' , 'E-WASTE');

    define('KEY_WORDS' , 'E-WASTE,ORDERING SYSTEM');


    define('DESCRIPTION' , '#############');

    define('AUTHOR' , SITE_NAME);

    define('APP_KEY' , 'E-WASTE-5175140471');


    define('ERROR_MESSAGE', '__SOMETHING WENT WRONG!__');
    
?>