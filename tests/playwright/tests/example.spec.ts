import { test, expect } from '@playwright/test';

test('has title', async ({ page }) => {
  await page.goto('http://localhost:8080/');

  // Expect a title "to contain" a substring.
  await expect(page).toHaveTitle(/College of Computing Shop/);
});

test('select size and quantity of product', async ({ page }) => {
  await page.goto('http://localhost:8080/');

  await page.click('img[alt="เสื้อแจ็ตเก็ต-ที่ระลึก 60 ปี มข."]');
  await expect(page).toHaveTitle(/เสื้อแจ็ตเก็ต-ที่ระลึก 60 ปี มข./);

  await page.selectOption('#group_1', '3');  // '3' is the value for the 'L' option.
  const selectedOption = await page.$eval('#group_1', (select) => (select as HTMLSelectElement).value);
  await expect(selectedOption).toBe('3');

  await page.fill('#quantity_wanted', '2');

  // Optionally, you can check if the input field now has the correct value.
  const inputValue = await page.$eval('#quantity_wanted', (input) => (input as HTMLInputElement).value);
  await expect(inputValue).toBe('2');

  const addToCartButtonSelector = '.btn.btn-primary.add-to-cart';
  const modalSelector = '#blockcart-modal';

  // Click on the "Add to cart" button.
  await page.click(addToCartButtonSelector);

  // Wait for the page load to complete.
  await page.waitForLoadState('domcontentloaded');

  // Wait for the modal to be present in the DOM.
  await page.waitForSelector(modalSelector, { state: 'visible' });

  // Verify that the modal title contains the expected text.
  const modalTitle = await page.textContent('.modal-title');
  await expect(modalTitle).toContain('Product successfully added to your shopping cart');

  // Interact with buttons within the modal.
  await page.click('.cart-content-btn .btn-secondary'); // Continue Shopping button
  
/*
  // Interact with buttons within the modal.
  await page.click('.cart-content-btn .btn-primary'); // Proceed to checkout button
  
  // Expect a title "to contain" a substring.
  await expect(page).toHaveTitle(/Cart/);
  await page.click('.text-sm-center a.btn-primary');
  await expect(page).toHaveTitle(/College of Computing Shop/);

  await page.goto('http://localhost:8080/index.php?controller=order');  */
});