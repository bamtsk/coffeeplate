define ["/compiled/src/util.js"], (Util) ->

  describe 'Task',->
    t = null

    before ->
      t = new Util.Task("foo bar")

    it "toStringメソッドはコンストラクタの引数を返すこと",->
      expect(t.toString()).eql("foo bar")
