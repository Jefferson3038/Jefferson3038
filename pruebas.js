import { browser } from 'k6/experimental/browser';
import { sleep } from 'k6';

export const options = {
  scenarios: {
    browser: {
      executor: 'shared-iterations',
      options: {
        browser: {
            type: 'chromium',
        },
      },
    },
  },
  thresholds: {
    checks: ["rate==1.0"]
  }
}

export default async function () {
    const context = browser.newContext({
        viewport: {
            'width': 1650, 
            'height': 1800
        },
      });
    
    const page = context.newPage();

    try {
        await page.goto('https://www.google.com/');
        let buscador = page.locator('(//textarea)[1]');
        buscador.type('hello world!');
        buscador.press('Enter');
        page.waitForLoadState();
        sleep(3);
    } finally {
        page.close();
    }
}