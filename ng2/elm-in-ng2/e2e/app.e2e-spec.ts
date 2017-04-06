import { ElmInNg2Page } from './app.po';

describe('elm-in-ng2 App', function() {
  let page: ElmInNg2Page;

  beforeEach(() => {
    page = new ElmInNg2Page();
  });

  it('should display message saying app works', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('app works!');
  });
});
