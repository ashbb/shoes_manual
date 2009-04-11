# cathtmls.rb
HEADER =<<'EOS'
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "DTD/xhtml1-transitional.dtd">
<html lang="en" xml:lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>The Shoes Manual // The App Object</title>
<script type="text/javascript" src="static/code_highlighter.js"></script>
<script type="text/javascript" src="static/code_highlighter_ruby.js"></script>
<style type="text/css">@import 'static/manual.css';</style></head><body>
EOS
FOOTER = '</body></html>'
OUT = 'Shoes_Manual.htm'
CSS = 'static/manual.css'

ORDER = %w[Hello.html Introducing.html Installing.html Rules.html 
Shoes.html Built-in.html App.html Styles.html Classes.html 
Colors.html Slots.html Art.html Element.html Events.html 
Manipulation.html Position.html Traversing.html Elements.html 
Common.html Background.html Border.html Button.html 
Check.html EditBox.html EditLine.html Image.html ListBox.html 
Progress.html Radio.html Shape.html TextBlock.html 
Timers.html Video.html]

open(OUT, 'w'){|f| f.puts HEADER}

open(OUT, 'a'){|f|
  ORDER.each{|file|
    data = IO.read file
    s = data.index('<body>') + 6
    e = data.index('<div class="sidebar">')
    f.puts data[s...e]
    open(file, 'w'){|fd| fd.puts data[0...e], FOOTER}
  }
  f.puts FOOTER
}

data = IO.read CSS

target =<<EOS
#manual {
  float: right;
  width: 540px;
EOS

data.sub!(target, target.sub('540', '680'))
open(CSS, 'w'){|f| f.puts data}

