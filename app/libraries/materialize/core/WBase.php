<?php 
	namespace Chromatic\Widget;

	class WBase
	{
		protected $class = null;

		protected $id = null;

		protected $attributes = null;

		protected $style = null;

		protected $widgetType = null;

		protected $errors = [];

		public function __construct($widgetType)
		{
			//check type
			$validWidgetType = [
				self::$LINK , 
				self::$BUTTON,
				self::$SPAN,
				self::$ICON
			];


			if( ! _wIsEqual($widgetType , $validWidgetType) )
				die("Invalid Widget Type {$widgetType}");

			$this->widgetType = $widgetType;
		}

		final protected function buildId($id)
		{

			$value = $this->wrapValue($id);

			$this->id = " id = {$value}";

			return $this->id;
		}

		final protected function getId()
		{
			return $this->id;
		}

		protected function buildClass($class)
		{
			$this->class = $class;

			return $this->class;
		}

		protected function getClass()
		{
			return "class = '{$this->class}'";
		}

		protected function addClass($class){
			$this->class .= ' '.$class.' ';

			return $this->getClass();
		}

		final protected function buildStyle($styles)
		{
			$styleString = '';

			if(empty($styles) || is_null($styles))
				return '';

			foreach($styles as $styleKey => $style){
				$styleString .= " {$styleKey}:{$style}; ";
			}

			$this->style = " style = '{$styleString}' ";

			return $this->style;
		}

		final public function getStyles()
		{
			return $this->style;
		}

		final protected function buildAttributes($attributes)
		{

			if(! is_array($attributes)){
				$this->addError("Attributes must be a type of array");
				return false;
			}
			$attributesString = '';

			foreach($attributes as $attrKey => $attrItems) 
			{		
				/*
				*if attribute key is data or meta
				*the values of it must be also an associative array
				*/
				if( _wIsEqual($attrKey, ['data' ,'meta']))
				{
					$attrPrefix = $attrKey;
					foreach($attrItems as $itemKey => $item) 
					{
						$itemContent = $this->wrapValue($item);

						$attributesString .= " {$attrPrefix}-{$itemKey}={$itemContent}";
					}
				}else
				{
					//check for the following
					if( _wIsEqual($attrKey , 'style')) {
						$attributesString .= $this->buildStyle( $attributes[$attrKey] );
						continue;
					}

					if( _wIsEqual($attrKey , 'class')) {
						$attributesString .= $this->addClass( $attributes[$attrKey] );
						continue;
					}

					if(_wIsEqual($attrKey , 'id')) {
						$attributesString .= $this->buildId( $attributes[$attrKey] );
						continue;
					}

					$content = $this->wrapValue($attrItems);

					$attributesString .= "{$attrKey}={$content}";
				}
			}


			$this->attributes = $attributesString;

			return $this->attributes;
		}

		final protected function getAttributes()
		{
			return $this->attributes;
		}

		final protected function addError($error)
		{
			$this->errors [] = $error;
		}

		final protected function wrapValue($value)
		{	
			return is_numeric($value) ? $value : " '{$value}' ";
		}

		public function getErrors()
		{
			return $this->errors;
		}

		public function getErrorString()
		{
			return implode(',' , $this->errors);
		}

		//focus on link
		public static $LINK = 'link';

		public static $SPAN = 'span';

		public static $BUTTON = 'button';
		public static $ICON = 'icon';

	}