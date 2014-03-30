# Modified from https://github.com/ryanb/dotfiles/

require 'rake'
require 'erb'

desc "install the dot files into user's home directory"
task :install do
  replace_all = false
  Dir['*'].each do |file|
    next if %w[Rakefile README.md LICENSE].include? file
    handle_file(file)
  end
end

def handle_file(file)
  target_dotfilename = ".#{file.sub('.erb', '')}"
  target = File.join ENV['HOME'], target_dotfilename
  replace_all = nil
  if File.exist?(target) || File.symlink?(target)
    if File.identical?(file, target)
      puts "identical ~/#{target_dotfilename}"
    elsif replace_all
      replace_file file, target
    else
      replace_all = confirm_overwrite file, target, "~/#{target_dotfilename}"
    end
  elsif File.directory?(file) && file =~ /oh-my-zsh-custom/
    puts "installing oh my zsh customizations"
    Dir["#{file}/*"].each do |customization|
      customization_source = File.join '$PWD', customization
      customization_target = File.join ENV['HOME'], ".oh-my-zsh/custom/#{customization.split('/').last}"
      if File.exists?(customization_target)
        confirm_overwrite customization_source, customization_target, customization_target
      else
        link_file customization_source, customization_target
      end
    end
  else
    link_file file, target
  end
end

def replace_file(source, destination)
  system %Q{rm -rf #{destination}}
  link_file(source, destination)
end

def link_file(source, destination)
  if source =~ /.erb$/
    puts "generating #{destination}"
    File.open(destination, 'w') do |new_file|
      new_file.write ERB.new(File.read(source)).result(binding)
    end
  else
    puts "linking #{destination}"
    system %Q{ln -s #{source} #{destination}}
  end
end

def confirm_overwrite(source, destination, printed_destination)
  print "overwrite #{printed_destination}? [ynaq] "
  case $stdin.gets.chomp
  when 'a'
    replace_all = true
    replace_file(source, destination)
  when 'y'
    replace_file(source, destination)
  when 'q'
    exit
  else
    puts "skipping #{printed_destination}"
  end
  replace_all
end
