class BabyDragon
  def initialize(name, color: :gold)
    @color = color
    @color_options = [:blue, :red, :rainbow, :purple, :gold, :green]
    if !@color_options.include?(color)
      raise ArgumentError, "Color options are :blue, :red, :rainbow, :purple, :gold, and :green"
    end
    @name = name
    @hydration = 10
    @hungriness_level = 10
    @is_asleep = false
  end

  def drink
    @hydration = 10
    puts "Slow down there buddy! #{@name} drank an entire swimming pool!"

    process_time
  end

  def eat
    @hungriness_level = 10
    puts "#{@name} ate like 6 bags of marshmallows (yo...)"

    process_time
  end

  def sleep
    @is_asleep = true
    puts "#{@name} curled up and fell asleep"

    3.times { process_time }
  end

  def play
    puts "#{@name} takes out their yo-yo and walks a dog AND THEN JUMPS IN THE AIR AND FLIES"
    banner = File.read("ascii/play.txt")
    puts banner
    process_time
  end

  def do_a_trick
    case @color
    when :blue
      puts "#{@name} opened up their own microbrewery. You HAVE to try their IPAs."
    when :red
      puts "#{@name} hosts a barbecue!! They use their fire breath to cook the perfect burgers."
    when :rainbow
      puts "A UNICORN APPEARS!!!! They become best friends with #{@name}"
    when :purple
      puts "#{@name} just DISMANTLED the PATRIARCHY. Fight the power, baby dragon."
    when :gold
      puts "#{@name} takes their stash of gold and invests it in a mutual fund. It pays off."
      puts "How fiscally responsible!"
    when :green
      puts "#{@name} says RIBBIT like a FROG!!!!!"
    end
    process_time
  end

  def process_time
    puts "The passage of time moves on..."
    if @hungriness_level > 0 && @hydration > 0
      @hungriness_level -= 1
      @hydration -= 3
    elsif @hungriness_level <= 0 && @hydration <= 0
      if @is_asleep
        @is_asleep = false
        puts "#{@name} woke up!"
      end
      puts "#{@name} is weak."
      puts "They call to you in their final moments -- 'it's okay...i still love you.' "
      banner = File.read("ascii/i_still_love_you.txt")
      puts banner
      exit
    elsif @hungriness_level <= 0
      if @is_asleep
        @is_asleep = false
        puts "#{@name} woke up!"
        banner = File.read("ascii/wake_up.txt")
        puts banner
      end
      puts "#{@name} is hangry! They EAT YOU!"
      exit
    elsif @hydration <= 0
      if @is_asleep
        @is_asleep = false
        puts "#{@name} woke up!"
      end
      puts "#{@name} coughs and BURNS YOUR HOUSE DOWN!!!!!!!"
      banner = File.read("ascii/fire_breathing.txt")
      puts banner
      exit
    end
  end
end

dees_dragon = BabyDragon.new("Robert", color: :rainbow)

dees_dragon.do_a_trick
dees_dragon.eat
dees_dragon.drink

dees_dragon.sleep

100.times do |i|
  puts "This is the #{i}th time playing:"
  dees_dragon.play
end
