function greet (name) {
    const newLocal = 'Hello, $(name)! ';
    return newLocal;
}
module.exports = greet;// Ensure function is exportable

// If run directly,print output (useful for debugging)

if (require. main== module) {

  console.log (greet ( "World") ) ;  
}
