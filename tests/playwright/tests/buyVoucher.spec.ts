import { test, expect } from '@playwright/test';

test('Buy Voucher', async ({ page }) => {
  await page.goto('http://localhost:8000/');

  // Expect a title "to contain" a substring.
  await expect(page).toHaveTitle(/College of Computing Shop/);

  await page.click('img[alt="Voucher 100 THB"]');
  await expect(page).toHaveTitle(/Voucher 100 THB/);

  await page.fill('#quantity_wanted', '1');

  // Replace the following selector with the one that uniquely identifies the "Add to cart" button.
  const addToCartButtonSelector = '.btn.btn-primary.add-to-cart';
  const modalSelector = '#blockcart-modal';
  
  // Click the "Add to cart" button.
  await page.click(addToCartButtonSelector);

  // Wait for the modal to be present in the DOM.
  await page.waitForSelector(modalSelector, { state: 'visible' });

  // Perform assertions within the modal.
  const productName = await page.textContent('.product-name');
  const productPrice = await page.textContent('.product-price');
  await expect(productName).toContain('Voucher 100 THB');
  await expect(productPrice).toContain('฿100.00');

  // Interact with buttons within the modal.
  await page.click('.cart-content-btn .btn-primary'); // Proceed to checkout button
  
  // Expect a title "to contain" a substring.
  await expect(page).toHaveTitle(/Cart/);
  await page.click('.text-sm-center a.btn-primary');
  await expect(page).toHaveTitle(/College of Computing Shop/);

  await page.goto('http://localhost:8000/index.php?controller=order');

// Select "Pay by bank wire" option
await page.click('#payment-option-1');

// Check the associated checkbox
await page.check('input[name="conditions_to_approve[terms-and-conditions]"]');

// Now you can proceed with submitting the form or performing other actions
await page.click('#payment-confirmation button[type="submit"]');
});

