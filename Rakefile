namespace :book do
  desc 'prepare build'
  task :prebuild do
    Dir.mkdir 'images' unless Dir.exists? 'images'
    Dir.glob("book/**/images/*").each do |image|
      FileUtils.copy(image, "images/" + File.basename(image))
      # all images must be uniquely named
    end
  end

  desc 'build basic book formats'
  task :build => :prebuild do
    puts "Converting to HTML..."
    `bundle exec asciidoctor aitm.adoc`
    `bundle exec asciidoctor aitm-instructor.adoc`
    puts " -- HTML output at aitm.html, aitm-instructor.html"


    #puts "Converting to EPub..."
    #`bundle exec asciidoctor-epub3 agile.asc`
    #puts " -- Epub output at agile.epub"
    #
    #puts "Converting to Mobi (kf8)..."
    #`bundle exec asciidoctor-epub3 -a ebook-format=kf8 agile.asc`
    #puts " -- Mobi output at agile.mobi"
    # prefer a2x conversion
    #puts "Converting to PDF... (this one takes a while)"
    #{}`bundle exec asciidoctor-pdf aitm.adoc 2>/dev/null`
    #{}`bundle exec asciidoctor-pdf aitm.adoc`

    # puts " -- PDF  output at agile.pdf"
  end
end

task :default => "book:build"
