<?php 	
    namespace Chromatic\Widget;

    use Chromatic\Widget\WBase;

    require_once __DIR__.DIRECTORY_SEPARATOR.'WBase.php';

	class WLink extends WBase
	{	
		protected
			$href, $text ,
			$type;

		protected 
			$role = null,
			$icon = null,
			$isButton = false;



		public function __construct($href = null, $text = null , $type = null)
		{
			//set base as link
			parent::__construct( WBase::$LINK );

			$this->href = $href;
			$this->text = $text;
			$this->type = $type;
		}

		public function setHREF($href)
		{
			$this->href = $href;
		}

		public function setText($text)
		{
			$this->text = $text;
		}

		public function setType($type)
		{
			$this->type = $type;
		}


		public function setAttributes($attributes)
		{
			parent::buildAttributes($attributes);
		}


		public function setClass($class)
		{
			return parent::buildClass($class);
		}
		public function buildWidget()
		{
			$attributes = $this->getAttributes();
			$styles = $this->getStyles();
			$class = $this->getClass();
			
			// if($this->isButton)
			// 	$class .=' btn ';


			if($this->isButton)
				$class = $this->addClass("btn");
			$icon = $this->icon;

			$this->widget = <<<EOF
				<a href = '{$this->href}' {$this->role} {$class} {$styles} {$attributes}>
					{$this->icon}
					{$this->text}
				</a>
			EOF;
		}

		public function setIcon(WIcon $icon) 
		{
			$this->icon = $icon->getWidget();
		}


        public function setTheme($theme)
        {
            $this->theme = $theme;

            $class = $this->getClass();
            
            if(!empty($class)) {
                $class .= " {$theme} ";
            }else{
                $class = parent::buildClass($theme);
            }
		}
		
		public function isButton($boolean)
		{
			$this->isButton = $boolean;
		}

		public function getWidget()
		{
			$this->buildWidget();

			return $this->widget;
		}
	}