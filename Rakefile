# Modified from https://github.com/ryanb/dotfiles/

require 'erb'
require 'fileutils'
require 'rake'

IGNORES = %w[
  Rakefile README.md LICENSE node_modules package.json package-lock.json
]

task default: :install

desc 'Install packages and dotfiles'
task install: ['install:packages', 'install:dotfiles']

namespace :install do
  desc 'Install homebrew packages, set sensible defaults'
  task :packages do
    %w(brew defaults).each do |type|
      log(:blue, "executing bin/#{type}-install …")
      system("bin/#{type}-install")
    end
  end

  task :dotfiles do
    desc 'Install dotfiles into your home directory'
    replace_all = false
    Dotfile.each do |dotfile|
      case dotfile.status
      when :identical
        log(:green, "identical #{dotfile}")
      when :missing
        dotfile.link!
      when :different
        if replace_all
          dotfile.replace!
        elsif (answer = ask(:red, "overwrite #{dotfile}?"))
          replace_all = true if answer == :all
          dotfile.replace!
        else
            log(:gray, "skipping #{dotfile}")
        end
      end
    end
  end
end

def log(color, message, options={})
  require "highline" rescue nil

  first, rest = message.split(" ", 2)
  first = first.ljust(10)

  if defined?(HighLine::String)
    first = HighLine::String.new(first).public_send(color)
  end

  line = [first, rest].join(" ")

  if line.end_with?(" ")
    print(line)
  else
    puts(line)
  end
end

def ask(color, question)
  log(color, "#{question} [yNaq]? ")

  case $stdin.gets.chomp
  when "a"
    :all
  when "y"
    true
  when "q"
    exit
  else
    false
  end
end

class Dotfile
  def self.each(directory=nil, &block)
    Dir[File.join([directory, "*"].compact)].each do |file|
      next if IGNORES.include?(file)

      if File.directory?(file)
        each(file, &block)
      else
        yield(new(file))
      end
    end
  end

  attr_reader :file

  def initialize(file)
    @file = file
  end

  def erb?
    file =~ /\.erb\z/i
  end

  def name
    ".#{file.sub(/\.erb\z/i, "")}"
  end
  alias :to_s :name

  def target
    File.expand_path("~/#{name}")
  end

  def status
    if File.identical?(file, target)
      :identical
    elsif File.exist?(target) || File.symlink?(target)
      :different
    else
      :missing
    end
  end

  def link!
    ensure_target_directory

    if erb?
      log(:yellow, "generating #{self}")
      contents = ERB.new(File.read(file)).result(binding)

      log(:blue, "writing #{self}")
      File.open(target, "w") do |out|
        out << contents
      end
    else
      log(:blue, "linking #{self}")
      FileUtils.ln_s(File.absolute_path(file), target)
    end
  end

  def replace!
    FileUtils.rm_rf(target)
    link!
  end

  def ensure_target_directory
    directory = File.dirname(target)
    return if File.directory?(directory)

    log(:magenta, "creating #{File.dirname(name)}")
    FileUtils.mkdir_p(directory)
  end
end
