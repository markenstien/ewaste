<?php   
    use Chromatic\Widget\WBase;
    use Chromatic\Widget\WLink;
    use Chromatic\Widget\WIcon;
    use Chromatic\Widget\WButton;

    /**
     * WIDGET LOADERS
     */

     ###LINKS####

    function wLink($href , $text = '' , $dataParameters = null)
    {
        $wLink = new WLink();

        $wLink->setHREF($href);
        $wLink->setText($text);

        if( isset($dataParameters['class']))
            $wLink->setClass($dataParameters['class']);

        if( isset($dataParameters['attributes']))
            $wLink->setAttributes($dataParameters['attributes']);

        if( isset($dataParameters['icon']) )
            $wLink->setIcon( WIcon::getInstance($dataParameters['icon']));

        if( isset($dataParameters['isButton']))
            $wLink->isButton($dataParameters['isButton']);

        return $wLink->getWidget();
    }

    function wBtn($href , $text = '', $dataAttributes = null)
    {   
        $dataAttributes['isButton'] = true;
        return wLink($href , $text , $dataAttributes);
    }

    function wBtnApprove($href , $text , $dataAttributes = null)
    {   
        if(is_null($dataAttributes))
            $dataAttributes = [];

        $size = $dataAttributes['size'] ?? '';

        $dataAttributes['class'] = ' btn-primary ' . $size;
        
        return wBtn($href , $text , $dataAttributes);
    }

    function wBtnCancel($href , $text , $dataAttributes = null)
    {   
        if(is_null($dataAttributes))
            $dataAttributes = [];

        $size = $dataAttributes['size'] ?? '';

        $dataAttributes['class'] = 'btn-danger '.$size;

        $dataAttributes['style'] = [
            'font-weight' => 'bold'
        ];

        $dataAttributes['attributes']  = [
            'data' => [
                'id' => 123456,
                'role' => 'button-nigga'
            ],
        ];
        return wBtn($href , $text , $dataAttributes);
    }