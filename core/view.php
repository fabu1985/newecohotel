<?php 

class View{
    public static function parse($viewName, $data=array()){
        $data["link"] = LINK;
        $data["CSS"] = CSS;
        $data["JS"] = JS;
        if($_SESSION['usertype'] != 'admin'){
           $data["hideAdminOptions"] = 'display: none;';
        }
        else {
            $data["hideAdminOptions"] = '';
        }
        $view = file_get_contents("view/header.tpl");
        $footer = file_get_contents("view/footer.tpl");
        $view .= file_get_contents("view/".$viewName.".tpl");
        $view .= $footer;
        $view = View::_parse($view, $data);
        header('Content-Type: text/html; charset=UTF-8');
        echo $view;
    }

    public static function _parse($view, $data){
        foreach ($data as $key => $value) { 
            $subSearch = array();
            $subValue = array();
            if (is_array($value)){
                // If value is an array, check if the key is a list
                if (stripos($view, "[".$key."]")!==false){
                    //If it is a list, then iterate over the view 
                    $view = View::iterate($view, $key, $value);
                }else{
                    foreach ($value as $subkey => $subvalue) {
                        if (is_array($subvalue)){

                        }else{
                            $search[] = "{".$subkey."}";
                            $replace[] = $subvalue;
                        }
                    }
                }
            }else{
                $search[] = "{".$key."}";
                $replace[] = $value;
            }
        }
        //Parse the View with the values
        $view = str_replace($search, $replace, $view);
        //Remove not parsed Html labels
        $view = preg_replace('#\{([a-z0-9\-_]*?)\}#is', "", $view);
        $view = preg_replace('#\[([a-z0-9\-_]*?)\]#is', "", $view);
        return ($view);
    }

    public static function iterate ($view, $key, $value){
    //divide the view in 3 parts, before, the element to iterate, and after
        $subView = explode("[".$key."]", $view);
        $before = $subView[0];
        $iterate = $subView[1];
        $after = $subView[2];
        $list = "";
        foreach ($value as $subkey => $subvalue) {
            //Create 2 arrays and reset them at each iteration
            $subSearch = array();
            $subValue = array();
            if (is_array($subvalue)){
                if (stripos($iterate, "[".$subkey."]")!==false){
                    $iterate = View::iterate($iterate, $subkey, $subvalue);
                }
                else{
                    foreach ($subvalue as $subkey2 => $subvalue2) {
                        //Fill the arrays with the DB Result information
                        $subSearch[] = "{".$subkey2."}";
                        $subValue[] = $subvalue2;
                    }
                    //Reeplace the actual iteration with this cicle information
                    $subList = str_replace($subSearch, $subValue, $iterate);
                    //Create the list with the iteration elements
                    $list .= $subList;
                }
            }
            else{
                $search[] = "{".$subkey."}";
                $replace[] = $subvalue;
            }
        }
        //Recreate the complete view with the list created :D
        $view = $before.$list.$after;
        return $view;    
    }
    
}


 ?>