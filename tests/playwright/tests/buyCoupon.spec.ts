import { test, expect } from '@playwright/test';

test('Buy Coupon', async ({ page }) => {
  await page.goto('http://localhost:8080/');

  // Expect a title "to contain" a substring.
  await expect(page).toHaveTitle(/College of Computing Shop/);

  await page.click('img[alt="Coupon 50 THB"]');
  await expect(page).toHaveTitle(/Coupon 50 THB/);

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
  await expect(productName).toContain('Coupon 50 THB');
  await expect(productPrice).toContain('฿50.00');

  // Interact with buttons within the modal.
  await page.click('.cart-content-btn .btn-primary'); // Proceed to checkout button
  
  // Expect a title "to contain" a substring.
  await expect(page).toHaveTitle(/Cart/);
  await page.click('.text-sm-center a.btn-primary');
  await expect(page).toHaveTitle(/College of Computing Shop/);

  await page.goto('http://localhost:8080/index.php?controller=order');

  // Fill in the form for a guest user
  await page.click('.nav-link[data-toggle="tab"][href="#checkout-guest-form"]');
  
  // Social title
  await page.click('input[name="id_gender"][value="1"]'); // Mr.

  // First name
  await page.fill('input[name="firstname"]', 'John');

  // Last name
  await page.fill('input[name="lastname"]', 'Doe');

  // Email
  await page.fill('input[name="email"]', 'john.doe@example.com');

  // Password (optional)
  //await page.fill('input[name="password"]', 'securePassword');

  // Birthdate (optional)
  //await page.fill('input[name="birthday"]', '05/31/1990');

  // Optin for offers
  await page.check('input[name="optin"]');

  // Agree to terms and conditions
  await page.check('input[name="psgdpr"]');

  // Sign up for newsletter (optional)
  await page.check('input[name="newsletter"]');

  // Customer data privacy
  await page.check('input[name="customer_privacy"]');

  // Submit the form
  await page.click('button[name="continue"]');

  // Fill the address
await page.fill('input#field-address1', 'Streeeeeeeeeet');

// Fill the city
await page.fill('input#field-city', 'Cityyyyyy');

// Fill the zip/postal code
await page.fill('input#field-postcode', '40000');

// Choose the country
await page.selectOption('select#field-id_country', 'Thailand');

// Check the "Use this address for invoice too" checkbox
await page.check('input#use_same_address');

// Submit the form
await page.click('#checkout-payment-step button[name="confirm-addresses"]');

// Select "Pay by bank wire" option
await page.click('#payment-option-1');

// Check the associated checkbox
await page.check('input[name="conditions_to_approve[terms-and-conditions]"]');

// Now you can proceed with submitting the form or performing other actions
await page.click('#payment-confirmation button[type="submit"]');
});

