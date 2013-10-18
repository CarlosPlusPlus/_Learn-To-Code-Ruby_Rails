require('./calculator');

describe('Calculator', function() {
  it("adds 1",function() {
    var result = Calculator.ask("What is 1 plus 1?")
    expect(result).toEqual(2);
  });

  it("adds 2",function() {
    var result = Calculator.ask("What is 1 plus 2?")
    expect(result).toEqual(3);
  });

  it("adds more digit",function() {
    var result = Calculator.ask("What is 123 plus 45678?")
    expect(result).toEqual(45801);
  });

  it("adds negative numbers",function() {
    var result = Calculator.ask("What is -1 plus -10?")
    expect(result).toEqual(-11);
  });

});