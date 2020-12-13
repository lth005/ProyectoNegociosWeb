<?php
/**
 * PHP Version 7
 * Controlador de Paypal
 *
 * @category Controllers_Paypal
 * @package  Controllers\Paypal
 * @author   Orlando J Betancourth <orlando.betancourth@gmail.com>
 * @license  Comercial http://
 *
 * @version CVS:1.0.0
 *
 * @link http://url.com
 */
 // Sección de requires
require_once 'vendor/autoload.php';

/**
 * Retorna el Api Context de Paypal
 *
 * @return void
 */
function getApiContext()
{
    $apiContext = new \PayPal\Rest\ApiContext(
        new \PayPal\Auth\OAuthTokenCredential(
            "Aacvjc2ZimmcDsmuPnUnByzNbTkAd9K7VnlYXc1ZO3v_obzRNYgaNBUWsDo6_p7ijvjjWywZNkCJaLoZ",
            "EAckgfxM5I3MKGjG7jFsx7YkYvyPS19VfrNdDGSBeqSBFuLuM2geBUW4MGZxBoxzKiiTwZ9VkknUhcIt"
        )
    );
    return $apiContext;
}
