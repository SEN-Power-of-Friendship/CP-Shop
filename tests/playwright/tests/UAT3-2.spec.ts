import { test, expect } from '@playwright/test';

test('test', async ({ page }) => {
  await page.goto('http://localhost:8000/en/');
  await page.locator('div:nth-child(2) > .product-miniature > .thumbnail-container > .thumbnail-top > .thumbnail').first().click();
  await page.getByRole('button', { name: '' }).click();
  await page.getByRole('button', { name: ' Add to cart' }).click();
  await page.getByRole('link', { name: ' Proceed to checkout' }).click();
  await page.getByRole('link', { name: 'Proceed to checkout' }).click();
  await page.getByLabel('Mr.').check();
  await page.getByLabel('First name').click();
  await page.getByLabel('First name').fill('Pratya');
  await page.getByLabel('Last name').click();
  await page.getByLabel('Last name').fill('Pothong');
  await page.getByLabel('Email').click();
  await page.getByLabel('Email').fill('pratya.po@kkumail.com');
  await page.getByRole('button', { name: 'Continue' }).click();
  await page.getByLabel('Bank Transfer').check();
  await page.getByLabel('I agree to the terms of').check();
  await page.getByRole('button', { name: 'Place order' }).click();
  await page.getByText('Choose file').click();
  await page.getByLabel('Choose file').setInputFiles('QR_payment_test.PNG');
  await page.getByRole('button', { name: 'Upload' }).click();

});