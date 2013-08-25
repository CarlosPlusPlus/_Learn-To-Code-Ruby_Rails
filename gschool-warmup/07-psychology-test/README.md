# Psychology Test

Write a program that contains 10 questions.

The questions should be posed in random order.

One of these questions is the question you really want the answer to. The other 9 are red herrings.

The question you want an answer to should have only a small number of acceptable answers (e.g. 'yes'/'no', but it could be anything). If their answer does not match an acceptable answer, you must insist that they answer correctly, and ask them the question again.

At the end of the program, you should base your conclusion on the one question you actually care about.

## Getting Started

Instead of using `gets` and `puts` use the
[highline](https://rubygems.org/gems/highline) gem. You can find more examples
here in the [documentation](http://highline.rubyforge.org/doc/classes/HighLine.html).

```bash
$ gem install highline
```

```ruby
require 'highline/import'

loves = ask "What do you love?"

feeling = ask "How are you today?" do |q|
  q.default = "good"
end

wants_candy = ask "Do you want <%= color('candy',RED) %>?" do |q|
  q.validate = /^(yes|no)$/
end

say "Your favorite color is <%= color('blue',BLUE) %>"
```

## Extensions

### Follow-up Questions

Certain questions that you want to ask have follow up questions depending on
the subject's initial response. Select a question and based on the subject's
response present them with a new question.

### Storing Questions

You want to be able to share questions with other scientists to see their 
effect in upcoming tests. Devise a way that would make it easy for you to 
exchange a body of questions with another scientist.

### Storing Answers

Asking questions are great but only if you capture the answer or answers given
by your subjects. Devise a system that will store the results of the answers
for the given subject and future subjects.

## Source
Inspired by chapter 8 in Chris Pine's online [Learn to Program](http://pine.fm/LearnToProgram/?Chapter=08) tutorial.