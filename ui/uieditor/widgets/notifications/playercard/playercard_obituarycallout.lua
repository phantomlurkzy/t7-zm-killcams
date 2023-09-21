-- d41d8cd98f00b204e9800998ecf8427e
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Notifications.PlayerCard.PlayerCard" )

CoD.PlayerCard_ObituaryCallout = InheritFrom( LUI.UIElement )
CoD.PlayerCard_ObituaryCallout.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PlayerCard_ObituaryCallout )
	self.id = "PlayerCard_ObituaryCallout"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 305 )
	self:setTopBottom( true, false, 0, 59 )
	self.anyChildUsesUpdateState = true
	
	local PlayerCard0 = CoD.PlayerCard.new( menu, controller )
	PlayerCard0:setLeftRight( true, false, 0, 305 )
	PlayerCard0:setTopBottom( true, false, 0, 59 )
	PlayerCard0.CalloutHeading:setText( Engine.Localize( "CGAME_KILLED" ) )
	PlayerCard0:mergeStateConditions( {
		{
			stateName = "Calingcard",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	self:addElement( PlayerCard0 )
	self.PlayerCard0 = PlayerCard0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				PlayerCard0:completeAnimation()
				self.PlayerCard0:setAlpha( 0 )
				self.clipFinished( PlayerCard0, {} )
			end,
			Bottom = function ()
				self:setupElementClipCounter( 1 )
				local f4_local0 = function ( f19_arg0, f19_arg1 )
					local f19_local0 = function ( f20_arg0, f20_arg1 )
						local f20_local0 = function ( f22_arg0, f22_arg1 )
							local f22_local0 = function ( f23_arg0, f23_arg1 )
								local f23_local0 = function ( f25_arg0, f25_arg1 )
									if not f25_arg1.interrupted then
										f25_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
									end
									f25_arg0:setLeftRight( true, false, 0, 276 )
									f25_arg0:setTopBottom( true, false, 0, 59 )
									f25_arg0:setAlpha( 0 )
									if f25_arg1.interrupted then
										self.clipFinished( f25_arg0, f25_arg1 )
									else
										f25_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if f23_arg1.interrupted then
									f23_local0( f23_arg0, f23_arg1 )
									return 
								else
									f23_arg0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
									f23_arg0:setAlpha( 1 )
									f23_arg0:registerEventHandler( "transition_complete_keyframe", f23_local0 )
								end
							end
							
							if f22_arg1.interrupted then
								f22_local0( f22_arg0, f22_arg1 )
								return 
							else
								f22_arg0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
								f22_arg0:setAlpha( 0 )
								f22_arg0:registerEventHandler( "transition_complete_keyframe", f22_local0 )
							end
						end
						
						if f20_arg1.interrupted then
							f20_local0( f20_arg0, f20_arg1 )
							return 
						else
							f20_arg0:beginAnimation( "keyframe", 2080, false, false, CoD.TweenType.Linear )
							f20_arg0:registerEventHandler( "transition_complete_keyframe", f20_local0 )
						end
					end
					
					if f19_arg1.interrupted then
						f19_local0( f19_arg0, f19_arg1 )
						return 
					else
						f19_arg0:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Linear )
						f19_arg0:setTopBottom( true, false, 0, 59 )
						f19_arg0:setAlpha( 1 )
						f19_arg0:registerEventHandler( "transition_complete_keyframe", f19_local0 )
					end
				end
				
				PlayerCard0:completeAnimation()
				self.PlayerCard0:setLeftRight( true, false, 0, 276 )
				self.PlayerCard0:setTopBottom( true, false, 56, 115 )
				self.PlayerCard0:setAlpha( 0 )
				f4_local0( PlayerCard0, {} )
			end
		},
		HideForCodCaster = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				PlayerCard0:completeAnimation()
				self.PlayerCard0:setAlpha( 0 )
				self.clipFinished( PlayerCard0, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				PlayerCard0:completeAnimation()
				self.PlayerCard0:setAlpha( 0 )
				self.clipFinished( PlayerCard0, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "HideForCodCaster",
			condition = function ( menu, element, event )
				local f7_local0 = IsCodCaster( controller )
				if f7_local0 then
					f7_local0 = not IsCodCasterProfileValueEqualTo( controller, "shoutcaster_calloutcards", 1 )
				end
				return f7_local0
			end
		},
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				local f8_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN )
				if not f8_local0 then
					f8_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM )
					if not f8_local0 then
						f8_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_FINAL_KILLCAM )
						if not f8_local0 then
							f8_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED )
							if not f8_local0 then
								f8_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM )
								if not f8_local0 then
									f8_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM )
								end
							end
						end
					end
				end
				return f8_local0
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "factions.isCoDCaster" ), function ( modelRef )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( modelRef ),
			modelName = "factions.isCoDCaster"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CodCaster.profileSettingsUpdated" ), function ( modelRef )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( modelRef ),
			modelName = "CodCaster.profileSettingsUpdated"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ), function ( modelRef )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( modelRef ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ), function ( modelRef )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( modelRef ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_FINAL_KILLCAM ), function ( modelRef )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( modelRef ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_FINAL_KILLCAM
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ), function ( modelRef )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( modelRef ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), function ( modelRef )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( modelRef ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM ), function ( modelRef )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( modelRef ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.PlayerCard0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

