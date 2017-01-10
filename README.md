# はじめに

これは[Wordさんは今日もおつかれです](http://qiita.com/kaityo256/items/c15889dbb7acb2632c6e)@Qiitaを書くために作ったスクリプトです。指定されたdocxファイルをテンポラリディレクトリに展開し、RubyのREXMLで読み込んでREXML::Formatters::Prettyで適当に表示するものです。

# case1

文字の断片化のテスト。

    $ cd case1
    $ ruby showdoc.rb test1.docx
    <w:p>
      <w:r>
        <w:rPr>
          <w:rFonts w:hint='eastAsia'/>
        </w:rPr>
        <w:t>
          あいうえお
        </w:t>
      </w:r>
      <w:bookmarkStart w:id='0' w:name='_GoBack'/>
      <w:bookmarkEnd w:id='0'/>
    </w:p>

# case2 

箇条書きの情報(numbering.xml)の表示。

    $ cd case2
    $ ruby shownumbering2.rb test3.docx  
    <w:abstractNum  w:abstractNumId='0' w15:restartNumberingAfterBreak='0'> ... </w:abstractNum>
    <w:abstractNum  w:abstractNumId='1' w15:restartNumberingAfterBreak='0'> ... </w:abstractNum>
    <w:num w:numId='1'>
      <w:abstractNumId w:val='0'/>
    </w:num>
    <w:num w:numId='2'>
      <w:abstractNumId w:val='1'/>
    </w:num>
