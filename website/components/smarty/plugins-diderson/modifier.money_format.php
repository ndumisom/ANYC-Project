<?php
/**
 * Smarty plugin
 * @package Smarty
 * @subpackage plugins
 */


/**
 * Smarty string_format modifier plugin
 *
 * Type:     modifier<br>
 * Name:     string_format<br>
 * Purpose:  format strings via sprintf
 * @link http://smarty.php.net/manual/en/language.modifier.string.format.php
 *          string_format (Smarty online manual)
 * @author   Monte Ohrt <monte at ohrt dot com>
 * @param string
 * @param string
 * @return string
 */
function smarty_modifier_money_format( $number )
{
	//$format = "R %01.2f";
    //return sprintf($format, $number);
	
	//return number_format($number,2);
	
	return number_format($number, 2, '.', '');

}

/* vim: set expandtab: */

?>
