import { test, expect} from '@playwright/test';

test('test', async ({ page }) => {
  await page.goto('http://localhost:8000/en/');
  await page.locator('#content section').filter({ hasText: 'Popular Products  Quick view' }).getByRole('link').first().click();
  await page.getByRole('button', { name: '' }).click();
  await page.getByRole('button', { name: ' Add to cart' }).click();
  await page.getByRole('link', { name: ' Proceed to checkout' }).click();
  await page.waitForTimeout(750);
  await page.getByRole('link', { name: 'Proceed to checkout' }).click();
  await page.waitForTimeout(750);
  await page.getByLabel('Mr.').check();
  await page.getByLabel('First name').click();
  await page.getByLabel('First name').fill('Guest');
  await page.getByLabel('Last name').click();
  await page.getByLabel('Last name').fill('Guest');
  await page.getByLabel('Email').click();
  await page.getByLabel('Email').fill('pratya.po@kkumail.com');
  await page.waitForTimeout(1000);
  await page.getByRole('button', { name: 'Continue' }).click();
  await page.waitForTimeout(1000);
  await page.getByText('I agree to the terms of').click();
  await page.waitForTimeout(1000);
  await page.getByRole('button', { name: 'Place order' }).click();
  await page.waitForTimeout(1000);

  await page.locator('label').filter({ hasText: 'Choose file' }).click();
  await page.getByLabel('Choose file').setInputFiles('QR_payment_test.PNG');
  await page.getByRole('button', { name: 'Upload' }).click();
  await page.click('body');
  await page.waitForTimeout(20000);
});