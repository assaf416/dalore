require "json"

class Cli
  def initialize(params)
    @home_folder = "~/Dalore"
    @strategeis_folder = "/home/assaf/Dalore/strategies/"
    @datasets_folder = "~/Dalore/datasets/"

    puts "Dalore Bots framework"
    commands = ["setup", "new-strategy", "new-bot", "backtest", "run", "list-brokers", "list-datasets", "list-strategies", "list-bots"]
    command = params[0]
    if commands.include? command
      create_strategy params[1] if command == "new-strategy"
      init params[1] if command == "setup"
    else
      usage
    end
  end

  def camel_case(s)
    return s if s !~ /_/ && s =~ /[A-Z]+.*/
    s.split("_").map { |e| e.capitalize }.join
  end

  def usage
    puts " USAGE: "
    puts "  dalore setup "
    puts "  dalore new-strategy <strategy-name>"
    puts "  dalore backtest <strategy-name> [ -d=<data-set-file.txt>  -o=<logs> ]"
    puts "  dalore new-bot <bot-name>"
    puts "  dalore download-binance-dataset <symbol> "
    puts "  dalore download-iex-dataset <symbol>"
    puts "  dalore download-ib-dataset <symbol>"
    puts "  dalore list-brokers"
    puts "  dalore list-datasets"
    puts "  dalore list-strategies"
    puts "  dalore list-bots"
    puts "  dalore settings "
  end

  def test_strategy(name)
    stratgey_name = name.to_s.camel_case
    code = File.read("./empty_strategy.rb")
    code.gsub("MyStrategy", stratgey_name)
  end

  def create_strategy(name)
    classname = camel_case(name)
    stratgey_name = @strategeis_folder + name.to_s + ".rb"
    puts "Creating strategy file #{stratgey_name}"
    code = "
    class MyStrategy < BaseStrategy
      def on_start
      end
    
      def on_quote(quote)
      end
    
      def on_candle(candle)
      end
    
      def on_order_update(order)
      end
    end
    
    MyStrategy.new
    "
    File.open(stratgey_name, "w") { |file| file.write(code.gsub("MyStrategy", classname)) }
  end

  def init(folder = "~/Dalore")
    puts "Setting up folders"
    setup = {
      :home_folder => folder,
    }
    begin
      Dir.mkdir "#{setup[:home_folder]}"
      Dir.mkdir "#{setup[:home_folder]}/strategies"
      Dir.mkdir "#{setup[:home_folder]}/datasets"
    rescue
    end
    File.open("#{folder}/.dalore.conf.json", "w") { |file| file.write(setup.to_json) }
  end
end
