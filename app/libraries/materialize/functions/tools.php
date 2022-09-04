<?php   

    function _wIsEqual($subject , $toMatch)
    {
        $subject = strtolower(trim($subject));

        if(is_array($toMatch))
        return in_array($subject , array_map('strtolower', $toMatch));
        return $subject === strtolower(trim($toMatch));
    }