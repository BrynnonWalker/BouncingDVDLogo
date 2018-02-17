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

    $scene = self

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

    @spriteMoveState = 0
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

  def update_sprite_color
  end

  def update_sprite_position

    # choose new corner state
    # move to corner state(s) #4
    #
  end

  def update _
    #update_color
    update_sprite_position
    #@camera.update
  end

end
