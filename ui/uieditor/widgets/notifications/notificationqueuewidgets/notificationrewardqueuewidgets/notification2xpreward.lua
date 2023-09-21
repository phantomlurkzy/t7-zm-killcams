-- d41d8cd98f00b204e9800998ecf8427e
-- This hash is used for caching, delete to decompile the file again

CoD.Notification2xpReward = InheritFrom( LUI.UIElement )
CoD.Notification2xpReward.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Notification2xpReward )
	self.id = "Notification2xpReward"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 48 )
	self:setTopBottom( true, false, 0, 48 )
	
	local XpSmall = LUI.UIImage.new()
	XpSmall:setLeftRight( false, false, -31, 31 )
	XpSmall:setTopBottom( true, false, 0, 31 )
	XpSmall:setRGB( 0.04, 0.8, 1 )
	XpSmall:setImage( RegisterImage( "uie_t7_hud_mp_notifications_xp" ) )
	self:addElement( XpSmall )
	self.XpSmall = XpSmall
	
	local XPLabel = LUI.UIText.new()
	XPLabel:setLeftRight( true, false, -76, 124 )
	XPLabel:setTopBottom( true, false, 15, 33 )
	--XPLabel:setText( Engine.Localize( "MENU_XP_CAPS" ) )
	XPLabel:setTTF( "fonts/escom.ttf" )
	XPLabel:setAlpha( 1 )
	XPLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	XPLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( XPLabel )
	self.XPLabel = XPLabel
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				XPLabel:completeAnimation()
				self.XPLabel:setLeftRight( true, false, -76, 124 )
				self.XPLabel:setTopBottom( true, false, 15, 33 )
				self.clipFinished( XPLabel, {} )
			end,
			TimeUp = function ()
				self:setupElementClipCounter( 0 )
			end,
			Combined = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		french = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				XPLabel:completeAnimation()
				self.XPLabel:setLeftRight( true, false, -76, 124 )
				self.XPLabel:setTopBottom( true, false, 17, 31 )
				self.XPLabel:setRGB( 1, 1, 1 )
				--self.XPLabel:setText( Engine.Localize( AppendLocalizeString( "MENU_XP_CAPS", "2" ) ) )
				self.clipFinished( XPLabel, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "french",
			condition = function ( menu, element, event )
				return IsCurrentLanguageFrench()
			end
		}
	} )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

