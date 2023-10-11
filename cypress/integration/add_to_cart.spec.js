describe('home', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000/')
  });

  it("User can add item to cart", () => {
    cy.get('.btn').contains('Add').first().click({force:true})
    
    cy.contains('(1)').should('be.visible')
   
  });





});