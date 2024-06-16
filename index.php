<?php
    @header ('Content-type: text/html; charset=utf-8');
    require_once(str_replace('//','/',dirname(__FILE__).'/') .'config/config.php');
    require_once(str_replace('//','/',dirname(__FILE__).'/') .'classes/Tema.php');
    require_once(str_replace('//','/',dirname(__FILE__).'/') .'classes/Core.php');
	require_once(str_replace('//','/',dirname(__FILE__).'/') .'classes/Seguranca.php');
    require_once(str_replace('//','/',dirname(__FILE__).'/') .'classes/Comp.php');
    require_once(str_replace('//','/',dirname(__FILE__).'/') .'classes/App.php');
	require_once(str_replace('//','/',dirname(__FILE__).'/') .'classes/Url.php');
    require_once(str_replace('//','/',dirname(__FILE__).'/') .'classes/Login.php');
    require_once(str_replace('//','/',dirname(__FILE__).'/') .'classes/Navegation.php');    
    require_once(str_replace('//','/',dirname(__FILE__).'/') .'lib/ckfinder/ckfinder.php');
    
  
	//Navegation
	global $navegation;
	if(!isset($navegation) && !isset($_SESSION["navegation"])){
		$navegation = new Navegation();
		$_SESSION["navegation"] = $navegation;
	}
	
	//Localiza tema
    Tema::selectTema();
	
    //Redirect HTTPS    
	$redirect = false;	
	if (isset($_SERVER['HTTP_CF_VISITOR'])) {			
		$scheme = $_SERVER['HTTP_CF_VISITOR'];
		$scheme = json_decode($scheme,true);	
		if ($scheme['scheme'] != $conf['server']['protocol']){
			$redirect = true;			
		}
	}
	if ($redirect){
		header("Location: {$conf['url']}{$_SERVER['REQUEST_URI']}");
	}
		
    $route = Core::getRequest('r');		
	
    if ($route == '') {
		//remove barra do início
		$route = substr($_SERVER['REQUEST_URI'],1);			
				
		//remove parametros url		
        $strstrRoute = strstr($route, '?',true);				
        if(!$strstrRoute){            
            $friendlyurl = Url::getModViewControl(Seguranca::antiSqlInjection($route));         			
        }else{        
            $friendlyurl = Url::getModViewControl(Seguranca::antiSqlInjection($strstrRoute));  
        }
		
        if (count($friendlyurl) > 0){  
            $_REQUEST['id'] = $friendlyurl['idObjeto'];            
            $route = $friendlyurl['view'].'/'.$friendlyurl['mod'].'/'.$friendlyurl['control'];  		
        }else{ 		
			$view = Core::getRequest('view');
			$mod = Core::getRequest('mod');
			$page = Core::getRequest('page');

			if ($view == '') {
				$view = 'front';
			}
			if ($mod == '') {
				$mod = 'site';
			}
			if ($page == '') {
				$page = 'index';
			}

			if ($page != '') {
				$route = $view . '/' . $mod . '/' . $page;
			}
		}
    }
    //var_dump($route);
    App::processRoute($route);
?>
