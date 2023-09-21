-- d41d8cd98f00b204e9800998ecf8427e
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.Killcam.KillcamHeader" )
require( "ui.uieditor.widgets.EndGameFlow.KillcamWidgetFctnPnl" )
require( "ui.uieditor.widgets.EndGameFlow.KillcamWidgetVignetteTop" )
require( "ui.uieditor.widgets.EndGameFlow.OutcomeFactionIcon" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponNameWidget" )
require( "ui.uieditor.menus.hud.killcam_playercard" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	
end

CoD.FinalKillcamWidget = InheritFrom( LUI.UIElement )
CoD.FinalKillcamWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FinalKillcamWidget )
	self.id = "FinalKillcamWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local Header = CoD.KillcamHeader.new( menu, controller )
	Header:setLeftRight( false, false, -640, 640 )
	Header:setTopBottom( true, false, 0, 128 )
	self:addElement( Header )
	self.Header = Header
	
	local KillcamWidgetFctnPnl0 = CoD.KillcamWidgetFctnPnl.new( menu, controller )
	KillcamWidgetFctnPnl0:setLeftRight( true, false, 0, 400 )
	KillcamWidgetFctnPnl0:setTopBottom( true, false, 0, 200 )
	KillcamWidgetFctnPnl0:setRGB( 0.44, 0.44, 0.44 )
	self:addElement( KillcamWidgetFctnPnl0 )
	self.KillcamWidgetFctnPnl0 = KillcamWidgetFctnPnl0
	
	local Footer = CoD.KillcamWidgetVignetteTop.new( menu, controller )
	Footer:setLeftRight( false, false, -640, 640 )
	Footer:setTopBottom( false, false, 268, 380 )
	Footer:setAlpha( 0.7 )
	Footer:setXRot( 180 )
	self:addElement( Footer )
	self.Footer = Footer
	
	--[[local WinnerFactionInfo = CoD.WinnerFactionInfo.new( menu, controller )
	WinnerFactionInfo:setLeftRight( true, false, 0, 390 )
	WinnerFactionInfo:setTopBottom( true, false, 0, 180 )
	WinnerFactionInfo.OutcomeFactionIcon.OutcomeFactionIconItem.WinningTeamFactionIcon0:setImage( RegisterImage( "uie_t7_mp_hud_faction_icon_faction1" ) )
	WinnerFactionInfo.OutcomeFactionIcon.OutcomeFactionIconItem.WinningTeamFactionIcon:setImage( RegisterImage( "uie_t7_mp_hud_faction_icon_faction1" ) )
	self:addElement( WinnerFactionInfo )
	self.WinnerFactionInfo = WinningTeamFactionIconNew]]

	local WinningTeamFactionIconNew = CoD.OutcomeFactionIcon.new( menu, controller )
	WinningTeamFactionIconNew:setLeftRight( false, false, -600, 450 )
	WinningTeamFactionIconNew:setTopBottom( false, false, -360, 280 )
	WinningTeamFactionIconNew:setAlpha( 1 )
	WinningTeamFactionIconNew.OutcomeFactionIconItem.WinningTeamFactionIcon:setImage( RegisterImage( "faction_allies" ) )
	WinningTeamFactionIconNew.OutcomeFactionIconItem.WinningTeamFactionIcon0:setImage( RegisterImage( "faction_allies" ) )
	self:addElement( WinningTeamFactionIconNew )
	self.WinningTeamFactionIconNew = WinningTeamFactionIconNew

	local WinningTeamFactionNameNew = CoD.WeaponNameWidget.new( menu, controller )
	WinningTeamFactionNameNew:setLeftRight( false, false, -460, -134 )
	WinningTeamFactionNameNew:setTopBottom( false, false, -295, -265 )
	WinningTeamFactionNameNew:setScale( 1 )
	WinningTeamFactionNameNew.weaponNameLabel:setText( Engine.Localize( "SURVIVORS" ) )
	WinningTeamFactionNameNew:subscribeToModel(Engine.GetModel(Engine.GetModelForController(controller), "hideFactionInfo"), function(modelRef) 
		local boolean = Engine.GetModelValue(modelRef)
		WinningTeamFactionNameNew:setAlpha( boolean )
	end)
	self:addElement( WinningTeamFactionNameNew )
	self.WinningTeamFactionNameNew = WinningTeamFactionNameNew

	local playercard = CoD.killcam_playercard.new(menu, controller)
	playercard:setLeftRight( true, false, 67, 375 )
	playercard:setTopBottom( false, true, -93, -34 )
	self.playercard = playercard
	self:addElement( self.playercard )

	local BlackForeground = LUI.UIImage.new()
	BlackForeground:setLeftRight( true, true, 0, 0 )
	BlackForeground:setTopBottom( true, true, 0, 0 )
	BlackForeground:setRGB( 0, 0, 0 )
	BlackForeground:setAlpha( 0 )
	self:addElement( BlackForeground )
	self.BlackForeground = BlackForeground
	
	local TransitionImageBottom = LUI.UIImage.new()
	TransitionImageBottom:setLeftRight( true, true, 0, 0 )
	TransitionImageBottom:setTopBottom( false, true, -302.4, 57.6 )
	TransitionImageBottom:setRGB( 0, 0, 0 )
	TransitionImageBottom:setAlpha( 0 )
	self:addElement( TransitionImageBottom )
	self.TransitionImageBottom = TransitionImageBottom
	
	local TransitionImageTop = LUI.UIImage.new()
	TransitionImageTop:setLeftRight( true, true, 0, 0 )
	TransitionImageTop:setTopBottom( true, false, -57.6, 302.4 )
	TransitionImageTop:setRGB( 0, 0, 0 )
	TransitionImageTop:setAlpha( 0 )
	self:addElement( TransitionImageTop )
	self.TransitionImageTop = TransitionImageTop
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				Header:completeAnimation()
				self.Header:setAlpha( 0 )
				self.clipFinished( Header, {} )
				KillcamWidgetFctnPnl0:completeAnimation()
				self.KillcamWidgetFctnPnl0:setAlpha( 0 )
				self.clipFinished( KillcamWidgetFctnPnl0, {} )
				Footer:completeAnimation()
				self.Footer:setAlpha( 0 )
				self.clipFinished( Footer, {} )
				playercard:completeAnimation()
				self.playercard:setAlpha( 0 )
				self.clipFinished( playercard, {} )
				WinningTeamFactionIconNew:completeAnimation()
				self.WinningTeamFactionIconNew:setAlpha( 0 )
				self.clipFinished( WinningTeamFactionIconNew, {} )
				BlackForeground:completeAnimation()
				self.BlackForeground:setAlpha( 0 )
				self.clipFinished( BlackForeground, {} )
			end
		},
		FinalKillcam = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				local f10_local0 = function ( f36_arg0, f36_arg1 )
					local f36_local0 = function ( f42_arg0, f42_arg1 )
						local f42_local0 = function ( f43_arg0, f43_arg1 )
							if not f43_arg1.interrupted then
								f43_arg0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Bounce )
							end
							f43_arg0:setLeftRight( false, false, -640, 640 )
							f43_arg0:setTopBottom( true, false, 0, 128 )
							f43_arg0:setAlpha( 1 )
							if f43_arg1.interrupted then
								self.clipFinished( f43_arg0, f43_arg1 )
							else
								f43_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f42_arg1.interrupted then
							f42_local0( f42_arg0, f42_arg1 )
							return 
						else
							f42_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Bounce )
							f42_arg0:setAlpha( 0.51 )
							f42_arg0:registerEventHandler( "transition_complete_keyframe", f42_local0 )
						end
					end
					
					if f36_arg1.interrupted then
						f36_local0( f36_arg0, f36_arg1 )
						return 
					else
						f36_arg0:beginAnimation( "keyframe", 349, false, true, CoD.TweenType.Linear )
						f36_arg0:setTopBottom( true, false, 0, 128 )
						f36_arg0:setAlpha( 1 )
						f36_arg0:registerEventHandler( "transition_complete_keyframe", f36_local0 )
					end
				end
				
				Header:completeAnimation()
				self.Header:setLeftRight( false, false, -640, 640 )
				self.Header:setTopBottom( true, false, -40, 88 )
				self.Header:setAlpha( 0 )
				f10_local0( Header, {} )
				local f10_local1 = function ( f37_arg0, f37_arg1 )
					if not f37_arg1.interrupted then
						f37_arg0:beginAnimation( "keyframe", 400, false, true, CoD.TweenType.Linear )
					end
					f37_arg0:setAlpha( 1 )
					if f37_arg1.interrupted then
						self.clipFinished( f37_arg0, f37_arg1 )
					else
						f37_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				KillcamWidgetFctnPnl0:completeAnimation()
				self.KillcamWidgetFctnPnl0:setAlpha( 0 )
				f10_local1( KillcamWidgetFctnPnl0, {} )
				local f10_local3 = function ( f39_arg0, f39_arg1 )
					local f39_local0 = function ( f59_arg0, f59_arg1 )
						local f59_local0 = function ( f61_arg0, f61_arg1 )
							local f61_local0 = function ( f63_arg0, f63_arg1 )
								if not f63_arg1.interrupted then
									f63_arg0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Bounce )
								end
								f63_arg0:setLeftRight( true, false, 67, 375 )
								f63_arg0:setTopBottom( false, true, -93, -34 )
								f63_arg0:setAlpha( 1 )
								if f63_arg1.interrupted then
									self.clipFinished( f63_arg0, f63_arg1 )
								else
									f63_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if f61_arg1.interrupted then
								f61_local0( f61_arg0, f61_arg1 )
								return 
							else
								f61_arg0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Bounce )
								f61_arg0:setAlpha( 0.44 )
								f61_arg0:registerEventHandler( "transition_complete_keyframe", f61_local0 )
							end
						end
						
						if f59_arg1.interrupted then
							f59_local0( f59_arg0, f59_arg1 )
							return 
						else
							f59_arg0:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Linear )
							f59_arg0:setAlpha( 1 )
							f59_arg0:registerEventHandler( "transition_complete_keyframe", f59_local0 )
						end
					end
					
					if f39_arg1.interrupted then
						f39_local0( f39_arg0, f39_arg1 )
						return 
					else
						f39_arg0:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
						f39_arg0:setLeftRight( true, false, 67, 375 )
						f39_arg0:setTopBottom( false, true, -93, -34 )
						f39_arg0:setAlpha( 0.96 )
						f39_arg0:registerEventHandler( "transition_complete_keyframe", f39_local0 )
					end
				end
				
				playercard:completeAnimation()
				self.playercard:setLeftRight( true, false, 64, 372 )
				self.playercard:setTopBottom( false, true, 12.5, 71.5 )
				self.playercard:setAlpha( 0 )
				f10_local3( playercard, {} )
				local f10_local2 = function ( f38_arg0, f38_arg1 )
					local f38_local0 = function ( f55_arg0, f55_arg1 )
						local f55_local0 = function ( f57_arg0, f57_arg1 )
							if not f57_arg1.interrupted then
								f57_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Bounce )
							end
							f57_arg0:setLeftRight( false, false, -640, 640 )
							f57_arg0:setTopBottom( false, false, 268, 380 )
							f57_arg0:setAlpha( 0.7 )
							if f57_arg1.interrupted then
								self.clipFinished( f57_arg0, f57_arg1 )
							else
								f57_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f55_arg1.interrupted then
							f55_local0( f55_arg0, f55_arg1 )
							return 
						else
							f55_arg0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Bounce )
							f55_arg0:setAlpha( 0.4 )
							f55_arg0:registerEventHandler( "transition_complete_keyframe", f55_local0 )
						end
					end
					
					if f38_arg1.interrupted then
						f38_local0( f38_arg0, f38_arg1 )
						return 
					else
						f38_arg0:beginAnimation( "keyframe", 280, false, true, CoD.TweenType.Linear )
						f38_arg0:setTopBottom( false, false, 268, 380 )
						f38_arg0:setAlpha( 0.7 )
						f38_arg0:registerEventHandler( "transition_complete_keyframe", f38_local0 )
					end
				end
				
				Footer:completeAnimation()
				self.Footer:setLeftRight( false, false, -640, 640 )
				self.Footer:setTopBottom( false, false, 316.5, 428.5 )
				self.Footer:setAlpha( 0 )
				f10_local2( Footer, {} )
				WinningTeamFactionIconNew:completeAnimation()
				WinningTeamFactionIconNew:subscribeToModel(Engine.GetModel(Engine.GetModelForController(controller), "hideFactionInfo"), function(modelRef) 
					local boolean = Engine.GetModelValue(modelRef)
					WinningTeamFactionIconNew:setAlpha( boolean )
				end)
				self.clipFinished( WinningTeamFactionIconNew, {} )
				BlackForeground:completeAnimation()
				self.BlackForeground:setAlpha( 0 )
				self.clipFinished( BlackForeground, {} )
				local f10_local4 = function ( f40_arg0, f40_arg1 )
					if not f40_arg1.interrupted then
						f40_arg0:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
					end
					f40_arg0:setLeftRight( true, true, 0, 0 )
					f40_arg0:setTopBottom( false, true, 0, 360 )
					f40_arg0:setAlpha( 0 )
					if f40_arg1.interrupted then
						self.clipFinished( f40_arg0, f40_arg1 )
					else
						f40_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TransitionImageBottom:completeAnimation()
				self.TransitionImageBottom:setLeftRight( true, true, 0, 0 )
				self.TransitionImageBottom:setTopBottom( false, true, -360, 0 )
				self.TransitionImageBottom:setAlpha( 1 )
				f10_local4( TransitionImageBottom, {} )
				local f10_local5 = function ( f41_arg0, f41_arg1 )
					if not f41_arg1.interrupted then
						f41_arg0:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
					end
					f41_arg0:setLeftRight( true, true, 0, 0 )
					f41_arg0:setTopBottom( true, false, -360, 0 )
					f41_arg0:setAlpha( 0 )
					if f41_arg1.interrupted then
						self.clipFinished( f41_arg0, f41_arg1 )
					else
						f41_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TransitionImageTop:completeAnimation()
				self.TransitionImageTop:setLeftRight( true, true, 0, 0 )
				self.TransitionImageTop:setTopBottom( true, false, 0, 360 )
				self.TransitionImageTop:setAlpha( 1 )
				f10_local5( TransitionImageTop, {} )
			end,
			End = function ()
				self:setupElementClipCounter( 6 )
				local f11_local0 = function ( f20_arg0, f20_arg1 )
					local f20_local0 = function ( f30_arg0, f30_arg1 )
						local f30_local0 = function ( f32_arg0, f32_arg1 )
							local f32_local0 = function ( f34_arg0, f34_arg1 )
								local f34_local0 = function ( f41_arg0, f41_arg1 )
									local f41_local0 = function ( f43_arg0, f43_arg1 )
										local f43_local0 = function ( f44_arg0, f44_arg1 )
											local f44_local0 = function ( f46_arg0, f46_arg1 )
												if not f46_arg1.interrupted then
													f46_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
												end
												f46_arg0:setAlpha( 0 )
												if f46_arg1.interrupted then
													self.clipFinished( f46_arg0, f46_arg1 )
												else
													f46_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if f44_arg1.interrupted then
												f44_local0( f44_arg0, f44_arg1 )
												return 
											else
												f44_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
												f44_arg0:setAlpha( 0.15 )
												f44_arg0:registerEventHandler( "transition_complete_keyframe", f44_local0 )
											end
										end
										
										if f43_arg1.interrupted then
											f43_local0( f43_arg0, f43_arg1 )
											return 
										else
											f43_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											f43_arg0:setAlpha( 0.1 )
											f43_arg0:registerEventHandler( "transition_complete_keyframe", f43_local0 )
										end
									end
									
									if f41_arg1.interrupted then
										f41_local0( f41_arg0, f41_arg1 )
										return 
									else
										f41_arg0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
										f41_arg0:setAlpha( 0.3 )
										f41_arg0:registerEventHandler( "transition_complete_keyframe", f41_local0 )
									end
								end
								
								if f34_arg1.interrupted then
									f34_local0( f34_arg0, f34_arg1 )
									return 
								else
									f34_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									f34_arg0:setAlpha( 0.55 )
									f34_arg0:registerEventHandler( "transition_complete_keyframe", f34_local0 )
								end
							end
							
							if f32_arg1.interrupted then
								f32_local0( f32_arg0, f32_arg1 )
								return 
							else
								f32_arg0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								f32_arg0:setAlpha( 0.14 )
								f32_arg0:registerEventHandler( "transition_complete_keyframe", f32_local0 )
							end
						end
						
						if f30_arg1.interrupted then
							f30_local0( f30_arg0, f30_arg1 )
							return 
						else
							f30_arg0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
							f30_arg0:setAlpha( 0.7 )
							f30_arg0:registerEventHandler( "transition_complete_keyframe", f30_local0 )
						end
					end
					
					if f20_arg1.interrupted then
						f20_local0( f20_arg0, f20_arg1 )
						return 
					else
						f20_arg0:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						f20_arg0:registerEventHandler( "transition_complete_keyframe", f20_local0 )
					end
				end
				
				Header:completeAnimation()
				self.Header:setAlpha( 1 )
				f11_local0( Header, {} )
				local f11_local1 = function ( f25_arg0, f25_arg1 )
					if not f25_arg1.interrupted then
						f25_arg0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					f25_arg0:setAlpha( 0 )
					if f25_arg1.interrupted then
						self.clipFinished( f25_arg0, f25_arg1 )
					else
						f25_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				KillcamWidgetFctnPnl0:completeAnimation()
				KillcamWidgetFctnPnl0:subscribeToModel(Engine.GetModel(Engine.GetModelForController(controller), "hideFactionInfo"), function(modelRef) 
					local boolean = Engine.GetModelValue(modelRef)
					KillcamWidgetFctnPnl0:setAlpha( boolean )
				end)
				f11_local1( KillcamWidgetFctnPnl0, {} )
				local f11_local2 = function ( f26_arg0, f26_arg1 )
					local f26_local0 = function ( f5_arg0, f5_arg1 )
						local f5_local0 = function ( f7_arg0, f7_arg1 )
							local f7_local0 = function ( f9_arg0, f9_arg1 )
								local f9_local0 = function ( f10_arg0, f10_arg1 )
									local f10_local0 = function ( f11_arg0, f11_arg1 )
										local f11_local0 = function ( f12_arg0, f12_arg1 )
											local f12_local0 = function ( f16_arg0, f16_arg1 )
												if not f16_arg1.interrupted then
													f16_arg0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
												end
												f16_arg0:setAlpha( 0 )
												if f16_arg1.interrupted then
													self.clipFinished( f16_arg0, f16_arg1 )
												else
													f16_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if f12_arg1.interrupted then
												f12_local0( f12_arg0, f12_arg1 )
												return 
											else
												f12_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												f12_arg0:setAlpha( 0.25 )
												f12_arg0:registerEventHandler( "transition_complete_keyframe", f12_local0 )
											end
										end
										
										if f11_arg1.interrupted then
											f11_local0( f11_arg0, f11_arg1 )
											return 
										else
											f11_arg0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
											f11_arg0:setAlpha( 0.09 )
											f11_arg0:registerEventHandler( "transition_complete_keyframe", f11_local0 )
										end
									end
									
									if f10_arg1.interrupted then
										f10_local0( f10_arg0, f10_arg1 )
										return 
									else
										f10_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
										f10_arg0:setAlpha( 0.4 )
										f10_arg0:registerEventHandler( "transition_complete_keyframe", f10_local0 )
									end
								end
								
								if f9_arg1.interrupted then
									f9_local0( f9_arg0, f9_arg1 )
									return 
								else
									f9_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									f9_arg0:setAlpha( 0.6 )
									f9_arg0:registerEventHandler( "transition_complete_keyframe", f9_local0 )
								end
							end
							
							if f7_arg1.interrupted then
								f7_local0( f7_arg0, f7_arg1 )
								return 
							else
								f7_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								f7_arg0:setAlpha( 0.14 )
								f7_arg0:registerEventHandler( "transition_complete_keyframe", f7_local0 )
							end
						end
						
						if f5_arg1.interrupted then
							f5_local0( f5_arg0, f5_arg1 )
							return 
						else
							f5_arg0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
							f5_arg0:setAlpha( 0.75 )
							f5_arg0:registerEventHandler( "transition_complete_keyframe", f5_local0 )
						end
					end
					
					if f26_arg1.interrupted then
						f26_local0( f26_arg0, f26_arg1 )
						return 
					else
						f26_arg0:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
						f26_arg0:registerEventHandler( "transition_complete_keyframe", f26_local0 )
					end
				end
				
				Footer:completeAnimation()
				self.Footer:setAlpha( 0.7 )
				f11_local2( Footer, {} )
				local f11_local3 = function ( f27_arg0, f27_arg1 )
					local f27_local0 = function ( f19_arg0, f19_arg1 )
						local f19_local0 = function ( f21_arg0, f21_arg1 )
							local f21_local0 = function ( f22_arg0, f22_arg1 )
								local f22_local0 = function ( f24_arg0, f24_arg1 )
									local f24_local0 = function ( f26_arg0, f26_arg1 )
										local f26_local0 = function ( f28_arg0, f28_arg1 )
											if not f28_arg1.interrupted then
												f28_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
											end
											f28_arg0:setAlpha( 0 )
											if f28_arg1.interrupted then
												self.clipFinished( f28_arg0, f28_arg1 )
											else
												f28_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if f26_arg1.interrupted then
											f26_local0( f26_arg0, f26_arg1 )
											return 
										else
											f26_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
											f26_arg0:setAlpha( 0.11 )
											f26_arg0:registerEventHandler( "transition_complete_keyframe", f26_local0 )
										end
									end
									
									if f24_arg1.interrupted then
										f24_local0( f24_arg0, f24_arg1 )
										return 
									else
										f24_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										f24_arg0:setAlpha( 0 )
										f24_arg0:registerEventHandler( "transition_complete_keyframe", f24_local0 )
									end
								end
								
								if f22_arg1.interrupted then
									f22_local0( f22_arg0, f22_arg1 )
									return 
								else
									f22_arg0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
									f22_arg0:setAlpha( 0.21 )
									f22_arg0:registerEventHandler( "transition_complete_keyframe", f22_local0 )
								end
							end
							
							if f21_arg1.interrupted then
								f21_local0( f21_arg0, f21_arg1 )
								return 
							else
								f21_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								f21_arg0:setAlpha( 0.41 )
								f21_arg0:registerEventHandler( "transition_complete_keyframe", f21_local0 )
							end
						end
						
						if f19_arg1.interrupted then
							f19_local0( f19_arg0, f19_arg1 )
							return 
						else
							f19_arg0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
							f19_arg0:setAlpha( 0.04 )
							f19_arg0:registerEventHandler( "transition_complete_keyframe", f19_local0 )
						end
					end
					
					if f27_arg1.interrupted then
						f27_local0( f27_arg0, f27_arg1 )
						return 
					else
						f27_arg0:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						f27_arg0:setAlpha( 0.55 )
						f27_arg0:registerEventHandler( "transition_complete_keyframe", f27_local0 )
					end
				end
				
				WinningTeamFactionIconNew:completeAnimation()
				WinningTeamFactionIconNew:subscribeToModel(Engine.GetModel(Engine.GetModelForController(controller), "hideFactionInfo"), function(modelRef) 
					local boolean = Engine.GetModelValue(modelRef)
					WinningTeamFactionIconNew:setAlpha( boolean )
				end)
				f11_local3( WinningTeamFactionIconNew, {} )
				local f11_local5 = function ( f29_arg0, f29_arg1 )
					if not f29_arg1.interrupted then
						f29_arg0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					f29_arg0:setAlpha( 1 )
					if f29_arg1.interrupted then
						self.clipFinished( f29_arg0, f29_arg1 )
					else
						f29_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BlackForeground:completeAnimation()
				self.BlackForeground:setAlpha( 0 )
				f11_local5( BlackForeground, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "FinalKillcam",
			condition = function ( menu, element, event )
				local f12_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_FINAL_KILLCAM )
				if not f12_local0 then
					f12_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM )
				end
				return f12_local0
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_FINAL_KILLCAM ), function ( modelRef )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( modelRef ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_FINAL_KILLCAM
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
	Header.id = "Header"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Header:close()
		element.KillcamWidgetFctnPnl0:close()
		element.Footer:close()
		element.WinningTeamFactionIconNew:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

