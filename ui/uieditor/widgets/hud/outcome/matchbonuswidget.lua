-- d41d8cd98f00b204e9800998ecf8427e
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.PrematchCountdown.PrematchCountdown_BeginsIn" )
require( "ui.uieditor.widgets.HUD.PrematchCountdown.PrematchCountdown_Title" )

CoD.MatchBonusWidget = InheritFrom( LUI.UIElement )
CoD.MatchBonusWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MatchBonusWidget )
	self.id = "MatchBonusWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 284 )
	self:setTopBottom( true, false, 0, 129 )
	self.anyChildUsesUpdateState = true
	
	local XpIcon0 = LUI.UIImage.new()
	XpIcon0:setLeftRight( false, false, -31, 31 )
	XpIcon0:setTopBottom( true, false, 0, 62 )
	XpIcon0:setRGB( 0.04, 0.8, 1 )
	XpIcon0:setImage( RegisterImage( "uie_t7_hud_mp_notifications_xp" ) )
	XpIcon0:setAlpha( 1 )
	self:addElement( XpIcon0 )
	self.XpIcon0 = XpIcon0
	
	local MatchBonusNew0 = CoD.PrematchCountdown_BeginsIn.new( menu, controller )
	MatchBonusNew0:setLeftRight( false, false, -142, 142 )
	MatchBonusNew0:setTopBottom( true, false, 96, 128 )
	MatchBonusNew0.FEButtonPanel0:setAlpha( 0.7 )
	MatchBonusNew0.Glow:setRGB( 0.04, 0.8, 1 )
	MatchBonusNew0.Glow:setAlpha( 0.12 )
	MatchBonusNew0.MatchText:setRGB( 0.04, 0.8, 1 )
	MatchBonusNew0.MatchText:setTTF( "fonts/escom.ttf" )
	MatchBonusNew0:subscribeToGlobalModel( controller, "GameScore", "matchBonus", function ( modelRef )
		local matchBonus = Engine.GetModelValue( modelRef )
		if matchBonus then
			MatchBonusNew0.MatchText:setText( Engine.Localize( matchBonus ) )
		end
	end )
	self:addElement( MatchBonusNew0 )
	self.MatchBonusNew0 = MatchBonusNew0
	
	local MatchBonusTitleNew0 = CoD.PrematchCountdown_Title.new( menu, controller )
	MatchBonusTitleNew0:setLeftRight( false, false, -116, 116 )
	MatchBonusTitleNew0:setTopBottom( true, false, 63.39, 95.6 )
	MatchBonusTitleNew0.MatchText:setText( Engine.Localize( "MPUI_MATCHBONUS_CAPS" ) )
	MatchBonusTitleNew0:setAlpha( 1 )
	self:addElement( MatchBonusTitleNew0 )
	self.MatchBonusTitleNew0 = MatchBonusTitleNew0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				XpIcon0:completeAnimation()
				self.XpIcon0:setAlpha( 0 )
				self.clipFinished( XpIcon0, {} )
				MatchBonusNew0:completeAnimation()
				self.MatchBonusNew0:setAlpha( 0 )
				self.clipFinished( MatchBonusNew0, {} )
				MatchBonusTitleNew0:completeAnimation()
				self.MatchBonusTitleNew0:setAlpha( 0 )
				self.clipFinished( MatchBonusTitleNew0, {} )
			end,
			Show_Two_Team = function ()
				self:setupElementClipCounter( 0 )
			end,
			End_Transition = function ()
				self:setupElementClipCounter( 0 )
			end,
			ShowFFAOutcome = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Shown = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				local f7_local0 = function ( f3_arg0, f3_arg1 )
					local f3_local0 = function ( f15_arg0, f15_arg1 )
						local f15_local0 = function ( f2_arg0, f2_arg1 )
							if not f2_arg1.interrupted then
								f2_arg0:beginAnimation( "keyframe", 50, false, true, CoD.TweenType.Bounce )
							end
							f2_arg0:setAlpha( 1 )
							if f2_arg1.interrupted then
								self.clipFinished( f2_arg0, f2_arg1 )
							else
								f2_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f15_arg1.interrupted then
							f15_local0( f15_arg0, f15_arg1 )
							return 
						else
							f15_arg0:beginAnimation( "keyframe", 50, false, true, CoD.TweenType.Bounce )
							f15_arg0:setAlpha( 0.2 )
							f15_arg0:registerEventHandler( "transition_complete_keyframe", f15_local0 )
						end
					end
					
					if f3_arg1.interrupted then
						f3_local0( f3_arg0, f3_arg1 )
						return 
					else
						f3_arg0:beginAnimation( "keyframe", 50, false, true, CoD.TweenType.Bounce )
						f3_arg0:setAlpha( 1 )
						f3_arg0:registerEventHandler( "transition_complete_keyframe", f3_local0 )
					end
				end
				
				XpIcon0:completeAnimation()
				self.XpIcon0:setAlpha( 0 )
				f7_local0( XpIcon0, {} )
				local f7_local1 = function ( f4_arg0, f4_arg1 )
					local f4_local0 = function ( f6_arg0, f6_arg1 )
						local f6_local0 = function ( f8_arg0, f8_arg1 )
							local f8_local0 = function ( f12_arg0, f12_arg1 )
								if not f12_arg1.interrupted then
									f12_arg0:beginAnimation( "keyframe", 49, false, true, CoD.TweenType.Bounce )
								end
								f12_arg0:setAlpha( 1 )
								if f12_arg1.interrupted then
									self.clipFinished( f12_arg0, f12_arg1 )
								else
									f12_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if f8_arg1.interrupted then
								f8_local0( f8_arg0, f8_arg1 )
								return 
							else
								f8_arg0:beginAnimation( "keyframe", 50, false, true, CoD.TweenType.Bounce )
								f8_arg0:setAlpha( 0.2 )
								f8_arg0:registerEventHandler( "transition_complete_keyframe", f8_local0 )
							end
						end
						
						if f6_arg1.interrupted then
							f6_local0( f6_arg0, f6_arg1 )
							return 
						else
							f6_arg0:beginAnimation( "keyframe", 49, false, true, CoD.TweenType.Bounce )
							f6_arg0:setAlpha( 1 )
							f6_arg0:registerEventHandler( "transition_complete_keyframe", f6_local0 )
						end
					end
					
					if f4_arg1.interrupted then
						f4_local0( f4_arg0, f4_arg1 )
						return 
					else
						f4_arg0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						f4_arg0:registerEventHandler( "transition_complete_keyframe", f4_local0 )
					end
				end
				
				MatchBonusNew0:completeAnimation()
				self.MatchBonusNew0:setAlpha( 0 )
				f7_local1( MatchBonusNew0, {} )
				local f7_local2 = function ( f5_arg0, f5_arg1 )
					local f5_local0 = function ( f8_arg0, f8_arg1 )
						local f8_local0 = function ( f101_arg0, f101_arg1 )
							local f101_local0 = function ( f105_arg0, f105_arg1 )
								if not f105_arg1.interrupted then
									f105_arg0:beginAnimation( "keyframe", 49, false, true, CoD.TweenType.Bounce )
								end
								f105_arg0:setAlpha( 1 )
								if f105_arg1.interrupted then
									self.clipFinished( f105_arg0, f105_arg1 )
								else
									f105_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if f101_arg1.interrupted then
								f101_local0( f101_arg0, f101_arg1 )
								return 
							else
								f101_arg0:beginAnimation( "keyframe", 49, false, true, CoD.TweenType.Bounce )
								f101_arg0:setAlpha( 0.2 )
								f101_arg0:registerEventHandler( "transition_complete_keyframe", f101_local0 )
							end
						end
						
						if f8_arg1.interrupted then
							f8_local0( f8_arg0, f8_arg1 )
							return 
						else
							f8_arg0:beginAnimation( "keyframe", 50, false, true, CoD.TweenType.Bounce )
							f8_arg0:setAlpha( 1 )
							f8_arg0:registerEventHandler( "transition_complete_keyframe", f8_local0 )
						end
					end
					
					if f5_arg1.interrupted then
						f5_local0( f5_arg0, f5_arg1 )
						return 
					else
						f5_arg0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						f5_arg0:registerEventHandler( "transition_complete_keyframe", f5_local0 )
					end
				end
				
				MatchBonusTitleNew0:completeAnimation()
				self.MatchBonusTitleNew0:setAlpha( 0 )
				f7_local2( MatchBonusTitleNew0, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Shown",
			condition = function ( menu, element, event )
				return false
			end
		},
		{
			stateName = "DoubleXP",
			condition = function ( menu, element, event )
				return true
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "gameScore.isRoundEnd" ), function ( modelRef )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( modelRef ),
			modelName = "gameScore.isRoundEnd"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "gameScore.matchBonus" ), function ( modelRef )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( modelRef ),
			modelName = "gameScore.matchBonus"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.MatchBonusNew0:close()
		element.MatchBonusTitleNew0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

