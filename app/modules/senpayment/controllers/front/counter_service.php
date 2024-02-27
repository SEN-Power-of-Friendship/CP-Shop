<?php
require_once("lib/PromptPayQR.php");

class senpaymentcounter_serviceModuleFrontController extends ModuleFrontController
{

    public function init()
    {
        parent::init();
        if(!$this->module->active)
        {
            Tools::redirect($this->context->link->getPageLink('order'));
        }
    }
    
    public function initContent()
    {
        include "src/BarcodeGenerator.php";
        include "src/BarcodeGeneratorHTML.php";
        
        $code = sprintf("%012d", mt_rand(0, 999999999999)); //รหัส Barcode ที่ต้องการสร้าง

        $generator = new Picqer\Barcode\BarcodeGeneratorHTML();
        $border = 2;
        $height = 50;
        
        $barcode = $generator->getBarcode($code , $generator::TYPE_EAN_13,$border,$height);
        
        $cart = $this->context->cart;
        $total = (float)$cart->getOrderTotal(true, Cart::BOTH);
        
        parent::initContent();
        $this->context->smarty->assign([
            'ERROR' => Configuration::get('ERROR'),
            'BARCODE_GENERATE' => $barcode,
            'BARCODE_NUMBER' => $code,
            'CURRENT_DATE' => date("d"),
            'CURRENT_MONTH' => date("m"),
            'CURRENT_YEAR' => date("y"),
            'PRICE' => $total
        ]);
        $this->setTemplate('module:senpayment/views/templates/front/counter_service.tpl');
    }
    
    public function setMedia()
    {
        parent::setMedia();
    }
    
    public function postProcess()
    {
        parent::postProcess();
        if(Tools::isSubmit('placeorder')){
            $file = $_FILES['slip_upload'];
            $ext = substr($file['name'], strrpos($file['name'], '.') + 1);
            $file_name = md5($file['name']) . '.' . $ext;
            move_uploaded_file($file['tmp_name'], dirname(__FILE__) . DIRECTORY_SEPARATOR . 'slips' . DIRECTORY_SEPARATOR . $file_name);

            if(!(!isset($file) || $file['name'] == "" || $file['full_path'] == "" || $file['type'] == "" || $file['tmp_name'] == "" || $file['error'] == 4 || $file['size'] == 0))
            {
        Configuration::updateValue("ERROR", null);
                $cart = $this->context->cart;
                $total = (float)$cart->getOrderTotal(true, Cart::BOTH);
                $customer = new Customer($cart->id_customer);
                $this->module->validateOrder($cart->id,Configuration::get('PS_OS_PAYMENT'), $total, $this->module->displayName, null, array(), $this->context->currency->id, false, $customer->secure_key);
                Tools::redirect($this->context->link->getPageLink('order-confirmation', Configuration::get('PS_SSL_ENABLED'), $this->context->language->id, 'id_cart='.$cart->id.'&id_module='.$this->module->id.'&id_order='.$this->module->currentOrder.'&key='.$customer->secure_key));
            }else{
                Configuration::updateValue("ERROR", "Please upload slip naja.");
            }
        }
    }
}
