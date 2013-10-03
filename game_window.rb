class GameWindow < Gosu::Window

  def initialize
    super(600,300,false)
    @player = Player.new(self)
    @bullets = [Bullet.new(self), Bullet.new(self)]
    @bullets = 2.times.map {Bullet.new(self)}
    @running = true
    @font = Gosu::Font.new(self, Gosu::default_font_name, 20)
  end

  def update
    if @running
      if @player.hit_by? @bullets
        @running = false
      else
        run_game
      end
    end

    if @running == false and button_down? Gosu::Button::KbR and @player.lives > 0
      @running = true
      @player.reset_position
    end
  end

  def run_game
    @bullets.each {|bullet| bullet.update}
    @player.update
  end

  def draw
    @player.draw
    @bullets.each {|bullet| bullet.draw}
    @font.draw("Lives: #{@player.lives}", 10, 10, 3.0, 1.0, 1.0, 0xffffffff)
  end

end
