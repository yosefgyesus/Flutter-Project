class Number {
    constructor(id, number, meaning) {
      this.id = id;
      this.number = number;
      this.meaning = meaning;
    }
  
    toJSON() {
      return {
        id: this.id,
        number: this.number,
        meaning: this.meaning,
      };
    }
  
    static fromJSON(json) {
      return new Number(json.id, json.number, json.meaning);
    }
  }
  
  module.exports = Number;
  