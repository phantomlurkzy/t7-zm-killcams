-- d41d8cd98f00b204e9800998ecf8427e
-- This hash is used for caching, delete to decompile the file again

CoD.KillcamWidgetNumbers = InheritFrom( LUI.UIElement )
CoD.KillcamWidgetNumbers.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.KillcamWidgetNumbers )
	self.id = "KillcamWidgetNumbers"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 160 )
	self:setTopBottom( true, false, 0, 70 )
	
	local Numbers = LUI.UIText.new()
	Numbers:setLeftRight( false, false, -80, 80 )
	Numbers:setTopBottom( true, true, 0, 0 )
	Numbers:setRGB( 0.59, 0.64, 0.74 )
	Numbers:setText( Engine.Localize( "XX" ) )
	Numbers:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	Numbers:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Numbers:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Numbers )
	self.Numbers = Numbers
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			Start = function ()
				self:setupElementClipCounter( 1 )
				local f6_local0 = function ( f2_arg0, f2_arg1 )
					if not f2_arg1.interrupted then
						f2_arg0:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
					end
					f2_arg0:setAlpha( 1 )
					if f2_arg1.interrupted then
						self.clipFinished( f2_arg0, f2_arg1 )
					else
						f2_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Numbers:completeAnimation()
				self.Numbers:setAlpha( 0 )
				f6_local0( Numbers, {} )
			end
		},
		WinTime = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Numbers:completeAnimation()
				self.Numbers:setRGB( 0.05, 1, 0 )
				self.Numbers:setAlpha( 0.7 )
				self.clipFinished( Numbers, {} )
			end
		},
		LossTime = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Numbers:completeAnimation()
				self.Numbers:setRGB( 1, 0.01, 0 )
				self.Numbers:setAlpha( 0.7 )
				self.clipFinished( Numbers, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

