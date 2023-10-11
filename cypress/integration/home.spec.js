describe('home', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000/')
  });


  it("There are products on the page", () => {
    cy.get(".products article").should("be.visible");
  });


  it("There are 12 products on the page", () => {
    cy.get(".products article").should("have.length", 12);
  });





});