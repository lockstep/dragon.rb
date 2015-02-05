class String
  def align_left
    string = dup
    relevant_lines = string.split(/\r\n|\r|\n/).select { |line| line.size > 0 }
    indentation_levels = relevant_lines.map do |line|
      match = line.match(/^( +)[^ ]+/)
      match ? match[1].size : 0
    end
    indentation_level = indentation_levels.min
    string.gsub! /^#{' ' * indentation_level}/, '' if indentation_level > 0
    string
  end

  def nuance_applescript_removed
    string = dup
    # These lines will not compile when run outside of Dictate, so we won't test
    # them in the compiler spec. All other lines should compile independently.
    nuance_scripts = ['show express editor']
    lines = string.split(/\r\n|\r|\n/)
    lines.reject { |l| nuance_scripts.include? l.strip }.join("\n")
  end
end
