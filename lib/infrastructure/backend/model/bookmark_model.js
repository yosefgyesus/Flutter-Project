class Bookmark {
    constructor(id, word, meaning) {
      this.id = id;
      this.word = word;
      this.meaning = meaning;
    }
  
    toJSON() {
      return {
        id: this.id,
        word: this.word,
        meaning: this.meaning,
      };
    }
  
    static fromJSON(json) {
      return new Bookmark(json.id, json.word, json.meaning);
    }
  }
  
  module.exports = Bookmark;
  