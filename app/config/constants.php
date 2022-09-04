<?php

    #################################################
	##             THIRD-PARTY APPS                ##
    #################################################

    define('DEFAULT_REPLY_TO' , '');

    const MAILER_AUTH = [
        'username' => '#',
        'password' => '#',
        'host'     => '#',
        'name'     => '#',
        'replyTo'  => '#',
        'replyToName' => '#'
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