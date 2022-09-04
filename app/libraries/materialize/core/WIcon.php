<?php 	
    namespace Chromatic\Widget;
    
	class WIcon extends WBase
	{	

		public static $instance = null;

		public function __construct()
		{
			parent::__construct(WBase::$ICON);
		}


		public static function getInstance($icon)
		{
			if( is_null(self::$instance))
				self::$instance = new WIcon;

			self::$instance->setIcon($icon);

			return self::$instance;
		}

		public function setIcon($icon)
		{
			$this->icon = $icon;
		}

		public function setColor($color)
		{
			$this->color = $color;
		}

		public function setBackground($background)
		{
			$this->background = $background;
		}

		public function setTheme($theme)
		{
			$this->theme = $theme;
		}

		public function getWidget()
		{
			$this->buildWidget();
			return $this->widget;
		}

		public function buildWidget()
		{
			$this->widget = <<<EOF
				<i class="{$this->icon}"></i>
			EOF;
		}
	}