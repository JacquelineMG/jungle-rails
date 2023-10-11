describe('home', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000/')
  });


  it("User can click through to a product page", () => {
    cy.get('[alt="Eesrorn"]').click();
  });





});