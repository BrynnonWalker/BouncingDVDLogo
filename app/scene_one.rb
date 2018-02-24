class SceneOne < SKScene
  include ScreenSizes

  attr_accessor :root

  def get_camera
    return @camera
  end

  # This method is invoked when a scene is presented.
  def didMoveToView _
    # Set the aspect ratio.
    self.scaleMode = SKSceneScaleModeAspectFit
    
    # Set the background color to black.
    self.backgroundColor = UIColor.blackColor
    
    $scene = self

    # Add a label to the scene.
    # A little bit of context. The primary class that is used to construct a label
    # is called SKLabelNode. Unfortunately, SKLabelNode does not support multiline text,
    # so some supporting classes have been included to help you create multiline labels,
    # specifically StringWrapper and the `add_label` method. Fun huh?
    add_label <<-HERE
    HERE

    @camera = Camera.new self
    @camera.scale_rate = 0.1

    # Add sprite (which will be updated in the render loop).
    # Assets are located inside of the resources folder.
    @logo = add_sprite device_screen_width.fdiv(2),
                         device_screen_height.fdiv(2),
                         'DVD_Logo.png'

    @logo.xScale = 0.5
    @logo.yScale = 0.5
    @logo.colorBlendFactor = 1.0
    @velocity = CGPointMake 1.5, 1.5
  end

  def wrap wrap_length, text
    StringWrapper.wrap wrap_length, text
  end

  def add_label text
    font_size = 16
    wrapped_text = wrap 38, text
    wrapped_text.each_with_index do |s, i|
      label = SKLabelNode.labelNodeWithText s
      label.fontName = 'Courier'
      label.fontColor = UIColor.whiteColor
      label.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft
      label.fontSize = font_size
      label.position = CGPointMake(10,
                                   device_screen_height - ((i + 1) * font_size))
      addChild label
    end
  end

  # This delegate is invoked when the scene receives a touch event.
  # When this class was constructed in GameViewController. A property was
  # set that linked this scene with the parent (being the GameViewController).
  # Using this wireup, we are telling GameViewController to present scene two.
  def touchesBegan touches, withEvent: _

  end

  def add_sprite x, y, path
    # Sprites are created using a texture. So first we have to create a
    # texture from the png in the /resources directory.
    texture = SKTexture.textureWithImageNamed path

    # Then we can create the sprite and set it's location.
    sprite = SKSpriteNode.spriteNodeWithTexture texture
    sprite.position = CGPointMake x, y
    addChild sprite
    sprite
  end

  def at_edge?

    logo_min = CGPointMake @logo.position.x - @logo.size.width * @logo.xScale,
                           @logo.position.y - @logo.size.height * @logo.yScale
    logo_max = CGPointMake @logo.position.x + @logo.size.width * @logo.xScale,
                           @logo.position.y + @logo.size.height * @logo.yScale

    return (logo_min.x <= 0) || (logo_max.x >= device_screen_width),
        (logo_min.y <= 0) || (logo_max.y >= device_screen_height)

  end

  def change_color
    # ensure a ratio of 2 bright and 1 dark for a saturated, bright-ish color
    color_distribution = [rand(0.85..1.0), rand(0.0..0.15), rand(0.5..1.0)]

    # shuffle and distribute randomly amongst RGB
    color_distribution.shuffle!

    @logo.color = UIColor.alloc.initWithRed(color_distribution[0],
                                            green: color_distribution[1],
                                            blue: color_distribution[2],
                                            alpha: 1.0)
  end

  def update_sprite

    # check for edge collision
    # flip velocity and change color on bounce
    edge_check = at_edge?

    if edge_check[0]
      @velocity.x *= -1
      change_color
    end

    if edge_check[1]
      @velocity.y *= -1
      change_color
    end

    # move sprite
    @logo.position = CGPointMake @logo.position.x + @velocity.x, @logo.position.y + @velocity.y

  end

  def update _
    update_sprite
  end

end
