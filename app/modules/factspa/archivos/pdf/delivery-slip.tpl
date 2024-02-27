{*
*  @author PrestaShop SA 
*  @copyright  2007-2012 PrestaShop SA
*  @version  Release: $Revision: 6753 $
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  @modified: PrestaMarketing.com 2013
*  International Registered Trademark & Property of PrestaShop SA
*}
<!-- CABECERA -->
<table style="width: 100%; height: 120px;">
	<tr>
		<td colspan="5">
			<div style="line-height: 4pt">&nbsp;</div>
		</td>
	</tr>

	<tr>
		<td style="width:33%">

	        <table style="vertical-align: bottom">

	      		{if Configuration::get('FSPA_razonSocial')}<tr> <td style="font-size: 7pt; font-weight: normal; background-color: {if Configuration::get('FSPA_color')}{Configuration::get('FSPA_color')}{else}#000000{/if}; color: {Configuration::get('FSPA_textColor')}; text-align:left">{Configuration::get('FSPA_razonSocial')}</td></tr>{/if}

				{if Configuration::get('FSPA_nombre')}<tr> <td style="font-size: 7pt; font-weight: normal; background-color: {if Configuration::get('FSPA_color')}{Configuration::get('FSPA_color')}{else}#000000{/if}; color: {Configuration::get('FSPA_textColor')}; text-align:left">{Configuration::get('FSPA_nombre')}</td></tr>{/if}

				{if Configuration::get('FSPA_cif')}<tr> <td style="font-size: 7pt; font-weight: normal; background-color: {if Configuration::get('FSPA_color')}{Configuration::get('FSPA_color')}{else}#000000{/if}; color: {Configuration::get('FSPA_textColor')}; text-align:left">{Configuration::get('FSPA_cif')}</td></tr>{/if}

				{if Configuration::get('FSPA_domicilio')}<tr> <td style="font-size: 7pt; font-weight: normal; background-color: {if Configuration::get('FSPA_color')}{Configuration::get('FSPA_color')}{else}#000000{/if}; color: {Configuration::get('FSPA_textColor')}; text-align:left">{Configuration::get('FSPA_domicilio')}</td></tr>{/if}

				{if Configuration::get('FSPA_localidad') || Configuration::get('FSPA_Provincia')}<tr> <td style="font-size: 7pt; font-weight: normal; background-color: {if Configuration::get('FSPA_color')}{Configuration::get('FSPA_color')}{else}#000000{/if}; color: {Configuration::get('FSPA_textColor')}; text-align:left">{Configuration::get('FSPA_localidad')} - {Configuration::get('FSPA_Provincia')}</td></tr>{/if}

				{if Configuration::get('FSPA_Pais')}<tr> <td style="font-size: 7pt; font-weight: normal; background-color: {if Configuration::get('FSPA_color')}{Configuration::get('FSPA_color')}{else}#000000{/if}; color: {Configuration::get('FSPA_textColor')}; text-align:left">{Configuration::get('FSPA_Pais')}</td></tr>{/if}

				{if Configuration::get('FSPA_telefono') || Configuration::get('FSPA_fax')}<tr> <td style="font-size: 7pt; font-weight: normal; background-color: {if Configuration::get('FSPA_color')}{Configuration::get('FSPA_color')}{else}#000000{/if}; color: {Configuration::get('FSPA_textColor')}; text-align:left">Tfn: {Configuration::get('FSPA_telefono')} - Fax: {Configuration::get('FSPA_fax')}</td></tr>{/if}

				{if Configuration::get('FSPA_mail')}<tr> <td style="font-size: 7pt; font-weight: normal; background-color: {if Configuration::get('FSPA_color')}{Configuration::get('FSPA_color')}{else}#000000{/if}; color: {Configuration::get('FSPA_textColor')}; text-align:left">{Configuration::get('FSPA_mail')}</td></tr>{/if}

				{if Configuration::get('FSPA_otro')}<tr> <td style="font-size: 7pt; font-weight: normal; background-color: {if Configuration::get('FSPA_color')}{Configuration::get('FSPA_color')}{else}#000000{/if}; color: {Configuration::get('FSPA_textColor')}; text-align:left">{Configuration::get('FSPA_otro')}</td></tr>{/if}

			</table>
		</td>

		<td style="width:34%; position:relative">
			{if $logo_path}
		  		<img align="left" src="{$logo_path}" />
			{/if}              
        </td>    
    
		<td style="width: 33%;  text-align: right; vertical-align: middle; padding-left: 15pt">
			<table>

				<tr>
					<td style="font-size: 14pt; font-weight: bold; color: {if Configuration::get('FSPA_color')}{Configuration::get('FSPA_color')}{else}#000000{/if}; text-align: right;">{l s='Delivery slip' pdf='true'}</td>
				</tr>
	        					
				<tr>
					<td style="font-size: 11pt; font-weight: bold; color: {if Configuration::get('FSPA_color')}{Configuration::get('FSPA_color')}{else}#000000{/if}; text-align: right;">{l s='Número' pdf='true'} {$title|escape:'htmlall':'UTF-8'}</td>
				</tr>
	            
	            <tr>
					<td style="font-size: 10pt; font-weight: normal; color: {if Configuration::get('FSPA_color')}{Configuration::get('FSPA_color')}{else}#000000{/if}; text-align: right;">{l s='Fecha' pdf='true'}: {$date}</td>
				</tr>
	            
			</table>
		</td>
	</tr>
</table>
<!-- /CABECERA -->

<div style="line-height: 1px">&nbsp;</div>

<!-- ADDRESSES -->
<table style="width: 100%">
	<tr>
		<td width="80%" style="width: 80%">
	    	<table style="width: 100%">
				<tr>
					<td style="width: 50%">
						<table style="width: 100%" >
                            <tr style="width: 50%; background-color: {if Configuration::get('FSPA_color')}{Configuration::get('FSPA_color')}{else}#000000{/if}; line-height: 1.5pt; font-weight: normal; font-size: 11pt; color: {Configuration::get('FSPA_textColor')}">
                                 <td style="padding-top: 7pt; padding-bottom: 7pt; padding-left: 5pt">{l s='Dirección de envío' pdf='true'}</td>
                            </tr>
                            <tr style="width: 50%;">
                                 <td style="padding-top: 10pt; padding-bottom: 10pt; padding-left: 5pt; font-size: 10pt; color:#404040">{$delivery_address}</td>
                             </tr>
                        </table>
                    </td>
                    {if !empty($invoice_address)}
                        <td style="width: 50%">
                        	<table style="width: 100%" >
                           		<tr style="width: 50%; background-color: {if Configuration::get('FSPA_color')}{Configuration::get('FSPA_color')}{else}#000000{/if}; line-height: 1.5pt; font-weight: normal; font-size: 11pt; color: {Configuration::get('FSPA_textColor')}">
                             		<td style="padding-top: 7pt; padding-bottom: 7pt; padding-left: 5pt">{l s='Dirección de facturación' pdf='true'}</td>
                                </tr>
                           		<tr style="width: 50%;">
                             		<td style="padding-top: 10pt; padding-bottom: 10pt; padding-left: 5pt; font-size: 10pt; color:#404040">{$invoice_address}</td>
                           		</tr>
                        	 </table>
                       	</td>
                    {/if}
				</tr>
		  	</table>	
		</td>
	</tr>
</table>
<!-- / ADDRESSES -->

<table>
	<tr><td style="line-height: 8px">&nbsp;</td></tr>
</table>

<!-- PRODUCTS TAB -->
<table style="width: 100%">
	<tr>
		<td style="text-align: right">
			<table style="width: 100%">
				<tr style="line-height:6px; font-size:10pt">
					<td style="background-color: {if Configuration::get('FSPA_color')}{Configuration::get('FSPA_color')}{else}#000000{/if}; color: {Configuration::get('FSPA_textColor')}; text-align: left; font-weight: thin; width: 25%">{l s='REFERENCE' pdf='true'}</td>
					<td style="background-color: {if Configuration::get('FSPA_color')}{Configuration::get('FSPA_color')}{else}#000000{/if}; color: {Configuration::get('FSPA_textColor')}; text-align: left; font-weight: thin; width: 15%">{l s='QTY' pdf='true'}</td>
                   	<td style="text-align: left; background-color: {if Configuration::get('FSPA_color')}{Configuration::get('FSPA_color')}{else}#000000{/if}; color: {Configuration::get('FSPA_textColor')}; padding-left: 10px; font-weight: thin; width: 60%">{l s='ITEMS TO BE DELIVERED' pdf='true'}</td>
				</tr>
				{foreach $order_details as $product}
					{cycle values='#FFF,#DDD' assign=bgcolor}
					<tr style="line-height:6px;background-color:{$bgcolor};">
						<td style="text-align: left; width: 25%">
							{if empty($product.product_reference)}
								---
							{else}
								{$product.product_reference}
							{/if}
						</td>
						<td style="text-align: left; width: 15%">{$product.product_quantity}</td>
	                    <td style="text-align: left; width: 60%">{$product.product_name}</td>
					</tr>
				{/foreach}
			</table>
		</td>
	</tr>
</table>
<!-- / PRODUCTS TAB -->

<table>
	<tr style="border-collapse:separate; border-spacing: 4.5pt; font-size:10pt; color:#404040; line-height:2pt">
		<td style="width:100%; text-align:right">{l s='Transportista' pdf='true'}:   {$order_invoice->getCarrier($order_invoice->id)->name}
		</td>
	</tr>
</table>

<!-- MENSAJES -->
<div style="font-size: 12pt; font-weight:thin; text-align:left; background-color: {if Configuration::get('FSPA_color')}{Configuration::get('FSPA_color')}{else}#000000{/if}; color: {Configuration::get('FSPA_textColor')}; width:40%; padding-left:2pt">{l s='Mensaje del cliente' pdf='true'} &nbsp;</div>

<table style="width: 100%">
	{foreach Message::getMessagesByOrderId($order->id, true) as $mensaje}
	{cycle values='#FFF,#DDD' assign=bgcolor}
	    <tr style="line-height:6px;">
			<td style="text-align: center;  padding-left: 10px;  color: {if Configuration::get('FSPA_color')}{Configuration::get('FSPA_color')}{else}#000000{/if}; font-weight: thin; width: 15%">{$mensaje.date_add|date_format:"%D"}</td>
			<td style="color: {if Configuration::get('FSPA_color')}{Configuration::get('FSPA_color')}{else}#000000{/if}; text-align: center; font-weight: thin; width: 80%">{$mensaje.message}</td>
		</tr>
	{/foreach}
</table>
<!-- / MENSAJES -->

<table>
	<tr><td style="line-height: 8px">&nbsp;</td></tr>
</table>

{if isset($HOOK_DISPLAY_PDF)}
	<div style="line-height: 1pt">&nbsp;</div>
	<table style="width: 100%">
		<tr>
			<td style="width: 15%"></td>
			<td style="width: 85%">
				{$HOOK_DISPLAY_PDF}
			</td>
		</tr>
	</table>
{/if}