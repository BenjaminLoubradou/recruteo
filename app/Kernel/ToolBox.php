<?php


namespace App\Kernel;


class ToolBox
{
    /**
     * Extraire les données d'un formulaire
     * @param array $datas
     * @param array $fields
     * @return array $datas_clean
     */
    public static function extractDatasForm(array $datas, array $fields) {
        //$datas correspond à $_POST
        /*print_r($datas);
        $datas_keys = (array_keys($datas));
        print_r($datas_keys);
        print_r($fields);*/
        $diff = array_diff(array_keys($datas),$fields);
        // on vérifie les clés du tab $datas et on les compare à celles du tab $fields
        if(count($diff)>0){
            return false;
        }
//    die();
        $datas_clean = [];
//    print_r($datas);
        foreach($datas as $name => $value){
            if(!is_array($value)){
                if(!empty($value)) {
                    $datas_clean[$name] = trim($value);
                } else {
                    $datas_clean[$name] = null;
                }
            }else {
                if(count($value) == 1 && empty($value[0])){
                    $datas_clean[$name] = null;
                }else{
                    $datas_clean[$name] = $value;
                }
            }
        }
        return $datas_clean;
    }

// récupérer les données
    public static function getFlash(){
        // démarrage session
         session_start();
        $html = null;
        $color = isset($_SESSION['color']) ? $_SESSION['color'] : 'danger';
        if(isset($_SESSION['messages'])){
            $html  = '<div class="alert alert-'.$color.'">';
            foreach ($_SESSION['messages'] as $message){
                $html .= '<strong>';
                $html .= $message;
                $html .= '</strong><br>';
            }
            $html .= '</div>';
            //supprimer les messages de la session
            unset($_SESSION['messages']);
            unset($_SESSION['color']);
        }
        return $html;
    }
}