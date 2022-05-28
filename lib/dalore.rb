# frozen_string_literal: true

require_relative "dalore/version"
require_relative "dalore/utils"
require_relative "dalore/cli"

module Dalore
  class Error < StandardError; end

  # Your code goes here...
  def dalore_help
    puts "Dalore Robots Framework!!"
  end
end
