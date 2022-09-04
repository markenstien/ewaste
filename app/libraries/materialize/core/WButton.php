<?php   
    namespace Chromatic\Widget;
    
    use Chromatic\Widget\WLink;

    require_once __DIR__.DIRECTORY_SEPARATOR.'WLink.php';

    class WButton extends WLink
    {
        public function buildWidget()
        {
            $attributes = $this->getAttributes();
			$styles = $this->getStyles();
			$class = $this->getClass();

            if(!empty($class))
                $class .= 'btn';

			$icon = $this->icon;

			$this->widget = <<<EOF
				<a href = '{$this->href}' {$this->role} {$class} {$styles} {$attributes}>
					{$this->icon}
					{$this->text}
				</a>
			EOF;
        }
    }