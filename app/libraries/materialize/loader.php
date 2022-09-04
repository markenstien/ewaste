<?php   

    use Chromatic\Widget\WBase;
    use Chromatic\Widget\WLink;
    use Chromatic\Widget\WIcon;

    require_once __DIR__.DIRECTORY_SEPARATOR.'constants.php';
    
    require_once __DIR__.DIRECTORY_SEPARATOR.'functions/tools.php';


    require_once __DIR__.DIRECTORY_SEPARATOR.'core/WBase.php';
    require_once __DIR__.DIRECTORY_SEPARATOR.'core/WLink.php';
    require_once __DIR__.DIRECTORY_SEPARATOR.'core/WIcon.php';
    require_once __DIR__.DIRECTORY_SEPARATOR.'core/WButton.php';

    require_once __DIR__.DIRECTORY_SEPARATOR.'functions/widget.php';


    echo wBtnApprove('transactions' , 'go to transactions');