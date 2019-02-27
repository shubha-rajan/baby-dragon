class BabyDragon
  def display_ascii(filepath)
    banner = File.read(filepath)
    puts banner
  end

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
    display_ascii("ascii/sleeping.txt")
    3.times { process_time }
  end

  def play
    puts "#{@name} takes out their yo-yo and walks a dog AND THEN JUMPS IN THE AIR AND FLIES"
    display_ascii("ascii/play.txt")
    process_time
  end

  def do_a_trick
    case @color
    when :blue
      puts "#{@name} opened up their own microbrewery. You HAVE to try their IPAs."
      display_ascii("ascii/beer.txt")
    when :red
      puts "#{@name} hosts a barbecue!! They use their fire breath to cook the perfect burgers."
    when :rainbow
      puts "A UNICORN APPEARS!!!! They become best friends with #{@name}"
      display_ascii("ascii/unicorn.txt")
    when :purple
      puts "#{@name} just DISMANTLED the PATRIARCHY. Fight the power, baby dragon."
      display_ascii("ascii/raised_fist.txt")
    when :gold
      puts "#{@name} takes their stash of gold and invests it in a mutual fund. It pays off."
      puts "How fiscally responsible!"
      display_ascii("ascii/money.txt")
    when :green
      puts "#{@name} says RIBBIT like a FROG!!!!!"
      display_ascii("ascii/frog.txt")
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
      display_ascii("ascii/i_still_love_you.txt")
      exit
    elsif @hungriness_level <= 0
      if @is_asleep
        @is_asleep = false
        puts "#{@name} woke up!"
        display_ascii("ascii/wake_up.txt")
      end
      puts "#{@name} is hangry! They EAT YOU!"
      display_ascii("ascii/you_get_eaten.txt")
      exit
    elsif @hydration <= 0
      if @is_asleep
        @is_asleep = false
        puts "#{@name} woke up!"
      end
      puts "#{@name} coughs and BURNS YOUR HOUSE DOWN!!!!!!!"
      display_ascii("ascii/fire_breathing.txt")
      exit
    end
  end
end

dees_dragon = BabyDragon.new("Robert", color: :purple)

dees_dragon.do_a_trick
dees_dragon.eat
dees_dragon.drink

dees_dragon.sleep
