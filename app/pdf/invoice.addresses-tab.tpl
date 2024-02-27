{**
 * Copyright since 2007 PrestaShop SA and Contributors
 * PrestaShop is an International Registered Trademark & Property of PrestaShop SA
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Open Software License (OSL 3.0)
 * that is bundled with this package in the file LICENSE.md.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/OSL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to https://devdocs.prestashop.com/ for more information.
 *
 * @author    PrestaShop SA and Contributors <contact@prestashop.com>
 * @copyright Since 2007 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/OSL-3.0 Open Software License (OSL 3.0)
 *}

<style>
	p {
		font-size: 8;
	}

</style>

<table id="addresses-tab" cellspacing="0" cellpadding="0">
	<tr>
		<td width="50%"><span class="bold">{l s='College of Computing Shop' d='Shop.Pdf' pdf='true'}</span>
			<p>College of Computing</p>
			<p>http://localhost:8080</p>
			<p>Khon Kaen University, 40002</p>
			<br/>
			<br/>
			
				{$invoice_address}
		</td>
		{*<td width="50%">{if $delivery_address}<span class="bold">{l s='Delivery address' d='Shop.Pdf' pdf='true'}</span><br/><br/>
			{$delivery_address}
		{/if}
	</td>*}
		<td width="50%"><span class="bold">{l s='Invoice #' d='Shop.Pdf' pdf='true'}</span>
		</td>
		
	</tr>
</table>
