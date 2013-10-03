class Bullet
    attr_reader :x, :y

    def initialize(window)
        @window = window
        @icon = Gosu::Image.new(@window, 'bullet.png', true)
        @y = 0
        @x = rand(@window.width)
    end
    
    def update
        @y = @y + 10
        if @y > @window.width
            @y = 0
            @x = rand(@window.width)    
        end
    end
    
    def draw
        @icon.draw(@x, @y, 3)
    end
end