class Arena
  ACTIONS = ["attack", "use_potion"].freeze
  # 3. add a reader for both player and enemy
  # enter code here
  attr_reader :player, :enemy

  def initialize(player:, enemy:)
    # 2. Create an instance variable for player and enemy
    # enter code here
    @player = player
    @enemy = enemy
  end

  def start
    puts "Welcome to the Arena!"
    puts "You are fighting #{enemy.name}!"
    while player.hp > 0 && enemy.hp > 0
      # 4. Implement actions where Player and Enemey will both fight. Player and Enemy will do a random action.
      # ACTIONS are: attack and use_potion
      # enter code here

      # player action
      make_action(ACTIONS.sample, player, enemy)

      # enemy action
      make_action(ACTIONS.sample, enemy, player)

      puts "Your health: #{player.hp}"
      puts "#{enemy.name}'s health: #{enemy.hp}"
    end

    if player.hp > 0
      puts "You win!"
    else
      puts "You lose!"
    end
  end

  private

    def make_action(action, attacker, target)
      if action == "use_potion" && attacker.potions > 0
        attacker.use_potion
      else
        self.attack(attacker, target)
      end
    end

    def attack(attacker, target)
      damage = attacker.atk - target.def
      target.hp -= damage

      puts "#{attacker.name} attacks #{target.name} for #{damage} damage!"
    end

    # 5.Challenge: Create a method where player can defend
    # Specs: Defending can make the defender's defense x1.5 in 1 turn
end
