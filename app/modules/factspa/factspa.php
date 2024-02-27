<?php

if ( !defined( '_PS_VERSION_' ) )exit;class factspa extends Module{private $lang = 4;public function __construct(){$this->name = 'factspa';$this->tab = 'billing_invoicing';$this->author = 'PrestaMarketing™';$this->module_key = "ae88a688f6a4345b4cf2ae7ef47d421c";$this->version = '4.2';$this->ps_versions_compliancy = array('min' => '1.5', 'max' => _PS_VERSION_);parent::__construct();$this->displayName = $this->l('optimized invoice');$this->description = $this->l('Turn your invoice and delivery documents into elegant and custom ones with your favorite colours. Developed by prestaMarketing.com');}	
public function install(){Configuration::updateValue('FSPA_razonSocial','');Configuration::updateValue('FSPA_nombre','');Configuration::updateValue('FSPA_cif','');Configuration::updateValue('FSPA_domicilio','');Configuration::updateValue('FSPA_localidad','');Configuration::updateValue('FSPA_Provincia','');Configuration::updateValue('FSPA_Pais','');Configuration::updateValue('FSPA_telefono','');Configuration::updateValue('FSPA_fax','');Configuration::updateValue('FSPA_mail','');Configuration::updateValue('FSPA_otro','');Configuration::updateValue('FSPA_color','#000000');Configuration::UpdateValue('FSPA_textColor','#ffffff');Configuration::UpdateValue('FSPA_titleColor','#000000');Configuration::updateValue('FSPA_details',0);Configuration::updateValue('FSPA_showCarrier',0);require(_PS_MODULE_DIR_.'factspa/inc/a.php');return (parent::install());}
public function uninstall(){Configuration::deleteByName('FSPA_razonSocial');Configuration::deleteByName('FSPA_nombre');Configuration::deleteByName('FSPA_cif');Configuration::deleteByName('FSPA_domicilio');Configuration::deleteByName('FSPA_localidad');Configuration::deleteByName('FSPA_Provincia');Configuration::deleteByName('FSPA_telefono');Configuration::deleteByName('FSPA_Pais');Configuration::deleteByName('FSPA_fax');Configuration::deleteByName('FSPA_mail');Configuration::deleteByName('FSPA_otro');Configuration::deleteByName('FSPA_color');Configuration::deleteByName('FSPA_textColor');Configuration::deleteByName('FSPA_titleColor');Configuration::deleteByName('FSPA_details');Configuration::deleteByName('FSPA_showCarrier');require(_PS_MODULE_DIR_.'factspa/inc/b.php');return (parent::uninstall());}

public function getContent(){
	global $cookie;
	$output = '<h2>'.$this->displayName.' '.$this->version.'</h2>';
	/*if(Tools::isSubmit('activationCode')){ 
		require(_PS_MODULE_DIR_.'factspa/inc/o.php');
	}
	else*/
	if (isset($_POST['FSPAsubmitUpdate'])) {
		Configuration::updateValue('FSPA_razonSocial',  $_POST['razonSocial']);
		Configuration::updateValue('FSPA_nombre', $_POST['nombre']);	
		Configuration::updateValue('FSPA_cif', $_POST['cif']);	
		Configuration::updateValue('FSPA_domicilio',  $_POST['domicilio']);	
		Configuration::updateValue('FSPA_localidad', $_POST['localidad']);	
		Configuration::updateValue('FSPA_Provincia', $_POST['provincia']);	
		Configuration::updateValue('FSPA_telefono', $_POST['telefono']);
		Configuration::updateValue('FSPA_Pais', $_POST['pais']);
		Configuration::updateValue('FSPA_fax', $_POST['fax']);
		Configuration::updateValue('FSPA_mail', $_POST['mail']);
		Configuration::updateValue('FSPA_otro', $_POST['otro']);
		Configuration::updateValue('FSPA_color', $_POST['color']);
		Configuration::updateValue('FSPA_textColor',$_POST['colorText']);
		Configuration::updateValue('FSPA_titleColor',$_POST['colorTitle']);
		Configuration::updateValue('FSPA_details',(int) $_POST['detalles']);
		Configuration::updateValue('FSPA_showCarrier',(int) $_POST['showCarrier']);	
		$output = $this->displayConfirmation($this->l('Configure Saved'));
	}
	$output = '';
	/*if(Configuration::get('PMKT_licence_FSPA') == '')	
		$output .=  $output.$this->formActivacion();
	else {*/
		$output .= $this->config();
	/*}*/
	return $output;
}	
public function formActivacion()
	{	
		$default_lang = (int)Configuration::get('PS_LANG_DEFAULT');
		
		$fields_form[0]['form'] = array(
			'legend' => array(
				'title' => $this->l('Module activation'),
			),
			'input' => array(
				array(
					'type' => 'text',
					'label' => $this->l('Code'),
					'name' => 'activationCode',
					'desc' => $this->l('leave this field empty in localhost'),
					'size' => 40,
					'required' => true
				),
				
			),
			'submit' => array(
				'title' => $this->l('Send'),
				'class' => 'button'
			)
		);
		 
$helper = new HelperForm();$helper->module = $this;$helper->name_controller = $this->name;$helper->token = Tools::getAdminTokenLite('AdminModules');
$helper->currentIndex = AdminController::$currentIndex.'&configure='.$this->name;$helper->default_form_language = $default_lang;$helper->allow_employee_form_lang = $default_lang;
$helper->title = $this->displayName;$helper->show_toolbar = true;$helper->toolbar_scroll = true;$helper->submit_action = 'submit'.$this->name;
$helper->toolbar_btn = array(
	'save' =>
	array(
		'desc' => $this->l('Save'),
		'href' => AdminController::$currentIndex.'&configure='.$this->name.'&save'.$this->name.
		'&token='.Tools::getAdminTokenLite('AdminModules'),
	),
	'back' => array(
		'href' => AdminController::$currentIndex.'&token='.Tools::getAdminTokenLite('AdminModules'),
		'desc' => $this->l('Back to list')
	)
);		 
return $helper->generateForm($fields_form);
	}
	private function escribirArchivos($origen, $destino, $extension){$path = _PS_ROOT_DIR_ .$origen;$dir = dir($path);while( ( $file = $dir->read() ) !== false ) if( is_file( $path .'/'. $file ) and preg_match( '/^(.+)\.'.$extension.'$/i' , $file ) ){$texto = "";$fichero = fopen($path.'/'.$file,'r');while ($trozo = fgets($fichero, 1024)){$texto .= $trozo;}if ($file != 'HTMLTemplateInvoice.php'){$xmlFile = $destino.$file;$xmlHandle = fopen($xmlFile, "w");fwrite($xmlHandle, $texto);fclose($xmlHandle);}}$dir->close();}
	private function config()
	{
		$output = '';
		$output.= '<form method="post" action="'.$_SERVER['REQUEST_URI'].'" enctype="multipart/form-data">
			<fieldset style="width: 800px;">
    				<div id="items">';

			$output .= '<script type="text/javascript" src="../modules/factspa/js/ColourPicker.js"></script>';
 	 		$output .= '<script type="text/javascript" src="../modules/factspa/js/Colour.js"></script>';
 	 		$output .= '<script type="text/javascript" src="../modules/factspa/js/initcolor.js"></script>';
					
		
			$output .= '<label>'.$this->l('Company Name').'</label>';
			$output .= '<div class="margin-form" style="padding-left:0">';
			$output .= '<input type="text" name="razonSocial" style="width:500px;" id="razónSocial" size="12" maxlength="400" value="'.Configuration::get('FSPA_razonSocial').'" />';
			$output .= '</div>';
			
			//-----------------------------------------------------
			
			$output .= '<label>'.$this->l('Name').'</label>';
			$output .= '<div class="margin-form" style="padding-left:0">';
			$output .= '<input type="text" name="nombre" style="width:500px;" id="nombre" size="12" maxlength="400" value="'.Configuration::get('FSPA_nombre').'" />';
			$output .= '</div>';
			
			//-----------------------------------------------------
			
			$output .= '<label>'.$this->l('VAT number').'</label>';
			$output .= '<div class="margin-form" style="padding-left:0">';
			$output .= '<input type="text" name="cif" style="width:100px;;" id="cif" size="50" maxlength="20" value="'.Configuration::get('FSPA_cif').'" />';
			$output .= '</div>';
			
			//-----------------------------------------------------
			
			$output .= '<label>'.$this->l('Social Address').'</label>';
			$output .= '<div class="margin-form" style="padding-left:0">';
			$output .= '<input type="text" name="domicilio" style="width:500px;" id="domicilio" size="12" maxlength="400" value="'.Configuration::get('FSPA_domicilio').'" />';
			$output .= '</div>';
			
			//-----------------------------------------------------
			
			$output .= '<label>'.$this->l('City').'</label>';
			$output .= '<div class="margin-form" style="padding-left:0">';
			$output .= '<input type="text" name="localidad" style="width:500px;" id="localidad" size="12" maxlength="400" value="'.Configuration::get('FSPA_localidad').'" />';
			$output .= '</div>';
			
			//-----------------------------------------------------
			
			$output .= '<label>'.$this->l('State').'</label>';
			$output .= '<div class="margin-form" style="padding-left:0">';
			$output .= '<input type="text" name="provincia" style="width:500px;" id="provincia" size="12" maxlength="400" value="'.Configuration::get('FSPA_Provincia').'" />';
			$output .= '</div>';

			//-----------------------------------------------------
			
			$output .= '<label>'.$this->l('Country').'</label>';
			$output .= '<div class="margin-form" style="padding-left:0">';
			$output .= '<input type="text" name="pais" style="width:500px;" id="pais" size="12" maxlength="400" value="'.Configuration::get('FSPA_Pais').'" />';
			$output .= '</div>';
			
			//-----------------------------------------------------
			
			$output .= '<label>'.$this->l('Phone').'</label>';
			$output .= '<div class="margin-form" style="padding-left:0">';
			$output .= '<input type="text" name="telefono" style="width:150px;" id="telefono" size="12" maxlength="15" value="'.Configuration::get('FSPA_telefono').'" />';
			$output .= '</div>';
			
			//-----------------------------------------------------
			
			$output .= '<label>'.$this->l('Fax').'</label>';
			$output .= '<div class="margin-form" style="padding-left:0">';
			$output .= '<input type="text" name="fax" style="width:150px;" id="fax" size="12" maxlength="15" value="'.Configuration::get('FSPA_fax').'" />';
			$output .= '</div>';
			
			//-----------------------------------------------------
			
			$output .= '<label>'.$this->l('mail').'</label>';
			$output .= '<div class="margin-form" style="padding-left:0">';
			$output .= '<input type="text" name="mail" style="width:500px;" id="mail" size="12" maxlength="400" value="'.Configuration::get('FSPA_mail').'" />';
			$output .= '</div>';
			
			//-----------------------------------------------------
			
			$output .= '<label>'.$this->l('Other interesting information').'</label>';
			$output .= '<div class="margin-form" style="padding-left:0">';
			$output .= '<input type="text" name="otro" style="width:500px;" id="otro" size="12" maxlength="400" value="'.Configuration::get('FSPA_otro').'" />';
			$output .= '</div>';	
			
			//-----------------------------------------------------
			
			$modo = Configuration::get('FSPA_details');
			$modo_detallesNO = '';
			$modo_detallesSI ='';
			if($modo == '1')
				$modo_detallesSI = 'selected';
			else
				$modo_detallesNO = 'selected';
			
			$output .= '<label>'.$this->l('Show full details on invoice rows?').'</label><br>';
			$output .= '<div class="margin-form" style="padding-left:0">';
			$output .= '<select name="detalles" id="detalles" style="width:50px;"><option value="0" '.$modo_detallesNO.'>'.$this->l('No').'</option><option value="1" '.$modo_detallesSI.'>'.$this->l('Yes').'</option></select>';
			$output .= '</div>';

			//-----------------------------------------------------
			
			$modo = Configuration::get('FSPA_showCarrier');
			$modo_detallesNO = '';
			$modo_detallesSI ='';
			if($modo == '1')
				$modo_detallesSI = 'selected';
			else
				$modo_detallesNO = 'selected';
			
			$output .= '<label>'.$this->l('Show shipping cost on invoice total?').'</label><br>';
			$output .= '<div class="margin-form" style="padding-left:0">';
			$output .= '<select name="showCarrier" id="showCarrier" style="width:50px;"><option value="0" '.$modo_detallesNO.'>'.$this->l('No').'</option><option value="1" '.$modo_detallesSI.'>'.$this->l('Yes').'</option></select>';
			$output .= '</div>';
			
			
			//-----------------------------------------------------
			
			$output .= '<label>'.$this->l('Background colour').'</label><br>';
			$output .= '<div class="margin-form" style="padding-left:0">';
			if (Configuration::get('FSPA_color'))
				$output .= '<input type="hidden" name="color" style="width:100px;" id="color" size="12" maxlength="7" value="'.Configuration::get('FSPA_color').'"  />';
			else
				$output .= '<input type="hidden" name="color" style="width:100px;" id="color" size="12" maxlength="7" value="#000000"  />';
			$output .= '</div>';

			$output .= '<div id="colourPicker" style="margin-left:250px;"></div><br>';

			
			//-----------------------------------------------------
			
			$output .= '<label>'.$this->l('Text colour').'</label><br>';
			$output .= '<div class="margin-form" style="padding-left:0">';
			if (Configuration::get('FSPA_textColor'))
				$output .= '<input type="hidden" name="colorText" style="width:100px;" id="colorText" size="12" maxlength="7" value="'.Configuration::get('FSPA_textColor').'"  />';
			else
				$output .= '<input type="hidden" name="colorText" style="width:100px;" id="colorText" size="12" maxlength="7" value="#ffffff"  />';
			$output .= '</div>';

			$output .= '<div id="colourPicker01" style="margin-left:250px;"></div><br>';

			//-----------------------------------------------------
			
			$output .= '<label>'.$this->l('Title colour').'</label><br>';
			$output .= '<div class="margin-form" style="padding-left:0">';
			if (Configuration::get('FSPA_titleColor'))
				$output .= '<input type="hidden" name="colorTitle" style="width:100px;" id="colorTitle" size="12" maxlength="7" value="'.Configuration::get('FSPA_titleColor').'"  />';
			else
				$output .= '<input type="hidden" name="colorTitle" style="width:100px;" id="colorTitle" size="12" maxlength="7" value="#000000"  />';
			$output .= '</div>';

			$output .= '<div id="colourPicker02" style="margin-left:250px;"></div><br>';

			 	 	
 	 		$output .= '
					<div class="margin-form">
					 <input type="submit" name="FSPAsubmitUpdate" id="FSPAsubmitUpdate" value="'.$this->l('Save').'" class="button" />
				</div>
				</div>
				</fieldset>
			</form>';

			return $output;
	}
	
}
?>