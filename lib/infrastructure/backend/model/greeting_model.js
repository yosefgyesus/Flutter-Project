class Greeting {
    constructor(id, greeting, meaning, example) {
      this.id = id;
      this.greeting = greeting;
      this.meaning = meaning;
      this.example = example;
    }
  
    toJSON() {
      return {
        id: this.id,
        greeting: this.greeting,
        meaning: this.meaning,
        example: this.example,
      };
    }
  
    static fromJSON(json) {
      return new Greeting(json.id, json.greeting, json.meaning, json.example);
    }
  }
  
  module.exports = Greeting;
  