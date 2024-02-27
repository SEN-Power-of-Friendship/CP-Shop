{*
*  @author PrestaShop SA 
*  @copyright  2007-2012 PrestaShop SA
*  @version  Release: $Revision: 6753 $
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  @modified: PrestaMarketing.com 2013
*  International Registered Trademark & Property of PrestaShop SA
*}

<!-- FINAL TABLE -->

<table style="width:100%">
	
	<tr style="border-collapse: separate; border-spacing: 1pt;">
		<!-- IVA -->
		<td style="width:60%">
			<table style="width: 100%">
				<tr>
					<td>
						{if $tax_exempt}
							{l s='Exempt of VAT according section 259B of the General Tax Code.' pdf='true'}
						{else}
							<table style="width: 100%; border-collapse: separate; border-spacing: 1.4pt;" >
							
								{if Configuration::get('NOHRE_activo') == 1}

									{* Recargo de equivalencia Activo *}

						            <tr style="line-height:1.8pt">
						            	<td colspan="4" style="padding-top: 7pt; padding-bottom: 7pt; text-align: center; background-color: {if Configuration::get('FSPA_color')}{Configuration::get('FSPA_color')}{else}#000000{/if}; color: {Configuration::get('FSPA_textColor')}; padding-left: 10px; font-weight: thin; font-size: 11pt; padding-top: 7pt; padding-bottom: 7pt">{l s='Impuestos' pdf='true'}</td>
						          	</tr>
						
									<tr style="line-height:5px; text-align:right">
										
										<td style="padding-top: 7pt; padding-bottom: 7pt; text-align: center; background-color: {if Configuration::get('FSPA_color')}{Configuration::get('FSPA_color')}{else}#000000{/if}; color: {Configuration::get('FSPA_textColor')}; padding-left: 2pt; font-size: 8pt; padding-top: 7pt; padding-bottom: 7pt; width: 25%">{l s='Detalles' pdf='true'}</td>

										
											<td style=" padding-top: 7pt; padding-bottom: 7pt; text-align: right; background-color: {if Configuration::get('FSPA_color')}{Configuration::get('FSPA_color')}{else}#000000{/if}; color: {Configuration::get('FSPA_textColor')}; padding-left: 2pt; font-size: 8pt; padding-top: 7pt; padding-bottom: 7pt; width: 21%">{l s='base' pdf='true'}</td>
										

					                    <td style="padding-top: 7pt; padding-bottom: 7pt; text-align: center; background-color: {if Configuration::get('FSPA_color')}{Configuration::get('FSPA_color')}{else}#000000{/if}; color: {Configuration::get('FSPA_textColor')}; padding-left: 2pt; font-size: 8pt; padding-top: 7pt; padding-bottom: 7pt; width: 27%">{l s='Tipo' pdf='true'}</td>

										<td style="padding-top: 7pt; padding-bottom: 7pt; text-align: center; background-color: {if Configuration::get('FSPA_color')}{Configuration::get('FSPA_color')}{else}#000000{/if}; color: {Configuration::get('FSPA_textColor')}; padding-left: 2pt; font-size: 8pt; padding-top: 7pt; padding-bottom: 7pt; width: 27%">{l s='Total IVA' pdf='true'}</td>
									</tr>

								{else}

									{* Recargo de equivalencia NO Activo *}
									<tr style="line-height:1.8pt">
						            	<td colspan="5" style="padding-top: 7pt; padding-bottom: 7pt; text-align: center; background-color: {if Configuration::get('FSPA_color')}{Configuration::get('FSPA_color')}{else}#000000{/if}; color: {Configuration::get('FSPA_textColor')}; padding-left: 10px; font-weight: thin; font-size: 11pt; padding-top: 7pt; padding-bottom: 7pt">{l s='Impuestos' pdf='true'}</td>
						            </tr>

									<tr style="line-height:5px; text-align:right">
					
										<td style="padding-top: 7pt; padding-bottom: 7pt; text-align: center; background-color: {if Configuration::get('FSPA_color')}{Configuration::get('FSPA_color')}{else}#000000{/if}; color: {Configuration::get('FSPA_textColor')}; padding-left: 2pt; font-size: 8pt; padding-top: 7pt; padding-bottom: 7pt; width: 25%">{l s='Detalles' pdf='true'}</td>

										
											<td style=" padding-top: 7pt; padding-bottom: 7pt; text-align: right; background-color: {if Configuration::get('FSPA_color')}{Configuration::get('FSPA_color')}{else}#000000{/if}; color: {Configuration::get('FSPA_textColor')}; padding-left: 2pt; font-size: 8pt; padding-top: 7pt; padding-bottom: 7pt; width: 21%">{l s='base' pdf='true'}</td>
										

					                    <td style="padding-top: 7pt; padding-bottom: 7pt; text-align: center; background-color: {if Configuration::get('FSPA_color')}{Configuration::get('FSPA_color')}{else}#000000{/if}; color: {Configuration::get('FSPA_textColor')}; padding-left: 2pt; font-size: 8pt; padding-top: 7pt; padding-bottom: 7pt; width: 17%">{l s='tipo' pdf='true'}</td>

										<td style="padding-top: 7pt; padding-bottom: 7pt; text-align: center; background-color: {if Configuration::get('FSPA_color')}{Configuration::get('FSPA_color')}{else}#000000{/if}; color: {Configuration::get('FSPA_textColor')}; padding-left: 2pt; font-size: 8pt; padding-top: 7pt; padding-bottom: 7pt; width: 17%">{l s='Total IVA' pdf='true'}</td>

										<td style="padding-top: 7pt; padding-bottom: 7pt; text-align: center; background-color: {if Configuration::get('FSPA_color')}{Configuration::get('FSPA_color')}{else}#000000{/if}; color: {Configuration::get('FSPA_textColor')}; padding-left: 2pt; font-size: 8pt; padding-top: 7pt; padding-bottom: 7pt; width: 20%">{l s='Total' pdf='true'}</td>

									</tr>

								{/if}


								{if isset($product_tax_breakdown)}
									
									{if Configuration::get('NOHRE_activo') == 1}

										{* Recargo de equivalencia Activo *}
										
										{foreach $product_tax_breakdown as $rate => $product_tax_infos}
				
											<tr style="line-height:6px;background-color:{cycle values='#FFF,#DDD'}; text-align:left; line-height: 1.5pt; color:#404040; font-size:9pt">

									 			{if $product_tax_infos.name|substr:0:1 == 'R'}	
												 	
												 	<td style="width: 25%">{$product_tax_infos.name}</td>
												 	
												 	
														 <td style="width: 21%; text-align: right;">
															 {if isset($is_order_slip) && $is_order_slip}- {/if}{displayPrice currency=$order->id_currency price=($product_tax_infos.total_price_tax_excl + $order_invoice->total_discount_tax_excl) - $order_invoice->total_discount_tax_excl}
														 </td>
													

									                <td style="width: 27%; text-align: right;">{$rate} %</td>

													<td style="width: 27%; text-align: center;">{if isset($is_order_slip) && $is_order_slip} {/if}
		                              {math equation="(t * ra) / 100" t = round($product_tax_infos.total_price_tax_excl,2) ra = $rate|replace:",":"." format="%.4f"} {Currency::getCurrent()->sign}</td>
											
													</tr>

												{else}

													<td style="width: 25%">{l s='Products' pdf='true'}</td>

										
														 <td style="width: 21%; text-align: right;">
															 {if isset($is_order_slip) && $is_order_slip}- {/if}{displayPrice currency=$order->id_currency price=($product_tax_infos.total_price_tax_excl + $order_invoice->total_discount_tax_excl) - $order_invoice->total_discount_tax_excl}
														 </td>
												
					                				<td style="width: 27%; text-align: right;">{$rate} %</td>

													<td style="width: 27%; text-align: center;">{if isset($is_order_slip) && $is_order_slip} {/if}{round(round((($product_tax_infos.total_price_tax_excl + $order_invoice->total_discount_tax_excl) - $order_invoice->total_discount_tax_excl),2)*$rate/100,4)} {Currency::getCurrent()->sign}</td>

													</tr>
												{/if}

										{/foreach}
				
									{else}

										{* Recargo de equivalencia NO Activo *}

										{foreach $product_tax_breakdown as $rate => $product_tax_infos}

											<tr style="line-height:6px;background-color:{cycle values='#FFF,#DDD'}; text-align:left; line-height: 1.5pt; color:#404040; font-size:9pt">

												 <td style="width: 25%">{l s='Products' pdf='true'}</td>
					
												
													<td style="width: 21%; text-align: right;">

									 				{if isset($is_order_slip) && $is_order_slip} 
													 	{if ($product_tax_infos.total_price_tax_excl + $order_invoice->total_discount_tax_excl) == 0 }
													 		- {displayPrice currency=$order->id_currency price=$order->total_products_wt}
													 	{else}
													 		- {displayPrice currency=$order->id_currency price=($product_tax_infos.total_price_tax_excl + $order_invoice->total_discount_tax_excl) - $order_invoice->total_discount_tax_excl}
													 	{/if}
									 				{else}
									 				 	{displayPrice currency=$order->id_currency price=$product_tax_infos.total_price_tax_excl}
													 {/if}
													 </td>
												

								                <td style="width: 17%; text-align: right;">{round($rate,2)} %</td>

												<td style="width: 17%; text-align: center;">{if isset($is_order_slip) && $is_order_slip}- {/if}{displayPrice currency=$order->id_currency price=(($product_tax_infos.total_price_tax_excl)*$rate) / 100}</td>

					                			<td style="width: 20%; text-align: center;">{if isset($is_order_slip) && $is_order_slip}- {/if}{displayPrice currency=$order->id_currency price=$product_tax_infos.total_amount + ($product_tax_infos.total_price_tax_excl + $order_invoice->total_discount_tax_excl) - $order_invoice->total_discount_tax_excl}</td>
											</tr>
										{/foreach}
									{/if}
								{/if}


								<!-- Transporte -->

								{if Configuration::get('NOHRE_activo') == 1}

									{if isset($shipping_tax_breakdown)}

										{foreach $shipping_tax_breakdown as $shipping_tax_infos}

							                {if $order->total_shipping_tax_incl > 0}
												<tr style="line-height:6px;background-color:{cycle values='#FFF,#DDD'}; text-align:left; line-height: 1.5pt; color:#404040; font-size:9pt">

									 				{if Configuration::get('NOHRE_aplicar_a_Envio') == 1}
													  	{if $shipping_tax_infos.name eq ''}
						                                	<td style="width: 25%">{l s='Shipping' pdf='true'}</td>
						                                {else}                                
							                                <td style="width: 25%">{$shipping_tax_infos.name}</td>
						                                {/if}
													{else}
									  					<td style="width: 25%">{l s='Shipping' pdf='true'}</td>
													{/if}

					 								
										 				<td style="width: 21%; text-align: right;">{if isset($is_order_slip) && $is_order_slip}-{/if}{displayPrice currency=$order->id_currency price=$shipping_tax_infos.total_tax_excl}</td>
												

				                					<td style="width: 27%; text-align: right;">{round($shipping_tax_infos.rate,2)} %</td>

								 					<td style="width: 27%; text-align: center;">{round(($shipping_tax_infos.total_tax_excl * $shipping_tax_infos.rate) / 100,4)} {Currency::getCurrent()->sign}</td>
												</tr>
											{/if}
										{/foreach}
									{/if}

								{else}

									{if isset($shipping_tax_breakdown)}

										{foreach $shipping_tax_breakdown as $shipping_tax_infos}
							                {if $order->total_shipping_tax_incl > 0}
												<tr style="line-height:6px;background-color:{cycle values='#FFF,#DDD'}; text-align:left; line-height: 1.5pt; color:#404040; font-size:9pt">
													<td style="width: 25%">{l s='Shipping' pdf='true'}</td>
						
									 		
														<td style="width: 21%; text-align: right;">{if isset($is_order_slip) && $is_order_slip}- {/if}{displayPrice currency=$order->id_currency price=$shipping_tax_infos.total_tax_excl}</td>
												

				               						<td style="width: 17%; text-align: right;">{round($shipping_tax_infos.rate,2)} %</td>

								 					<td style="width: 17%; text-align: center;">{if isset($is_order_slip) && $is_order_slip}- {/if}{displayPrice currency=$order->id_currency price=$shipping_tax_infos.total_amount}</td>

				                					<td style="width: 20%; text-align: center;">
				                					
														{if isset($is_order_slip) && $is_order_slip}
															- {displayPrice currency=$order->id_currency price=$order->total_shipping_tax_incl}
														{else}
														{displayPrice currency=$order->id_currency price=$order->total_shipping_tax_incl}
														{/if}
													
													</td>
												</tr>
											{/if}
										{/foreach}
									{/if}
								{/if}

								<!-- End transporte -->


								<!-- Embalaje -->

								{if Configuration::get('NOHRE_activo') == 1}

									{if $order_invoice->total_wrapping_tax_incl > 0}
										<tr style="line-height:6px;background-color:{cycle values='#FFF,#DDD'}; text-align:left; line-height: 1.5pt; color:#404040; font-size:9pt">
											<td style="width: 25%">{l s='Embalaje' pdf='true'}</td>
						
							 				
												<td style="width: 21%; text-align: right;">{if isset($is_order_slip) && $is_order_slip}- {/if}{displayPrice currency=$order->id_currency price=$order_invoice->total_wrapping_tax_excl}</td>
											
							                
							                <td style="width: 27%; text-align: right;">{($order_invoice->total_wrapping_tax_incl-$order_invoice->total_wrapping_tax_excl)*100 / $order_invoice->total_wrapping_tax_excl|string_format:"%.2f"} %</td>

					 						<td style="width: 27%; text-align: center;">{if isset($is_order_slip) && $is_order_slip}- {/if}{displayPrice currency=$order->id_currency price=$order_invoice->total_wrapping_tax_incl-$order_invoice->total_wrapping_tax_excl}</td>
										</tr>
									{/if}

								{else}

									{if $order_invoice->total_wrapping_tax_incl > 0}
										<tr style="line-height:6px;background-color:{cycle values='#FFF,#DDD'}; text-align:left; line-height: 1.5pt; color:#404040; font-size:9pt">
											<td style="width: 25%">{l s='Embalaje' pdf='true'}</td>
						
							 			
												<td style="width: 21%; text-align: right;">{if isset($is_order_slip) && $is_order_slip}- {/if}{displayPrice currency=$order->id_currency price=$order_invoice->total_wrapping_tax_excl}</td>
											

							                <td style="width: 17%; text-align: right;">{($order_invoice->total_wrapping_tax_incl-$order_invoice->total_wrapping_tax_excl)*100 / $order_invoice->total_wrapping_tax_excl|string_format:"%.2f"} %</td>

											<td style="width: 17%; text-align: center;">{if isset($is_order_slip) && $is_order_slip}- {/if}{displayPrice currency=$order->id_currency price=$order_invoice->total_wrapping_tax_incl-$order_invoice->total_wrapping_tax_excl}</td>

		                					<td style="width: 20%; text-align: center;">
		                						{displayPrice currency=$order->id_currency price=$order_invoice->total_wrapping_tax_incl}
												
											</td>
										</tr>
									{/if}
								{/if}
								<!-- End embalaje -->

								<!-- Descuentos -->
								{*if $order_invoice->total_discount_tax_incl > 0}
									<tr style="line-height:6px;background-color:{cycle values='#FFF,#DDD'}; text-align:left; line-height: 1.5pt; color:#404040; font-size:9pt">
										<td style="width: 25%">Descuentos</td>
				                        {assign var="dtoSinIva" value=$order_invoice->total_discount_tax_excl}
				                        {assign var="dtoConIva" value=$order_invoice->total_discount_tax_incl}
				                        {assign var="ivaDto" value=$dtoConIva - $dtoSinIva}
										<td style="width: 21%; text-align: right;">{displayPrice currency=$order->id_currency price=$order_invoice->total_discount_tax_excl}</td>
										
											<td style="width: 17%; text-align: right;">{round($ivaDto * 100 / $dtoSinIva)} %</td>
										

										<td style="width: 17%; text-align: center;">{displayPrice currency=$order->id_currency price=$order_invoice->total_discount_tax_incl - $dtoSinIva } </td>

	                        			<td style="width: 20%; text-align: center;">-{displayPrice currency=$order->id_currency price=$order_invoice->total_discount_tax_incl}</td>
									</tr>
								{/if*}
								<!-- /Descuentos -->

								<!-- Ecotax -->
								{if isset($ecotax_tax_breakdown)}
									{foreach $ecotax_tax_breakdown as $ecotax_tax_infos}
										{if $ecotax_tax_infos.ecotax_tax_excl > 0}
											<tr style="line-height:1.5pt;background-color:{cycle values='#FFF,#DDD'};font-size:9pt">
												<td style="width: 25%">{l s='Ecotax' pdf='true'}</td>
												
													<td style="width: 21%; text-align: right;">{if isset($is_order_slip) && $is_order_slip}- {/if}{displayPrice currency=$order->id_currency price=$ecotax_tax_infos.ecotax_tax_excl}</td>
												
												<td style="width: 17%; text-align: right;">{round($ecotax_tax_infos.rate,2)} %</td>
												<td style="width: 17%; text-align: center;">{if isset($is_order_slip) && $is_order_slip}- {/if}{displayPrice currency=$order->id_currency price=($ecotax_tax_infos.ecotax_tax_incl - $ecotax_tax_infos.ecotax_tax_excl)}</td>
												<td style="width: 20%; text-align: center;">{if isset($is_order_slip) && $is_order_slip}- {/if}{displayPrice currency=$order->id_currency price=($ecotax_tax_infos.ecotax_tax_incl)}</td>
											</tr>
										{/if}
									{/foreach}
								{/if}
								<!-- /EcoTax -->


								<!-- fee paypal -->
								{if isset($order->payment_fee) && $order->payment_fee > 0}
									<tr style="line-height:6px;background-color:{cycle values='#FFF,#DDD'}; text-align:left; line-height: 1.5pt; color:#404040; font-size:9pt">
										<td style="width: 25%">
											{l s='Fee payment' pdf='true'}
										</td>
										<td style="width: 21%; text-align: right;">{displayPrice currency=$order->id_currency price=($order->payment_fee / (1+($order->payment_fee_rate/100)))}</td>
										<td style="width: 17%; text-align: right;">{round($order->payment_fee_rate,2)} %</td>
										<td style="width: 17%; text-align: center;">
											
											{displayPrice currency=$order->id_currency price=($order->payment_fee - ($order->payment_fee / (1+($order->payment_fee_rate/100))))}		
										</td>
										<td style="width: 20%; text-align: center;">{displayPrice currency=$order->id_currency price=($order->payment_fee * ($order->payment_fee_rate/100) / (1+($order->payment_fee_rate/100)) + ($order->payment_fee / (1+($order->payment_fee_rate/100))))}</td>
									</tr>
								{/if}
								<!-- /feepaypal -->

							</table>
						{/if}
					</td>
				</tr>
			</table>
		</td>
		
		<!--/ IVA -->
		
		<!-- MARGEN -->
		<td style="width:3%">&nbsp;</td>
		<!--/ MARGEN -->
		
		<!-- TOTALES -->

		<td style="width:37%">
			<table style="width:100%; border-collapse: separate; border-spacing: 1.4pt;">
				<tr style="line-height: 1.8pt;">
					<td colspan="2" style="padding-top: 7pt; padding-bottom: 7pt; text-align: center; background-color: {if Configuration::get('FSPA_color')}{Configuration::get('FSPA_color')}{else}#000000{/if}; color: {Configuration::get('FSPA_textColor')}; padding-left: 10px; font-weight: thin; font-size: 11pt; padding-top: 7pt; padding-bottom: 7pt;">{l s='Total Factura' pdf='true'}</td>
				</tr>
				
				<tr style="line-height: 1.5pt;">
					<td style="width:60%; background-color: {if Configuration::get('FSPA_color')}{Configuration::get('FSPA_color')}{else}#000000{/if}; color: {Configuration::get('FSPA_textColor')}; font-size:9pt; text-align:right;">{l s='Detalle' pdf='true'}</td>
					
					<td style="width:40%; background-color: {if Configuration::get('FSPA_color')}{Configuration::get('FSPA_color')}{else}#000000{/if}; color: {Configuration::get('FSPA_textColor')}; font-size:9pt; text-align:right;">{l s='Importe' pdf='true'}</td>
				</tr>

				<!-- <tr style="line-height: 1.5pt; color:#000; text-align:right">
					<td style="width:60%; background-color: #ded4d4; font-size:9pt; color:#000">{l s='Product Total (Tax Excl.)' pdf='true'}</td>
					<td style="width:40%; background-color: #ded4d4; font-size:10pt; color:#000">{displayPrice currency=$order->id_currency price=$order_invoice->total_products}</td>
				</tr> -->

				<tr style="line-height: 1.5pt; color:#404040; text-align:right; font-size:10pt">
					<td style="width:60%; background-color: #F2F2F2;font-size:9pt;">{l s='SubTotal' pdf='true'}</td>
					<td style="width:40%; background-color: #F2F2F2; font-size:9pt">{if isset($is_order_slip) && $is_order_slip}- {/if}{displayPrice currency=$order->id_currency price=($order->total_products+$shipping_tax_infos.total_tax_excl+$order->total_wrapping_tax_excl)}</td>
				</tr>
					
				{if $order_invoice->total_discount_tax_incl > 0}
					<tr style="line-height: 1.5pt; color:#404040; text-align:right; font-size:10pt">
						<td style="width:60%; background-color: #F2F2F2;font-size:9pt;">{l s='Total Descuentos' pdf='true'}</td>
						<td style="width:40%; background-color: #F2F2F2; font-size:9pt">-{displayPrice currency=$order->id_currency price=($order_invoice->total_discount_tax_excl )}</td>
					</tr>

					<tr style="line-height: 1.5pt; color:#404040; text-align:right; font-size:10pt">
						<td style="width:60%; background-color: #F2F2F2;font-size:9pt;">{l s='Total Base' pdf='true'}</td>
						<td style="width:40%; background-color: #F2F2F2; font-size:9pt">{if isset($is_order_slip) && $is_order_slip}- {/if}{displayPrice currency=$order->id_currency price=($order->total_products+$shipping_tax_infos.total_tax_excl+$order->total_wrapping_tax_excl) - ($order_invoice->total_discount_tax_excl )   }</td>
					</tr>
				{/if}

				{if ($order->total_paid_tax_incl - $order->total_paid_tax_excl) > 0}
					<tr style="line-height: 1.5pt; color:#404040; text-align:right; font-size:10pt">
						<td style="width:60%; background-color: #F2F2F2;font-size:9pt;">{l s='Total IVA' pdf='true'}</td>
						<td style="width:40%; background-color: #F2F2F2; font-size:9pt">{if isset($is_order_slip) && $is_order_slip}- {/if}{displayPrice currency=$order->id_currency price=($order->total_paid_tax_incl - $order->total_paid_tax_excl)}</td>
					</tr>
				{/if}
                
                {if isset($order->payment_fee) && $order->payment_fee > 0}
					<tr style="line-height: 1.5pt; color:#404040; text-align:right; font-size:10pt">
						<td style="width:60%; background-color: #F2F2F2;font-size:9pt;">{l s='Fee payment' pdf='true'}</td>
						<td style="width:40%; background-color: #F2F2F2; font-size:9pt">{displayPrice currency=$order->id_currency price=($order->payment_fee / (1+($order->payment_fee_rate/100)))}</td>
					</tr>
				{/if}

				{if Configuration::get('FSPA_showCarrier') == 1}
				{if $order_invoice->total_shipping_tax_incl > 0}
					<tr style="line-height: 1.5pt; color:#000; text-align:right; font-size:10pt">
						<td style="width:60%; background-color: #F2F2F2;font-size:9pt;">{l s='Transporte' pdf='true'}</td>
						<td style="width:40%; background-color: #F2F2F2; font-size:9pt">
							
								{if isset($is_order_slip) && $is_order_slip}- {/if}{displayPrice currency=$order->id_currency price=$order_invoice->total_shipping_tax_incl}
							
						</td>
					</tr>
				{/if}
				{/if}

				<tr style="line-height: 1.5pt; color:{Configuration::get('FSPA_textColor')}; background-color: {if Configuration::get('FSPA_color')}{Configuration::get('FSPA_color')}{else}#000000{/if}; font-size: 11pt; font-weight: bold; text-align:right">
					<td style="width:60%; text-align:right">{l s='Total' pdf='true'}</td>
					<td style="width:40%">{if isset($is_order_slip) && $is_order_slip}- {/if}{displayPrice currency=$order->id_currency price=$order->total_paid_tax_incl}</td>
				</tr>
			</table>
		</td>
		<!--/ TOTALES -->
	</tr>
</table>
<!-- / FINAL TABLE -->

<div style="line-height: 1px">&nbsp;</div>
<div style="line-height: 1px">&nbsp;</div>

<table style="width:100%">
	<tr style="line-height: 1.5pt; color:#000; text-align:left; font-size:10pt">
		<td>
			<p>{$legal_free_text|escape:'html':'UTF-8'|nl2br}</p>
		</td>
	</tr>
</table>