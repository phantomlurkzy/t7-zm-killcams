-- d41d8cd98f00b204e9800998ecf8427e
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Effects.fxGlitch1_9" )
require( "ui.uieditor.widgets.Effects.fxGlitch1_8" )
require( "ui.uieditor.widgets.Effects.fxGlitch1_7" )
require( "ui.uieditor.widgets.Effects.fxGlitch1_6" )
require( "ui.uieditor.widgets.Effects.fxGlitch1_5" )
require( "ui.uieditor.widgets.Effects.fxGlitch1_4" )
require( "ui.uieditor.widgets.Effects.fxGlitch1_3" )
require( "ui.uieditor.widgets.Effects.fxGlitch1_2" )
require( "ui.uieditor.widgets.Effects.fxGlitch1_1" )

CoD.fxGlitch1_Main = InheritFrom( LUI.UIElement )
CoD.fxGlitch1_Main.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.fxGlitch1_Main )
	self.id = "fxGlitch1_Main"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( true, false, 0, 472 )
	self:setTopBottom( true, false, 0, 256 )
	
	local fxGlitch1900 = CoD.fxGlitch1_9.new( menu, controller )
	fxGlitch1900:setLeftRight( true, true, 118, -118 )
	fxGlitch1900:setTopBottom( true, true, 82, -150 )
	fxGlitch1900:setAlpha( 0 )
	self:addElement( fxGlitch1900 )
	self.fxGlitch1900 = fxGlitch1900
	
	local fxGlitch1800 = CoD.fxGlitch1_8.new( menu, controller )
	fxGlitch1800:setLeftRight( true, true, 0, 0 )
	fxGlitch1800:setTopBottom( true, true, 95, -127 )
	fxGlitch1800:setAlpha( 0.8 )
	self:addElement( fxGlitch1800 )
	self.fxGlitch1800 = fxGlitch1800
	
	local fxGlitch1700 = CoD.fxGlitch1_7.new( menu, controller )
	fxGlitch1700:setLeftRight( true, true, 0, 0 )
	fxGlitch1700:setTopBottom( true, true, 113, -109 )
	fxGlitch1700:setAlpha( 0 )
	self:addElement( fxGlitch1700 )
	self.fxGlitch1700 = fxGlitch1700
	
	local fxGlitch1600 = CoD.fxGlitch1_6.new( menu, controller )
	fxGlitch1600:setLeftRight( true, true, 0, 0 )
	fxGlitch1600:setTopBottom( true, true, 54.5, -73 )
	fxGlitch1600:setAlpha( 0.28 )
	self:addElement( fxGlitch1600 )
	self.fxGlitch1600 = fxGlitch1600
	
	local fxGlitch1500 = CoD.fxGlitch1_5.new( menu, controller )
	fxGlitch1500:setLeftRight( true, true, 139, -157 )
	fxGlitch1500:setTopBottom( true, true, 54.5, -82.5 )
	fxGlitch1500:setAlpha( 0 )
	self:addElement( fxGlitch1500 )
	self.fxGlitch1500 = fxGlitch1500
	
	local fxGlitch1400 = CoD.fxGlitch1_4.new( menu, controller )
	fxGlitch1400:setLeftRight( true, true, 0, 0 )
	fxGlitch1400:setTopBottom( true, true, 54.5, -49.5 )
	fxGlitch1400:setAlpha( 0 )
	self:addElement( fxGlitch1400 )
	self.fxGlitch1400 = fxGlitch1400
	
	local fxGlitch1300 = CoD.fxGlitch1_3.new( menu, controller )
	fxGlitch1300:setLeftRight( true, true, 4, -4 )
	fxGlitch1300:setTopBottom( true, true, 0, 0 )
	fxGlitch1300:setAlpha( 0 )
	self:addElement( fxGlitch1300 )
	self.fxGlitch1300 = fxGlitch1300
	
	local fxGlitch1200 = CoD.fxGlitch1_2.new( menu, controller )
	fxGlitch1200:setLeftRight( true, true, 0, 0 )
	fxGlitch1200:setTopBottom( true, true, 31, -9 )
	fxGlitch1200:setAlpha( 0 )
	self:addElement( fxGlitch1200 )
	self.fxGlitch1200 = fxGlitch1200
	
	local fxGlitch1100 = CoD.fxGlitch1_1.new( menu, controller )
	fxGlitch1100:setLeftRight( true, true, 0, 0 )
	fxGlitch1100:setTopBottom( true, true, 46, -34 )
	fxGlitch1100:setAlpha( 0 )
	self:addElement( fxGlitch1100 )
	self.fxGlitch1100 = fxGlitch1100
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				fxGlitch1900:completeAnimation()
				self.fxGlitch1900:setLeftRight( true, true, 118, -118 )
				self.fxGlitch1900:setTopBottom( true, true, 82, -150 )
				self.fxGlitch1900:setAlpha( 0 )
				self.clipFinished( fxGlitch1900, {} )
				fxGlitch1800:completeAnimation()
				self.fxGlitch1800:setLeftRight( true, true, 0, 0 )
				self.fxGlitch1800:setTopBottom( true, true, 100, -100 )
				self.fxGlitch1800:setAlpha( 0 )
				self.clipFinished( fxGlitch1800, {} )
				fxGlitch1700:completeAnimation()
				self.fxGlitch1700:setLeftRight( true, true, 0, 0 )
				self.fxGlitch1700:setTopBottom( true, true, 82, -110 )
				self.fxGlitch1700:setAlpha( 0 )
				self.clipFinished( fxGlitch1700, {} )
				fxGlitch1600:completeAnimation()
				self.fxGlitch1600:setLeftRight( true, true, 0, 0 )
				self.fxGlitch1600:setTopBottom( true, true, 54.5, -73 )
				self.fxGlitch1600:setAlpha( 0 )
				self.clipFinished( fxGlitch1600, {} )
				fxGlitch1500:completeAnimation()
				self.fxGlitch1500:setLeftRight( true, true, 139, -157 )
				self.fxGlitch1500:setTopBottom( true, true, 54.5, -82.5 )
				self.fxGlitch1500:setAlpha( 0 )
				self.clipFinished( fxGlitch1500, {} )
				fxGlitch1400:completeAnimation()
				self.fxGlitch1400:setLeftRight( true, true, 0, 0 )
				self.fxGlitch1400:setTopBottom( true, true, 54.5, -49.5 )
				self.fxGlitch1400:setAlpha( 0 )
				self.clipFinished( fxGlitch1400, {} )
				fxGlitch1300:completeAnimation()
				self.fxGlitch1300:setLeftRight( true, true, 4, -4 )
				self.fxGlitch1300:setTopBottom( true, true, 0, 0 )
				self.fxGlitch1300:setAlpha( 0 )
				self.clipFinished( fxGlitch1300, {} )
				fxGlitch1200:completeAnimation()
				self.fxGlitch1200:setLeftRight( true, true, 0, 0 )
				self.fxGlitch1200:setTopBottom( true, true, 31, -9 )
				self.fxGlitch1200:setAlpha( 0 )
				self.clipFinished( fxGlitch1200, {} )
				fxGlitch1100:completeAnimation()
				self.fxGlitch1100:setLeftRight( true, true, 0, 0 )
				self.fxGlitch1100:setTopBottom( true, true, 46, -34 )
				self.fxGlitch1100:setAlpha( 0 )
				self.clipFinished( fxGlitch1100, {} )
			end,
			GlitchSmall1 = function ()
				self:setupElementClipCounter( 9 )
				local f16_local0 = function ( f68_arg0, f68_arg1 )
					local f68_local0 = function ( f71_arg0, f71_arg1 )
						local f71_local0 = function ( f72_arg0, f72_arg1 )
							local f72_local0 = function ( f73_arg0, f73_arg1 )
								local f73_local0 = function ( f74_arg0, f74_arg1 )
									local f74_local0 = function ( f75_arg0, f75_arg1 )
										local f75_local0 = function ( f22_arg0, f22_arg1 )
											local f22_local0 = function ( f23_arg0, f23_arg1 )
												if not f23_arg1.interrupted then
													f23_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												end
												f23_arg0:setLeftRight( true, true, 118, -118 )
												f23_arg0:setTopBottom( true, true, 152, -80 )
												f23_arg0:setAlpha( 0 )
												if f23_arg1.interrupted then
													self.clipFinished( f23_arg0, f23_arg1 )
												else
													f23_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if f22_arg1.interrupted then
												f22_local0( f22_arg0, f22_arg1 )
												return 
											else
												f22_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												f22_arg0:registerEventHandler( "transition_complete_keyframe", f22_local0 )
											end
										end
										
										if f75_arg1.interrupted then
											f75_local0( f75_arg0, f75_arg1 )
											return 
										else
											f75_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											f75_arg0:setTopBottom( true, true, 152, -80 )
											f75_arg0:setAlpha( 0.5 )
											f75_arg0:registerEventHandler( "transition_complete_keyframe", f75_local0 )
										end
									end
									
									if f74_arg1.interrupted then
										f74_local0( f74_arg0, f74_arg1 )
										return 
									else
										f74_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
										f74_arg0:setTopBottom( true, true, 140.33, -91.67 )
										f74_arg0:registerEventHandler( "transition_complete_keyframe", f74_local0 )
									end
								end
								
								if f73_arg1.interrupted then
									f73_local0( f73_arg0, f73_arg1 )
									return 
								else
									f73_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									f73_arg0:setTopBottom( true, true, 93.67, -138.33 )
									f73_arg0:setAlpha( 0 )
									f73_arg0:registerEventHandler( "transition_complete_keyframe", f73_local0 )
								end
							end
							
							if f72_arg1.interrupted then
								f72_local0( f72_arg0, f72_arg1 )
								return 
							else
								f72_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f72_arg0:registerEventHandler( "transition_complete_keyframe", f72_local0 )
							end
						end
						
						if f71_arg1.interrupted then
							f71_local0( f71_arg0, f71_arg1 )
							return 
						else
							f71_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							f71_arg0:setAlpha( 1 )
							f71_arg0:registerEventHandler( "transition_complete_keyframe", f71_local0 )
						end
					end
					
					if f68_arg1.interrupted then
						f68_local0( f68_arg0, f68_arg1 )
						return 
					else
						f68_arg0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						f68_arg0:registerEventHandler( "transition_complete_keyframe", f68_local0 )
					end
				end
				
				fxGlitch1900:completeAnimation()
				self.fxGlitch1900:setLeftRight( true, true, 118, -118 )
				self.fxGlitch1900:setTopBottom( true, true, 82, -150 )
				self.fxGlitch1900:setAlpha( 0 )
				f16_local0( fxGlitch1900, {} )
				local f16_local1 = function ( f69_arg0, f69_arg1 )
					local f69_local0 = function ( f24_arg0, f24_arg1 )
						local f24_local0 = function ( f25_arg0, f25_arg1 )
							local f25_local0 = function ( f27_arg0, f27_arg1 )
								local f27_local0 = function ( f28_arg0, f28_arg1 )
									local f28_local0 = function ( f29_arg0, f29_arg1 )
										local f29_local0 = function ( f30_arg0, f30_arg1 )
											if not f30_arg1.interrupted then
												f30_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											end
											f30_arg0:setLeftRight( true, true, 0, 0 )
											f30_arg0:setTopBottom( true, true, 100, -122 )
											f30_arg0:setAlpha( 0 )
											if f30_arg1.interrupted then
												self.clipFinished( f30_arg0, f30_arg1 )
											else
												f30_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if f29_arg1.interrupted then
											f29_local0( f29_arg0, f29_arg1 )
											return 
										else
											f29_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											f29_arg0:setAlpha( 1 )
											f29_arg0:registerEventHandler( "transition_complete_keyframe", f29_local0 )
										end
									end
									
									if f28_arg1.interrupted then
										f28_local0( f28_arg0, f28_arg1 )
										return 
									else
										f28_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										f28_arg0:registerEventHandler( "transition_complete_keyframe", f28_local0 )
									end
								end
								
								if f27_arg1.interrupted then
									f27_local0( f27_arg0, f27_arg1 )
									return 
								else
									f27_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									f27_arg0:setAlpha( 0 )
									f27_arg0:registerEventHandler( "transition_complete_keyframe", f27_local0 )
								end
							end
							
							if f25_arg1.interrupted then
								f25_local0( f25_arg0, f25_arg1 )
								return 
							else
								f25_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								f25_arg0:registerEventHandler( "transition_complete_keyframe", f25_local0 )
							end
						end
						
						if f24_arg1.interrupted then
							f24_local0( f24_arg0, f24_arg1 )
							return 
						else
							f24_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							f24_arg0:setAlpha( 1 )
							f24_arg0:registerEventHandler( "transition_complete_keyframe", f24_local0 )
						end
					end
					
					if f69_arg1.interrupted then
						f69_local0( f69_arg0, f69_arg1 )
						return 
					else
						f69_arg0:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
						f69_arg0:registerEventHandler( "transition_complete_keyframe", f69_local0 )
					end
				end
				
				fxGlitch1800:completeAnimation()
				self.fxGlitch1800:setLeftRight( true, true, 0, 0 )
				self.fxGlitch1800:setTopBottom( true, true, 100, -122 )
				self.fxGlitch1800:setAlpha( 0 )
				f16_local1( fxGlitch1800, {} )
				local f16_local2 = function ( f70_arg0, f70_arg1 )
					local f70_local0 = function ( f40_arg0, f40_arg1 )
						local f40_local0 = function ( f43_arg0, f43_arg1 )
							local f43_local0 = function ( f46_arg0, f46_arg1 )
								local f46_local0 = function ( f47_arg0, f47_arg1 )
									local f47_local0 = function ( f49_arg0, f49_arg1 )
										if not f49_arg1.interrupted then
											f49_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										end
										f49_arg0:setLeftRight( true, true, 0, 0 )
										f49_arg0:setTopBottom( true, true, 97.75, -137.25 )
										f49_arg0:setAlpha( 0 )
										if f49_arg1.interrupted then
											self.clipFinished( f49_arg0, f49_arg1 )
										else
											f49_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if f47_arg1.interrupted then
										f47_local0( f47_arg0, f47_arg1 )
										return 
									else
										f47_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										f47_arg0:setTopBottom( true, true, 97.75, -137.25 )
										f47_arg0:registerEventHandler( "transition_complete_keyframe", f47_local0 )
									end
								end
								
								if f46_arg1.interrupted then
									f46_local0( f46_arg0, f46_arg1 )
									return 
								else
									f46_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									f46_arg0:setTopBottom( true, true, 102.83, -127.83 )
									f46_arg0:setAlpha( 1 )
									f46_arg0:registerEventHandler( "transition_complete_keyframe", f46_local0 )
								end
							end
							
							if f43_arg1.interrupted then
								f43_local0( f43_arg0, f43_arg1 )
								return 
							else
								f43_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								f43_arg0:setTopBottom( true, true, 107.92, -118.42 )
								f43_arg0:setAlpha( 0 )
								f43_arg0:registerEventHandler( "transition_complete_keyframe", f43_local0 )
							end
						end
						
						if f40_arg1.interrupted then
							f40_local0( f40_arg0, f40_arg1 )
							return 
						else
							f40_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							f40_arg0:setAlpha( 0.34 )
							f40_arg0:registerEventHandler( "transition_complete_keyframe", f40_local0 )
						end
					end
					
					if f70_arg1.interrupted then
						f70_local0( f70_arg0, f70_arg1 )
						return 
					else
						f70_arg0:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
						f70_arg0:registerEventHandler( "transition_complete_keyframe", f70_local0 )
					end
				end
				
				fxGlitch1700:completeAnimation()
				self.fxGlitch1700:setLeftRight( true, true, 0, 0 )
				self.fxGlitch1700:setTopBottom( true, true, 113, -109 )
				self.fxGlitch1700:setAlpha( 0 )
				f16_local2( fxGlitch1700, {} )
				fxGlitch1600:completeAnimation()
				self.fxGlitch1600:setLeftRight( true, true, 0, 0 )
				self.fxGlitch1600:setTopBottom( true, true, 54.5, -73 )
				self.clipFinished( fxGlitch1600, {} )
				fxGlitch1500:completeAnimation()
				self.fxGlitch1500:setLeftRight( true, true, 139, -157 )
				self.fxGlitch1500:setTopBottom( true, true, 54.5, -82.5 )
				self.clipFinished( fxGlitch1500, {} )
				fxGlitch1400:completeAnimation()
				self.fxGlitch1400:setLeftRight( true, true, 0, 0 )
				self.fxGlitch1400:setTopBottom( true, true, 54.5, -49.5 )
				self.clipFinished( fxGlitch1400, {} )
				fxGlitch1300:completeAnimation()
				self.fxGlitch1300:setLeftRight( true, true, 4, -4 )
				self.fxGlitch1300:setTopBottom( true, true, 0, 0 )
				self.clipFinished( fxGlitch1300, {} )
				fxGlitch1200:completeAnimation()
				self.fxGlitch1200:setLeftRight( true, true, 0, 0 )
				self.fxGlitch1200:setTopBottom( true, true, 31, -9 )
				self.clipFinished( fxGlitch1200, {} )
				fxGlitch1100:completeAnimation()
				self.fxGlitch1100:setLeftRight( true, true, 0, 0 )
				self.fxGlitch1100:setTopBottom( true, true, 46, -34 )
				self.clipFinished( fxGlitch1100, {} )
			end,
			GlitchSmall2 = function ()
				self:setupElementClipCounter( 9 )
				local f17_local0 = function ( f51_arg0, f51_arg1 )
					local f51_local0 = function ( f71_arg0, f71_arg1 )
						local f71_local0 = function ( f74_arg0, f74_arg1 )
							local f74_local0 = function ( f76_arg0, f76_arg1 )
								if not f76_arg1.interrupted then
									f76_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								end
								f76_arg0:setLeftRight( true, true, 118, -118 )
								f76_arg0:setTopBottom( true, true, 82, -150 )
								f76_arg0:setAlpha( 0 )
								if f76_arg1.interrupted then
									self.clipFinished( f76_arg0, f76_arg1 )
								else
									f76_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if f74_arg1.interrupted then
								f74_local0( f74_arg0, f74_arg1 )
								return 
							else
								f74_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f74_arg0:registerEventHandler( "transition_complete_keyframe", f74_local0 )
							end
						end
						
						if f71_arg1.interrupted then
							f71_local0( f71_arg0, f71_arg1 )
							return 
						else
							f71_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							f71_arg0:setAlpha( 1 )
							f71_arg0:registerEventHandler( "transition_complete_keyframe", f71_local0 )
						end
					end
					
					if f51_arg1.interrupted then
						f51_local0( f51_arg0, f51_arg1 )
						return 
					else
						f51_arg0:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
						f51_arg0:registerEventHandler( "transition_complete_keyframe", f51_local0 )
					end
				end
				
				fxGlitch1900:completeAnimation()
				self.fxGlitch1900:setLeftRight( true, true, 118, -118 )
				self.fxGlitch1900:setTopBottom( true, true, 82, -150 )
				self.fxGlitch1900:setAlpha( 0 )
				f17_local0( fxGlitch1900, {} )
				local f17_local1 = function ( f52_arg0, f52_arg1 )
					local f52_local0 = function ( f78_arg0, f78_arg1 )
						local f78_local0 = function ( f79_arg0, f79_arg1 )
							local f79_local0 = function ( f80_arg0, f80_arg1 )
								local f80_local0 = function ( f82_arg0, f82_arg1 )
									local f82_local0 = function ( f84_arg0, f84_arg1 )
										local f84_local0 = function ( f85_arg0, f85_arg1 )
											local f85_local0 = function ( f87_arg0, f87_arg1 )
												local f87_local0 = function ( f89_arg0, f89_arg1 )
													local f89_local0 = function ( f92_arg0, f92_arg1 )
														if not f92_arg1.interrupted then
															f92_arg0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
														end
														f92_arg0:setLeftRight( true, true, 0, 0 )
														f92_arg0:setTopBottom( true, true, 97, -125 )
														f92_arg0:setAlpha( 0 )
														if f92_arg1.interrupted then
															self.clipFinished( f92_arg0, f92_arg1 )
														else
															f92_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if f89_arg1.interrupted then
														f89_local0( f89_arg0, f89_arg1 )
														return 
													else
														f89_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
														f89_arg0:setAlpha( 0.72 )
														f89_arg0:registerEventHandler( "transition_complete_keyframe", f89_local0 )
													end
												end
												
												if f87_arg1.interrupted then
													f87_local0( f87_arg0, f87_arg1 )
													return 
												else
													f87_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													f87_arg0:setTopBottom( true, true, 97, -125 )
													f87_arg0:registerEventHandler( "transition_complete_keyframe", f87_local0 )
												end
											end
											
											if f85_arg1.interrupted then
												f85_local0( f85_arg0, f85_arg1 )
												return 
											else
												f85_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												f85_arg0:setTopBottom( true, true, 113.67, -108.33 )
												f85_arg0:setAlpha( 0 )
												f85_arg0:registerEventHandler( "transition_complete_keyframe", f85_local0 )
											end
										end
										
										if f84_arg1.interrupted then
											f84_local0( f84_arg0, f84_arg1 )
											return 
										else
											f84_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											f84_arg0:setTopBottom( true, true, 122, -100 )
											f84_arg0:setAlpha( 1 )
											f84_arg0:registerEventHandler( "transition_complete_keyframe", f84_local0 )
										end
									end
									
									if f82_arg1.interrupted then
										f82_local0( f82_arg0, f82_arg1 )
										return 
									else
										f82_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
										f82_arg0:setTopBottom( true, true, 116.6, -105.4 )
										f82_arg0:registerEventHandler( "transition_complete_keyframe", f82_local0 )
									end
								end
								
								if f80_arg1.interrupted then
									f80_local0( f80_arg0, f80_arg1 )
									return 
								else
									f80_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									f80_arg0:setTopBottom( true, true, 100.4, -121.6 )
									f80_arg0:setAlpha( 0 )
									f80_arg0:registerEventHandler( "transition_complete_keyframe", f80_local0 )
								end
							end
							
							if f79_arg1.interrupted then
								f79_local0( f79_arg0, f79_arg1 )
								return 
							else
								f79_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f79_arg0:registerEventHandler( "transition_complete_keyframe", f79_local0 )
							end
						end
						
						if f78_arg1.interrupted then
							f78_local0( f78_arg0, f78_arg1 )
							return 
						else
							f78_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							f78_arg0:setAlpha( 0.8 )
							f78_arg0:registerEventHandler( "transition_complete_keyframe", f78_local0 )
						end
					end
					
					if f52_arg1.interrupted then
						f52_local0( f52_arg0, f52_arg1 )
						return 
					else
						f52_arg0:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						f52_arg0:registerEventHandler( "transition_complete_keyframe", f52_local0 )
					end
				end
				
				fxGlitch1800:completeAnimation()
				self.fxGlitch1800:setLeftRight( true, true, 0, 0 )
				self.fxGlitch1800:setTopBottom( true, true, 95, -127 )
				self.fxGlitch1800:setAlpha( 0 )
				f17_local1( fxGlitch1800, {} )
				local f17_local2 = function ( f53_arg0, f53_arg1 )
					local f53_local0 = function ( f93_arg0, f93_arg1 )
						local f93_local0 = function ( f94_arg0, f94_arg1 )
							local f94_local0 = function ( f96_arg0, f96_arg1 )
								if not f96_arg1.interrupted then
									f96_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								end
								f96_arg0:setLeftRight( true, true, 0, 0 )
								f96_arg0:setTopBottom( true, true, 113, -109 )
								f96_arg0:setAlpha( 0 )
								if f96_arg1.interrupted then
									self.clipFinished( f96_arg0, f96_arg1 )
								else
									f96_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if f94_arg1.interrupted then
								f94_local0( f94_arg0, f94_arg1 )
								return 
							else
								f94_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								f94_arg0:setAlpha( 0.16 )
								f94_arg0:registerEventHandler( "transition_complete_keyframe", f94_local0 )
							end
						end
						
						if f93_arg1.interrupted then
							f93_local0( f93_arg0, f93_arg1 )
							return 
						else
							f93_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							f93_arg0:setAlpha( 0.19 )
							f93_arg0:registerEventHandler( "transition_complete_keyframe", f93_local0 )
						end
					end
					
					if f53_arg1.interrupted then
						f53_local0( f53_arg0, f53_arg1 )
						return 
					else
						f53_arg0:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
						f53_arg0:registerEventHandler( "transition_complete_keyframe", f53_local0 )
					end
				end
				
				fxGlitch1700:completeAnimation()
				self.fxGlitch1700:setLeftRight( true, true, 0, 0 )
				self.fxGlitch1700:setTopBottom( true, true, 113, -109 )
				self.fxGlitch1700:setAlpha( 0 )
				f17_local2( fxGlitch1700, {} )
				local f17_local3 = function ( f54_arg0, f54_arg1 )
					local f54_local0 = function ( f100_arg0, f100_arg1 )
						local f100_local0 = function ( f107_arg0, f107_arg1 )
							if not f107_arg1.interrupted then
								f107_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							end
							f107_arg0:setLeftRight( true, true, 0, 0 )
							f107_arg0:setTopBottom( true, true, 54.5, -73 )
							f107_arg0:setAlpha( 0 )
							if f107_arg1.interrupted then
								self.clipFinished( f107_arg0, f107_arg1 )
							else
								f107_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f100_arg1.interrupted then
							f100_local0( f100_arg0, f100_arg1 )
							return 
						else
							f100_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							f100_arg0:setAlpha( 0.28 )
							f100_arg0:registerEventHandler( "transition_complete_keyframe", f100_local0 )
						end
					end
					
					if f54_arg1.interrupted then
						f54_local0( f54_arg0, f54_arg1 )
						return 
					else
						f54_arg0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						f54_arg0:registerEventHandler( "transition_complete_keyframe", f54_local0 )
					end
				end
				
				fxGlitch1600:completeAnimation()
				self.fxGlitch1600:setLeftRight( true, true, 0, 0 )
				self.fxGlitch1600:setTopBottom( true, true, 54.5, -73 )
				self.fxGlitch1600:setAlpha( 0 )
				f17_local3( fxGlitch1600, {} )
				fxGlitch1500:completeAnimation()
				self.fxGlitch1500:setLeftRight( true, true, 139, -157 )
				self.fxGlitch1500:setTopBottom( true, true, 54.5, -82.5 )
				self.clipFinished( fxGlitch1500, {} )
				local f17_local4 = function ( f55_arg0, f55_arg1 )
					local f55_local0 = function ( f4_arg0, f4_arg1 )
						local f4_local0 = function ( f6_arg0, f6_arg1 )
							if not f6_arg1.interrupted then
								f6_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							end
							f6_arg0:setLeftRight( true, true, 0, 0 )
							f6_arg0:setTopBottom( true, true, 54.5, -49.5 )
							f6_arg0:setAlpha( 0 )
							if f6_arg1.interrupted then
								self.clipFinished( f6_arg0, f6_arg1 )
							else
								f6_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f4_arg1.interrupted then
							f4_local0( f4_arg0, f4_arg1 )
							return 
						else
							f4_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							f4_arg0:setAlpha( 0.33 )
							f4_arg0:registerEventHandler( "transition_complete_keyframe", f4_local0 )
						end
					end
					
					if f55_arg1.interrupted then
						f55_local0( f55_arg0, f55_arg1 )
						return 
					else
						f55_arg0:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						f55_arg0:registerEventHandler( "transition_complete_keyframe", f55_local0 )
					end
				end
				
				fxGlitch1400:completeAnimation()
				self.fxGlitch1400:setLeftRight( true, true, 0, 0 )
				self.fxGlitch1400:setTopBottom( true, true, 54.5, -49.5 )
				self.fxGlitch1400:setAlpha( 0 )
				f17_local4( fxGlitch1400, {} )
				fxGlitch1300:completeAnimation()
				self.fxGlitch1300:setLeftRight( true, true, 4, -4 )
				self.fxGlitch1300:setTopBottom( true, true, 0, 0 )
				self.clipFinished( fxGlitch1300, {} )
				fxGlitch1200:completeAnimation()
				self.fxGlitch1200:setLeftRight( true, true, 0, 0 )
				self.fxGlitch1200:setTopBottom( true, true, 31, -9 )
				self.clipFinished( fxGlitch1200, {} )
				fxGlitch1100:completeAnimation()
				self.fxGlitch1100:setLeftRight( true, true, 0, 0 )
				self.fxGlitch1100:setTopBottom( true, true, 46, -34 )
				self.clipFinished( fxGlitch1100, {} )
			end,
			GlitchSmall3 = function ()
				self:setupElementClipCounter( 9 )
				local f18_local0 = function ( f7_arg0, f7_arg1 )
					local f7_local0 = function ( f16_arg0, f16_arg1 )
						local f16_local0 = function ( f17_arg0, f17_arg1 )
							local f17_local0 = function ( f19_arg0, f19_arg1 )
								local f19_local0 = function ( f20_arg0, f20_arg1 )
									local f20_local0 = function ( f23_arg0, f23_arg1 )
										local f23_local0 = function ( f24_arg0, f24_arg1 )
											local f24_local0 = function ( f26_arg0, f26_arg1 )
												local f26_local0 = function ( f27_arg0, f27_arg1 )
													local f27_local0 = function ( f29_arg0, f29_arg1 )
														local f29_local0 = function ( f31_arg0, f31_arg1 )
															if not f31_arg1.interrupted then
																f31_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
															end
															f31_arg0:setLeftRight( true, true, 118, -118 )
															f31_arg0:setTopBottom( true, true, 114, -118 )
															f31_arg0:setAlpha( 0 )
															if f31_arg1.interrupted then
																self.clipFinished( f31_arg0, f31_arg1 )
															else
																f31_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if f29_arg1.interrupted then
															f29_local0( f29_arg0, f29_arg1 )
															return 
														else
															f29_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
															f29_arg0:setAlpha( 0.55 )
															f29_arg0:registerEventHandler( "transition_complete_keyframe", f29_local0 )
														end
													end
													
													if f27_arg1.interrupted then
														f27_local0( f27_arg0, f27_arg1 )
														return 
													else
														f27_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
														f27_arg0:setTopBottom( true, true, 114, -118 )
														f27_arg0:registerEventHandler( "transition_complete_keyframe", f27_local0 )
													end
												end
												
												if f26_arg1.interrupted then
													f26_local0( f26_arg0, f26_arg1 )
													return 
												else
													f26_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
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
										
										if f23_arg1.interrupted then
											f23_local0( f23_arg0, f23_arg1 )
											return 
										else
											f23_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											f23_arg0:registerEventHandler( "transition_complete_keyframe", f23_local0 )
										end
									end
									
									if f20_arg1.interrupted then
										f20_local0( f20_arg0, f20_arg1 )
										return 
									else
										f20_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										f20_arg0:setTopBottom( true, true, 147, -85 )
										f20_arg0:setAlpha( 1 )
										f20_arg0:registerEventHandler( "transition_complete_keyframe", f20_local0 )
									end
								end
								
								if f19_arg1.interrupted then
									f19_local0( f19_arg0, f19_arg1 )
									return 
								else
									f19_arg0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
									f19_arg0:setTopBottom( true, true, 137.71, -94.29 )
									f19_arg0:registerEventHandler( "transition_complete_keyframe", f19_local0 )
								end
							end
							
							if f17_arg1.interrupted then
								f17_local0( f17_arg0, f17_arg1 )
								return 
							else
								f17_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f17_arg0:setTopBottom( true, true, 91.29, -140.71 )
								f17_arg0:setAlpha( 0 )
								f17_arg0:registerEventHandler( "transition_complete_keyframe", f17_local0 )
							end
						end
						
						if f16_arg1.interrupted then
							f16_local0( f16_arg0, f16_arg1 )
							return 
						else
							f16_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							f16_arg0:registerEventHandler( "transition_complete_keyframe", f16_local0 )
						end
					end
					
					if f7_arg1.interrupted then
						f7_local0( f7_arg0, f7_arg1 )
						return 
					else
						f7_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						f7_arg0:setAlpha( 0.69 )
						f7_arg0:registerEventHandler( "transition_complete_keyframe", f7_local0 )
					end
				end
				
				fxGlitch1900:completeAnimation()
				self.fxGlitch1900:setLeftRight( true, true, 118, -118 )
				self.fxGlitch1900:setTopBottom( true, true, 82, -150 )
				self.fxGlitch1900:setAlpha( 0 )
				f18_local0( fxGlitch1900, {} )
				local f18_local1 = function ( f8_arg0, f8_arg1 )
					local f8_local0 = function ( f23_arg0, f23_arg1 )
						local f23_local0 = function ( f24_arg0, f24_arg1 )
							local f24_local0 = function ( f25_arg0, f25_arg1 )
								local f25_local0 = function ( f27_arg0, f27_arg1 )
									local f27_local0 = function ( f29_arg0, f29_arg1 )
										local f29_local0 = function ( f33_arg0, f33_arg1 )
											local f33_local0 = function ( f36_arg0, f36_arg1 )
												if not f36_arg1.interrupted then
													f36_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
												end
												f36_arg0:setLeftRight( true, true, 0, 0 )
												f36_arg0:setTopBottom( true, true, 84.75, -137.25 )
												f36_arg0:setAlpha( 0 )
												if f36_arg1.interrupted then
													self.clipFinished( f36_arg0, f36_arg1 )
												else
													f36_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if f33_arg1.interrupted then
												f33_local0( f33_arg0, f33_arg1 )
												return 
											else
												f33_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												f33_arg0:setAlpha( 0.55 )
												f33_arg0:registerEventHandler( "transition_complete_keyframe", f33_local0 )
											end
										end
										
										if f29_arg1.interrupted then
											f29_local0( f29_arg0, f29_arg1 )
											return 
										else
											f29_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
											f29_arg0:setTopBottom( true, true, 84.75, -137.25 )
											f29_arg0:registerEventHandler( "transition_complete_keyframe", f29_local0 )
										end
									end
									
									if f27_arg1.interrupted then
										f27_local0( f27_arg0, f27_arg1 )
										return 
									else
										f27_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										f27_arg0:registerEventHandler( "transition_complete_keyframe", f27_local0 )
									end
								end
								
								if f25_arg1.interrupted then
									f25_local0( f25_arg0, f25_arg1 )
									return 
								else
									f25_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									f25_arg0:setAlpha( 0 )
									f25_arg0:registerEventHandler( "transition_complete_keyframe", f25_local0 )
								end
							end
							
							if f24_arg1.interrupted then
								f24_local0( f24_arg0, f24_arg1 )
								return 
							else
								f24_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f24_arg0:setAlpha( 0.69 )
								f24_arg0:registerEventHandler( "transition_complete_keyframe", f24_local0 )
							end
						end
						
						if f23_arg1.interrupted then
							f23_local0( f23_arg0, f23_arg1 )
							return 
						else
							f23_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							f23_arg0:setAlpha( 0.31 )
							f23_arg0:registerEventHandler( "transition_complete_keyframe", f23_local0 )
						end
					end
					
					if f8_arg1.interrupted then
						f8_local0( f8_arg0, f8_arg1 )
						return 
					else
						f8_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						f8_arg0:registerEventHandler( "transition_complete_keyframe", f8_local0 )
					end
				end
				
				fxGlitch1800:completeAnimation()
				self.fxGlitch1800:setLeftRight( true, true, 0, 0 )
				self.fxGlitch1800:setTopBottom( true, true, 97, -125 )
				self.fxGlitch1800:setAlpha( 0 )
				f18_local1( fxGlitch1800, {} )
				local f18_local2 = function ( f9_arg0, f9_arg1 )
					local f9_local0 = function ( f38_arg0, f38_arg1 )
						local f38_local0 = function ( f41_arg0, f41_arg1 )
							local f41_local0 = function ( f43_arg0, f43_arg1 )
								if not f43_arg1.interrupted then
									f43_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								end
								f43_arg0:setLeftRight( true, true, 0, 0 )
								f43_arg0:setTopBottom( true, true, 105, -117 )
								f43_arg0:setAlpha( 0 )
								if f43_arg1.interrupted then
									self.clipFinished( f43_arg0, f43_arg1 )
								else
									f43_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if f41_arg1.interrupted then
								f41_local0( f41_arg0, f41_arg1 )
								return 
							else
								f41_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f41_arg0:setAlpha( 0.51 )
								f41_arg0:registerEventHandler( "transition_complete_keyframe", f41_local0 )
							end
						end
						
						if f38_arg1.interrupted then
							f38_local0( f38_arg0, f38_arg1 )
							return 
						else
							f38_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							f38_arg0:setAlpha( 1 )
							f38_arg0:registerEventHandler( "transition_complete_keyframe", f38_local0 )
						end
					end
					
					if f9_arg1.interrupted then
						f9_local0( f9_arg0, f9_arg1 )
						return 
					else
						f9_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						f9_arg0:registerEventHandler( "transition_complete_keyframe", f9_local0 )
					end
				end
				
				fxGlitch1700:completeAnimation()
				self.fxGlitch1700:setLeftRight( true, true, 0, 0 )
				self.fxGlitch1700:setTopBottom( true, true, 105, -117 )
				self.fxGlitch1700:setAlpha( 0 )
				f18_local2( fxGlitch1700, {} )
				fxGlitch1600:completeAnimation()
				self.fxGlitch1600:setLeftRight( true, true, 0, 0 )
				self.fxGlitch1600:setTopBottom( true, true, 54.5, -73 )
				self.clipFinished( fxGlitch1600, {} )
				local f18_local3 = function ( f10_arg0, f10_arg1 )
					local f10_local0 = function ( f46_arg0, f46_arg1 )
						local f46_local0 = function ( f48_arg0, f48_arg1 )
							local f48_local0 = function ( f49_arg0, f49_arg1 )
								if not f49_arg1.interrupted then
									f49_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								end
								f49_arg0:setLeftRight( true, true, 128, -123 )
								f49_arg0:setTopBottom( true, true, 67.75, -95.75 )
								f49_arg0:setAlpha( 0 )
								if f49_arg1.interrupted then
									self.clipFinished( f49_arg0, f49_arg1 )
								else
									f49_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if f48_arg1.interrupted then
								f48_local0( f48_arg0, f48_arg1 )
								return 
							else
								f48_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f48_arg0:setLeftRight( true, true, 128, -123 )
								f48_arg0:setTopBottom( true, true, 67.75, -95.75 )
								f48_arg0:setAlpha( 0.8 )
								f48_arg0:registerEventHandler( "transition_complete_keyframe", f48_local0 )
							end
						end
						
						if f46_arg1.interrupted then
							f46_local0( f46_arg0, f46_arg1 )
							return 
						else
							f46_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							f46_arg0:setTopBottom( true, true, 69.04, -94.46 )
							f46_arg0:setAlpha( 0.18 )
							f46_arg0:registerEventHandler( "transition_complete_keyframe", f46_local0 )
						end
					end
					
					if f10_arg1.interrupted then
						f10_local0( f10_arg0, f10_arg1 )
						return 
					else
						f10_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						f10_arg0:registerEventHandler( "transition_complete_keyframe", f10_local0 )
					end
				end
				
				fxGlitch1500:completeAnimation()
				self.fxGlitch1500:setLeftRight( true, true, 44, -31 )
				self.fxGlitch1500:setTopBottom( true, true, 69.04, -94.46 )
				self.fxGlitch1500:setAlpha( 0 )
				f18_local3( fxGlitch1500, {} )
				fxGlitch1400:completeAnimation()
				self.fxGlitch1400:setLeftRight( true, true, 0, 0 )
				self.fxGlitch1400:setTopBottom( true, true, 54.5, -49.5 )
				self.clipFinished( fxGlitch1400, {} )
				fxGlitch1300:completeAnimation()
				self.fxGlitch1300:setLeftRight( true, true, 4, -4 )
				self.fxGlitch1300:setTopBottom( true, true, 0, 0 )
				self.clipFinished( fxGlitch1300, {} )
				fxGlitch1200:completeAnimation()
				self.fxGlitch1200:setLeftRight( true, true, 0, 0 )
				self.fxGlitch1200:setTopBottom( true, true, 31, -9 )
				self.clipFinished( fxGlitch1200, {} )
				fxGlitch1100:completeAnimation()
				self.fxGlitch1100:setLeftRight( true, true, 0, 0 )
				self.fxGlitch1100:setTopBottom( true, true, 46, -34 )
				self.clipFinished( fxGlitch1100, {} )
			end,
			GlitchLarge1 = function ()
				self:setupElementClipCounter( 9 )
				local f19_local0 = function ( f51_arg0, f51_arg1 )
					local f51_local0 = function ( f61_arg0, f61_arg1 )
						local f61_local0 = function ( f64_arg0, f64_arg1 )
							local f64_local0 = function ( f66_arg0, f66_arg1 )
								local f66_local0 = function ( f68_arg0, f68_arg1 )
									local f68_local0 = function ( f70_arg0, f70_arg1 )
										local f70_local0 = function ( f72_arg0, f72_arg1 )
											if not f72_arg1.interrupted then
												f72_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											end
											f72_arg0:setLeftRight( true, true, 118, -118 )
											f72_arg0:setTopBottom( true, true, 82, -150 )
											f72_arg0:setAlpha( 0 )
											if f72_arg1.interrupted then
												self.clipFinished( f72_arg0, f72_arg1 )
											else
												f72_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if f70_arg1.interrupted then
											f70_local0( f70_arg0, f70_arg1 )
											return 
										else
											f70_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											f70_arg0:setAlpha( 1 )
											f70_arg0:registerEventHandler( "transition_complete_keyframe", f70_local0 )
										end
									end
									
									if f68_arg1.interrupted then
										f68_local0( f68_arg0, f68_arg1 )
										return 
									else
										f68_arg0:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
										f68_arg0:registerEventHandler( "transition_complete_keyframe", f68_local0 )
									end
								end
								
								if f66_arg1.interrupted then
									f66_local0( f66_arg0, f66_arg1 )
									return 
								else
									f66_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									f66_arg0:setAlpha( 0 )
									f66_arg0:registerEventHandler( "transition_complete_keyframe", f66_local0 )
								end
							end
							
							if f64_arg1.interrupted then
								f64_local0( f64_arg0, f64_arg1 )
								return 
							else
								f64_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f64_arg0:registerEventHandler( "transition_complete_keyframe", f64_local0 )
							end
						end
						
						if f61_arg1.interrupted then
							f61_local0( f61_arg0, f61_arg1 )
							return 
						else
							f61_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							f61_arg0:setAlpha( 1 )
							f61_arg0:registerEventHandler( "transition_complete_keyframe", f61_local0 )
						end
					end
					
					if f51_arg1.interrupted then
						f51_local0( f51_arg0, f51_arg1 )
						return 
					else
						f51_arg0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						f51_arg0:registerEventHandler( "transition_complete_keyframe", f51_local0 )
					end
				end
				
				fxGlitch1900:completeAnimation()
				self.fxGlitch1900:setLeftRight( true, true, 118, -118 )
				self.fxGlitch1900:setTopBottom( true, true, 82, -150 )
				self.fxGlitch1900:setAlpha( 0 )
				f19_local0( fxGlitch1900, {} )
				local f19_local1 = function ( f52_arg0, f52_arg1 )
					local f52_local0 = function ( f74_arg0, f74_arg1 )
						local f74_local0 = function ( f75_arg0, f75_arg1 )
							local f75_local0 = function ( f77_arg0, f77_arg1 )
								local f77_local0 = function ( f78_arg0, f78_arg1 )
									local f78_local0 = function ( f79_arg0, f79_arg1 )
										local f79_local0 = function ( f81_arg0, f81_arg1 )
											local f81_local0 = function ( f85_arg0, f85_arg1 )
												if not f85_arg1.interrupted then
													f85_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												end
												f85_arg0:setLeftRight( true, true, 0, 0 )
												f85_arg0:setTopBottom( true, true, 97, -125 )
												f85_arg0:setAlpha( 0 )
												if f85_arg1.interrupted then
													self.clipFinished( f85_arg0, f85_arg1 )
												else
													f85_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if f81_arg1.interrupted then
												f81_local0( f81_arg0, f81_arg1 )
												return 
											else
												f81_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												f81_arg0:registerEventHandler( "transition_complete_keyframe", f81_local0 )
											end
										end
										
										if f79_arg1.interrupted then
											f79_local0( f79_arg0, f79_arg1 )
											return 
										else
											f79_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											f79_arg0:setAlpha( 1 )
											f79_arg0:registerEventHandler( "transition_complete_keyframe", f79_local0 )
										end
									end
									
									if f78_arg1.interrupted then
										f78_local0( f78_arg0, f78_arg1 )
										return 
									else
										f78_arg0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
										f78_arg0:registerEventHandler( "transition_complete_keyframe", f78_local0 )
									end
								end
								
								if f77_arg1.interrupted then
									f77_local0( f77_arg0, f77_arg1 )
									return 
								else
									f77_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									f77_arg0:setAlpha( 0 )
									f77_arg0:registerEventHandler( "transition_complete_keyframe", f77_local0 )
								end
							end
							
							if f75_arg1.interrupted then
								f75_local0( f75_arg0, f75_arg1 )
								return 
							else
								f75_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f75_arg0:registerEventHandler( "transition_complete_keyframe", f75_local0 )
							end
						end
						
						if f74_arg1.interrupted then
							f74_local0( f74_arg0, f74_arg1 )
							return 
						else
							f74_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							f74_arg0:setAlpha( 1 )
							f74_arg0:registerEventHandler( "transition_complete_keyframe", f74_local0 )
						end
					end
					
					if f52_arg1.interrupted then
						f52_local0( f52_arg0, f52_arg1 )
						return 
					else
						f52_arg0:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
						f52_arg0:registerEventHandler( "transition_complete_keyframe", f52_local0 )
					end
				end
				
				fxGlitch1800:completeAnimation()
				self.fxGlitch1800:setLeftRight( true, true, 0, 0 )
				self.fxGlitch1800:setTopBottom( true, true, 97, -125 )
				self.fxGlitch1800:setAlpha( 0 )
				f19_local1( fxGlitch1800, {} )
				local f19_local2 = function ( f53_arg0, f53_arg1 )
					local f53_local0 = function ( f14_arg0, f14_arg1 )
						local f14_local0 = function ( f15_arg0, f15_arg1 )
							local f15_local0 = function ( f17_arg0, f17_arg1 )
								if not f17_arg1.interrupted then
									f17_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								end
								f17_arg0:setLeftRight( true, true, 0, 0 )
								f17_arg0:setTopBottom( true, true, 105, -117 )
								f17_arg0:setAlpha( 0 )
								if f17_arg1.interrupted then
									self.clipFinished( f17_arg0, f17_arg1 )
								else
									f17_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if f15_arg1.interrupted then
								f15_local0( f15_arg0, f15_arg1 )
								return 
							else
								f15_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								f15_arg0:registerEventHandler( "transition_complete_keyframe", f15_local0 )
							end
						end
						
						if f14_arg1.interrupted then
							f14_local0( f14_arg0, f14_arg1 )
							return 
						else
							f14_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							f14_arg0:setAlpha( 1 )
							f14_arg0:registerEventHandler( "transition_complete_keyframe", f14_local0 )
						end
					end
					
					if f53_arg1.interrupted then
						f53_local0( f53_arg0, f53_arg1 )
						return 
					else
						f53_arg0:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						f53_arg0:registerEventHandler( "transition_complete_keyframe", f53_local0 )
					end
				end
				
				fxGlitch1700:completeAnimation()
				self.fxGlitch1700:setLeftRight( true, true, 0, 0 )
				self.fxGlitch1700:setTopBottom( true, true, 105, -117 )
				self.fxGlitch1700:setAlpha( 0 )
				f19_local2( fxGlitch1700, {} )
				fxGlitch1600:completeAnimation()
				self.fxGlitch1600:setLeftRight( true, true, 0, 0 )
				self.fxGlitch1600:setTopBottom( true, true, 54.5, -73 )
				self.clipFinished( fxGlitch1600, {} )
				fxGlitch1500:completeAnimation()
				self.fxGlitch1500:setLeftRight( true, true, 44, -31 )
				self.fxGlitch1500:setTopBottom( true, true, 69.04, -94.46 )
				self.clipFinished( fxGlitch1500, {} )
				local f19_local3 = function ( f54_arg0, f54_arg1 )
					local f54_local0 = function ( f19_arg0, f19_arg1 )
						local f19_local0 = function ( f23_arg0, f23_arg1 )
							local f23_local0 = function ( f25_arg0, f25_arg1 )
								if not f25_arg1.interrupted then
									f25_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								end
								f25_arg0:setLeftRight( true, true, 0, 0 )
								f25_arg0:setTopBottom( true, true, 54.5, -49.5 )
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
								f23_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f23_arg0:setAlpha( 0 )
								f23_arg0:registerEventHandler( "transition_complete_keyframe", f23_local0 )
							end
						end
						
						if f19_arg1.interrupted then
							f19_local0( f19_arg0, f19_arg1 )
							return 
						else
							f19_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							f19_arg0:setAlpha( 1 )
							f19_arg0:registerEventHandler( "transition_complete_keyframe", f19_local0 )
						end
					end
					
					if f54_arg1.interrupted then
						f54_local0( f54_arg0, f54_arg1 )
						return 
					else
						f54_arg0:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						f54_arg0:registerEventHandler( "transition_complete_keyframe", f54_local0 )
					end
				end
				
				fxGlitch1400:completeAnimation()
				self.fxGlitch1400:setLeftRight( true, true, 0, 0 )
				self.fxGlitch1400:setTopBottom( true, true, 54.5, -49.5 )
				self.fxGlitch1400:setAlpha( 0 )
				f19_local3( fxGlitch1400, {} )
				local f19_local4 = function ( f55_arg0, f55_arg1 )
					local f55_local0 = function ( f28_arg0, f28_arg1 )
						local f28_local0 = function ( f29_arg0, f29_arg1 )
							local f29_local0 = function ( f30_arg0, f30_arg1 )
								if not f30_arg1.interrupted then
									f30_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								end
								f30_arg0:setLeftRight( true, true, 4, -4 )
								f30_arg0:setTopBottom( true, true, 0, 0 )
								f30_arg0:setAlpha( 0 )
								if f30_arg1.interrupted then
									self.clipFinished( f30_arg0, f30_arg1 )
								else
									f30_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if f29_arg1.interrupted then
								f29_local0( f29_arg0, f29_arg1 )
								return 
							else
								f29_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								f29_arg0:setAlpha( 1 )
								f29_arg0:registerEventHandler( "transition_complete_keyframe", f29_local0 )
							end
						end
						
						if f28_arg1.interrupted then
							f28_local0( f28_arg0, f28_arg1 )
							return 
						else
							f28_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							f28_arg0:setAlpha( 0.25 )
							f28_arg0:registerEventHandler( "transition_complete_keyframe", f28_local0 )
						end
					end
					
					if f55_arg1.interrupted then
						f55_local0( f55_arg0, f55_arg1 )
						return 
					else
						f55_arg0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						f55_arg0:registerEventHandler( "transition_complete_keyframe", f55_local0 )
					end
				end
				
				fxGlitch1300:completeAnimation()
				self.fxGlitch1300:setLeftRight( true, true, 4, -4 )
				self.fxGlitch1300:setTopBottom( true, true, 0, 0 )
				self.fxGlitch1300:setAlpha( 0 )
				f19_local4( fxGlitch1300, {} )
				fxGlitch1200:completeAnimation()
				self.fxGlitch1200:setLeftRight( true, true, 0, 0 )
				self.fxGlitch1200:setTopBottom( true, true, 31, -9 )
				self.clipFinished( fxGlitch1200, {} )
				local f19_local5 = function ( f56_arg0, f56_arg1 )
					local f56_local0 = function ( f36_arg0, f36_arg1 )
						local f36_local0 = function ( f37_arg0, f37_arg1 )
							local f37_local0 = function ( f38_arg0, f38_arg1 )
								if not f38_arg1.interrupted then
									f38_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								end
								f38_arg0:setLeftRight( true, true, 0, 0 )
								f38_arg0:setTopBottom( true, true, 46, -34 )
								f38_arg0:setAlpha( 0 )
								if f38_arg1.interrupted then
									self.clipFinished( f38_arg0, f38_arg1 )
								else
									f38_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if f37_arg1.interrupted then
								f37_local0( f37_arg0, f37_arg1 )
								return 
							else
								f37_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f37_arg0:registerEventHandler( "transition_complete_keyframe", f37_local0 )
							end
						end
						
						if f36_arg1.interrupted then
							f36_local0( f36_arg0, f36_arg1 )
							return 
						else
							f36_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							f36_arg0:setAlpha( 1 )
							f36_arg0:registerEventHandler( "transition_complete_keyframe", f36_local0 )
						end
					end
					
					if f56_arg1.interrupted then
						f56_local0( f56_arg0, f56_arg1 )
						return 
					else
						f56_arg0:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
						f56_arg0:registerEventHandler( "transition_complete_keyframe", f56_local0 )
					end
				end
				
				fxGlitch1100:completeAnimation()
				self.fxGlitch1100:setLeftRight( true, true, 0, 0 )
				self.fxGlitch1100:setTopBottom( true, true, 46, -34 )
				self.fxGlitch1100:setAlpha( 0 )
				f19_local5( fxGlitch1100, {} )
			end,
			GlitchLarge2 = function ()
				self:setupElementClipCounter( 9 )
				local f20_local0 = function ( f1104_arg0, f1104_arg1 )
					local f1104_local0 = function ( f1111_arg0, f1111_arg1 )
						local f1111_local0 = function ( f1112_arg0, f1112_arg1 )
							local f1112_local0 = function ( f1113_arg0, f1113_arg1 )
								local f1113_local0 = function ( f19_arg0, f19_arg1 )
									local f19_local0 = function ( f20_arg0, f20_arg1 )
										local f20_local0 = function ( f21_arg0, f21_arg1 )
											if not f21_arg1.interrupted then
												f21_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											end
											f21_arg0:setLeftRight( true, true, 118, -118 )
											f21_arg0:setTopBottom( true, true, 79.54, -152.46 )
											f21_arg0:setAlpha( 0 )
											if f21_arg1.interrupted then
												self.clipFinished( f21_arg0, f21_arg1 )
											else
												f21_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if f20_arg1.interrupted then
											f20_local0( f20_arg0, f20_arg1 )
											return 
										else
											f20_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											f20_arg0:registerEventHandler( "transition_complete_keyframe", f20_local0 )
										end
									end
									
									if f19_arg1.interrupted then
										f19_local0( f19_arg0, f19_arg1 )
										return 
									else
										f19_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										f19_arg0:setTopBottom( true, true, 79.54, -152.46 )
										f19_arg0:setAlpha( 1 )
										f19_arg0:registerEventHandler( "transition_complete_keyframe", f19_local0 )
									end
								end
								
								if f1113_arg1.interrupted then
									f1113_local0( f1113_arg0, f1113_arg1 )
									return 
								else
									f1113_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									f1113_arg0:setTopBottom( true, true, 114.54, -117.46 )
									f1113_arg0:setAlpha( 0 )
									f1113_arg0:registerEventHandler( "transition_complete_keyframe", f1113_local0 )
								end
							end
							
							if f1112_arg1.interrupted then
								f1112_local0( f1112_arg0, f1112_arg1 )
								return 
							else
								f1112_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f1112_arg0:setTopBottom( true, true, 149.54, -82.46 )
								f1112_arg0:registerEventHandler( "transition_complete_keyframe", f1112_local0 )
							end
						end
						
						if f1111_arg1.interrupted then
							f1111_local0( f1111_arg0, f1111_arg1 )
							return 
						else
							f1111_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							f1111_arg0:setTopBottom( true, true, 147.55, -84.45 )
							f1111_arg0:setAlpha( 1 )
							f1111_arg0:registerEventHandler( "transition_complete_keyframe", f1111_local0 )
						end
					end
					
					if f1104_arg1.interrupted then
						f1104_local0( f1104_arg0, f1104_arg1 )
						return 
					else
						f1104_arg0:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
						f1104_arg0:setTopBottom( true, true, 145.57, -86.43 )
						f1104_arg0:registerEventHandler( "transition_complete_keyframe", f1104_local0 )
					end
				end
				
				fxGlitch1900:completeAnimation()
				self.fxGlitch1900:setLeftRight( true, true, 118, -118 )
				self.fxGlitch1900:setTopBottom( true, true, 82, -150 )
				self.fxGlitch1900:setAlpha( 0 )
				f20_local0( fxGlitch1900, {} )
				local f20_local1 = function ( f1105_arg0, f1105_arg1 )
					local f1105_local0 = function ( f23_arg0, f23_arg1 )
						local f23_local0 = function ( f24_arg0, f24_arg1 )
							local f24_local0 = function ( f26_arg0, f26_arg1 )
								local f26_local0 = function ( f27_arg0, f27_arg1 )
									local f27_local0 = function ( f28_arg0, f28_arg1 )
										local f28_local0 = function ( f29_arg0, f29_arg1 )
											local f29_local0 = function ( f30_arg0, f30_arg1 )
												local f30_local0 = function ( f31_arg0, f31_arg1 )
													local f31_local0 = function ( f32_arg0, f32_arg1 )
														local f32_local0 = function ( f33_arg0, f33_arg1 )
															local f33_local0 = function ( f35_arg0, f35_arg1 )
																if not f35_arg1.interrupted then
																	f35_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																end
																f35_arg0:setLeftRight( true, true, 0, 0 )
																f35_arg0:setTopBottom( true, true, 139, -83 )
																f35_arg0:setAlpha( 0 )
																if f35_arg1.interrupted then
																	self.clipFinished( f35_arg0, f35_arg1 )
																else
																	f35_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																end
															end
															
															if f33_arg1.interrupted then
																f33_local0( f33_arg0, f33_arg1 )
																return 
															else
																f33_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																f33_arg0:registerEventHandler( "transition_complete_keyframe", f33_local0 )
															end
														end
														
														if f32_arg1.interrupted then
															f32_local0( f32_arg0, f32_arg1 )
															return 
														else
															f32_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
															f32_arg0:setTopBottom( true, true, 139, -83 )
															f32_arg0:setAlpha( 1 )
															f32_arg0:registerEventHandler( "transition_complete_keyframe", f32_local0 )
														end
													end
													
													if f31_arg1.interrupted then
														f31_local0( f31_arg0, f31_arg1 )
														return 
													else
														f31_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
														f31_arg0:setTopBottom( true, true, 131.86, -90.14 )
														f31_arg0:registerEventHandler( "transition_complete_keyframe", f31_local0 )
													end
												end
												
												if f30_arg1.interrupted then
													f30_local0( f30_arg0, f30_arg1 )
													return 
												else
													f30_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													f30_arg0:setTopBottom( true, true, 103.29, -118.71 )
													f30_arg0:setAlpha( 0 )
													f30_arg0:registerEventHandler( "transition_complete_keyframe", f30_local0 )
												end
											end
											
											if f29_arg1.interrupted then
												f29_local0( f29_arg0, f29_arg1 )
												return 
											else
												f29_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												f29_arg0:setTopBottom( true, true, 96.14, -125.86 )
												f29_arg0:registerEventHandler( "transition_complete_keyframe", f29_local0 )
											end
										end
										
										if f28_arg1.interrupted then
											f28_local0( f28_arg0, f28_arg1 )
											return 
										else
											f28_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											f28_arg0:setTopBottom( true, true, 89, -133 )
											f28_arg0:setAlpha( 1 )
											f28_arg0:registerEventHandler( "transition_complete_keyframe", f28_local0 )
										end
									end
									
									if f27_arg1.interrupted then
										f27_local0( f27_arg0, f27_arg1 )
										return 
									else
										f27_arg0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
										f27_arg0:setTopBottom( true, true, 96.94, -125.06 )
										f27_arg0:registerEventHandler( "transition_complete_keyframe", f27_local0 )
									end
								end
								
								if f26_arg1.interrupted then
									f26_local0( f26_arg0, f26_arg1 )
									return 
								else
									f26_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									f26_arg0:setTopBottom( true, true, 144.56, -77.44 )
									f26_arg0:setAlpha( 0 )
									f26_arg0:registerEventHandler( "transition_complete_keyframe", f26_local0 )
								end
							end
							
							if f24_arg1.interrupted then
								f24_local0( f24_arg0, f24_arg1 )
								return 
							else
								f24_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								f24_arg0:registerEventHandler( "transition_complete_keyframe", f24_local0 )
							end
						end
						
						if f23_arg1.interrupted then
							f23_local0( f23_arg0, f23_arg1 )
							return 
						else
							f23_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							f23_arg0:setAlpha( 1 )
							f23_arg0:registerEventHandler( "transition_complete_keyframe", f23_local0 )
						end
					end
					
					if f1105_arg1.interrupted then
						f1105_local0( f1105_arg0, f1105_arg1 )
						return 
					else
						f1105_arg0:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
						f1105_arg0:registerEventHandler( "transition_complete_keyframe", f1105_local0 )
					end
				end
				
				fxGlitch1800:completeAnimation()
				self.fxGlitch1800:setLeftRight( true, true, 0, 0 )
				self.fxGlitch1800:setTopBottom( true, true, 152.5, -69.5 )
				self.fxGlitch1800:setAlpha( 0 )
				f20_local1( fxGlitch1800, {} )
				local f20_local2 = function ( f1106_arg0, f1106_arg1 )
					local f1106_local0 = function ( f36_arg0, f36_arg1 )
						local f36_local0 = function ( f37_arg0, f37_arg1 )
							local f37_local0 = function ( f6_arg0, f6_arg1 )
								if not f6_arg1.interrupted then
									f6_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								end
								f6_arg0:setLeftRight( true, true, 0, 0 )
								f6_arg0:setTopBottom( true, true, 94, -128 )
								f6_arg0:setAlpha( 0 )
								if f6_arg1.interrupted then
									self.clipFinished( f6_arg0, f6_arg1 )
								else
									f6_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if f37_arg1.interrupted then
								f37_local0( f37_arg0, f37_arg1 )
								return 
							else
								f37_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								f37_arg0:registerEventHandler( "transition_complete_keyframe", f37_local0 )
							end
						end
						
						if f36_arg1.interrupted then
							f36_local0( f36_arg0, f36_arg1 )
							return 
						else
							f36_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							f36_arg0:setAlpha( 1 )
							f36_arg0:registerEventHandler( "transition_complete_keyframe", f36_local0 )
						end
					end
					
					if f1106_arg1.interrupted then
						f1106_local0( f1106_arg0, f1106_arg1 )
						return 
					else
						f1106_arg0:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
						f1106_arg0:registerEventHandler( "transition_complete_keyframe", f1106_local0 )
					end
				end
				
				fxGlitch1700:completeAnimation()
				self.fxGlitch1700:setLeftRight( true, true, 0, 0 )
				self.fxGlitch1700:setTopBottom( true, true, 94, -128 )
				self.fxGlitch1700:setAlpha( 0 )
				f20_local2( fxGlitch1700, {} )
				fxGlitch1600:completeAnimation()
				self.fxGlitch1600:setLeftRight( true, true, 0, 0 )
				self.fxGlitch1600:setTopBottom( true, true, 54.5, -73 )
				self.clipFinished( fxGlitch1600, {} )
				fxGlitch1500:completeAnimation()
				self.fxGlitch1500:setLeftRight( true, true, 44, -31 )
				self.fxGlitch1500:setTopBottom( true, true, 69.04, -94.46 )
				self.clipFinished( fxGlitch1500, {} )
				local f20_local3 = function ( f1107_arg0, f1107_arg1 )
					local f1107_local0 = function ( f7_arg0, f7_arg1 )
						local f7_local0 = function ( f8_arg0, f8_arg1 )
							if not f8_arg1.interrupted then
								f8_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							end
							f8_arg0:setLeftRight( true, true, 0, 0 )
							f8_arg0:setTopBottom( true, true, 54.5, -49.5 )
							f8_arg0:setAlpha( 0 )
							if f8_arg1.interrupted then
								self.clipFinished( f8_arg0, f8_arg1 )
							else
								f8_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f7_arg1.interrupted then
							f7_local0( f7_arg0, f7_arg1 )
							return 
						else
							f7_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							f7_arg0:setAlpha( 1 )
							f7_arg0:registerEventHandler( "transition_complete_keyframe", f7_local0 )
						end
					end
					
					if f1107_arg1.interrupted then
						f1107_local0( f1107_arg0, f1107_arg1 )
						return 
					else
						f1107_arg0:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
						f1107_arg0:registerEventHandler( "transition_complete_keyframe", f1107_local0 )
					end
				end
				
				fxGlitch1400:completeAnimation()
				self.fxGlitch1400:setLeftRight( true, true, 0, 0 )
				self.fxGlitch1400:setTopBottom( true, true, 54.5, -49.5 )
				self.fxGlitch1400:setAlpha( 0 )
				f20_local3( fxGlitch1400, {} )
				fxGlitch1300:completeAnimation()
				self.fxGlitch1300:setLeftRight( true, true, 4, -4 )
				self.fxGlitch1300:setTopBottom( true, true, 0, 0 )
				self.clipFinished( fxGlitch1300, {} )
				local f20_local4 = function ( f1108_arg0, f1108_arg1 )
					local f1108_local0 = function ( f11_arg0, f11_arg1 )
						local f11_local0 = function ( f12_arg0, f12_arg1 )
							local f12_local0 = function ( f13_arg0, f13_arg1 )
								if not f13_arg1.interrupted then
									f13_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								end
								f13_arg0:setLeftRight( true, true, 0, 0 )
								f13_arg0:setTopBottom( true, true, 31, -9 )
								f13_arg0:setAlpha( 0 )
								if f13_arg1.interrupted then
									self.clipFinished( f13_arg0, f13_arg1 )
								else
									f13_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if f12_arg1.interrupted then
								f12_local0( f12_arg0, f12_arg1 )
								return 
							else
								f12_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								f12_arg0:registerEventHandler( "transition_complete_keyframe", f12_local0 )
							end
						end
						
						if f11_arg1.interrupted then
							f11_local0( f11_arg0, f11_arg1 )
							return 
						else
							f11_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							f11_arg0:setAlpha( 1 )
							f11_arg0:registerEventHandler( "transition_complete_keyframe", f11_local0 )
						end
					end
					
					if f1108_arg1.interrupted then
						f1108_local0( f1108_arg0, f1108_arg1 )
						return 
					else
						f1108_arg0:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						f1108_arg0:registerEventHandler( "transition_complete_keyframe", f1108_local0 )
					end
				end
				
				fxGlitch1200:completeAnimation()
				self.fxGlitch1200:setLeftRight( true, true, 0, 0 )
				self.fxGlitch1200:setTopBottom( true, true, 31, -9 )
				self.fxGlitch1200:setAlpha( 0 )
				f20_local4( fxGlitch1200, {} )
				local f20_local5 = function ( f1109_arg0, f1109_arg1 )
					local f1109_local0 = function ( f14_arg0, f14_arg1 )
						local f14_local0 = function ( f15_arg0, f15_arg1 )
							if not f15_arg1.interrupted then
								f15_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							end
							f15_arg0:setLeftRight( true, true, 0, 0 )
							f15_arg0:setTopBottom( true, true, 46, -34 )
							f15_arg0:setAlpha( 0 )
							if f15_arg1.interrupted then
								self.clipFinished( f15_arg0, f15_arg1 )
							else
								f15_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f14_arg1.interrupted then
							f14_local0( f14_arg0, f14_arg1 )
							return 
						else
							f14_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							f14_arg0:setAlpha( 1 )
							f14_arg0:registerEventHandler( "transition_complete_keyframe", f14_local0 )
						end
					end
					
					if f1109_arg1.interrupted then
						f1109_local0( f1109_arg0, f1109_arg1 )
						return 
					else
						f1109_arg0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						f1109_arg0:registerEventHandler( "transition_complete_keyframe", f1109_local0 )
					end
				end
				
				fxGlitch1100:completeAnimation()
				self.fxGlitch1100:setLeftRight( true, true, 0, 0 )
				self.fxGlitch1100:setTopBottom( true, true, 46, -34 )
				self.fxGlitch1100:setAlpha( 0 )
				f20_local5( fxGlitch1100, {} )
			end,
			GlitchSmall2Slow = function ()
				self:setupElementClipCounter( 9 )
				local f21_local0 = function ( f19_arg0, f19_arg1 )
					local f19_local0 = function ( f28_arg0, f28_arg1 )
						local f28_local0 = function ( f29_arg0, f29_arg1 )
							local f29_local0 = function ( f30_arg0, f30_arg1 )
								if not f30_arg1.interrupted then
									f30_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								end
								f30_arg0:setLeftRight( true, true, 118, -118 )
								f30_arg0:setTopBottom( true, true, 82, -150 )
								f30_arg0:setAlpha( 0 )
								if f30_arg1.interrupted then
									self.clipFinished( f30_arg0, f30_arg1 )
								else
									f30_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if f29_arg1.interrupted then
								f29_local0( f29_arg0, f29_arg1 )
								return 
							else
								f29_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f29_arg0:registerEventHandler( "transition_complete_keyframe", f29_local0 )
							end
						end
						
						if f28_arg1.interrupted then
							f28_local0( f28_arg0, f28_arg1 )
							return 
						else
							f28_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							f28_arg0:setAlpha( 1 )
							f28_arg0:registerEventHandler( "transition_complete_keyframe", f28_local0 )
						end
					end
					
					if f19_arg1.interrupted then
						f19_local0( f19_arg0, f19_arg1 )
						return 
					else
						f19_arg0:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
						f19_arg0:registerEventHandler( "transition_complete_keyframe", f19_local0 )
					end
				end
				
				fxGlitch1900:completeAnimation()
				self.fxGlitch1900:setLeftRight( true, true, 118, -118 )
				self.fxGlitch1900:setTopBottom( true, true, 82, -150 )
				self.fxGlitch1900:setAlpha( 0 )
				f21_local0( fxGlitch1900, {} )
				local f21_local1 = function ( f20_arg0, f20_arg1 )
					local f20_local0 = function ( f31_arg0, f31_arg1 )
						local f31_local0 = function ( f32_arg0, f32_arg1 )
							local f32_local0 = function ( f33_arg0, f33_arg1 )
								local f33_local0 = function ( f37_arg0, f37_arg1 )
									local f37_local0 = function ( f39_arg0, f39_arg1 )
										local f39_local0 = function ( f41_arg0, f41_arg1 )
											local f41_local0 = function ( f43_arg0, f43_arg1 )
												local f43_local0 = function ( f44_arg0, f44_arg1 )
													local f44_local0 = function ( f45_arg0, f45_arg1 )
														if not f45_arg1.interrupted then
															f45_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
														end
														f45_arg0:setLeftRight( true, true, 0, 0 )
														f45_arg0:setTopBottom( true, true, 97, -125 )
														f45_arg0:setAlpha( 0 )
														if f45_arg1.interrupted then
															self.clipFinished( f45_arg0, f45_arg1 )
														else
															f45_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if f44_arg1.interrupted then
														f44_local0( f44_arg0, f44_arg1 )
														return 
													else
														f44_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
														f44_arg0:setAlpha( 0.72 )
														f44_arg0:registerEventHandler( "transition_complete_keyframe", f44_local0 )
													end
												end
												
												if f43_arg1.interrupted then
													f43_local0( f43_arg0, f43_arg1 )
													return 
												else
													f43_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													f43_arg0:setTopBottom( true, true, 97, -125 )
													f43_arg0:registerEventHandler( "transition_complete_keyframe", f43_local0 )
												end
											end
											
											if f41_arg1.interrupted then
												f41_local0( f41_arg0, f41_arg1 )
												return 
											else
												f41_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												f41_arg0:setTopBottom( true, true, 113.67, -108.33 )
												f41_arg0:setAlpha( 0 )
												f41_arg0:registerEventHandler( "transition_complete_keyframe", f41_local0 )
											end
										end
										
										if f39_arg1.interrupted then
											f39_local0( f39_arg0, f39_arg1 )
											return 
										else
											f39_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											f39_arg0:setTopBottom( true, true, 122, -100 )
											f39_arg0:setAlpha( 1 )
											f39_arg0:registerEventHandler( "transition_complete_keyframe", f39_local0 )
										end
									end
									
									if f37_arg1.interrupted then
										f37_local0( f37_arg0, f37_arg1 )
										return 
									else
										f37_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
										f37_arg0:setTopBottom( true, true, 116.6, -105.4 )
										f37_arg0:registerEventHandler( "transition_complete_keyframe", f37_local0 )
									end
								end
								
								if f33_arg1.interrupted then
									f33_local0( f33_arg0, f33_arg1 )
									return 
								else
									f33_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									f33_arg0:setTopBottom( true, true, 100.4, -121.6 )
									f33_arg0:setAlpha( 0 )
									f33_arg0:registerEventHandler( "transition_complete_keyframe", f33_local0 )
								end
							end
							
							if f32_arg1.interrupted then
								f32_local0( f32_arg0, f32_arg1 )
								return 
							else
								f32_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f32_arg0:registerEventHandler( "transition_complete_keyframe", f32_local0 )
							end
						end
						
						if f31_arg1.interrupted then
							f31_local0( f31_arg0, f31_arg1 )
							return 
						else
							f31_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							f31_arg0:setAlpha( 0.8 )
							f31_arg0:registerEventHandler( "transition_complete_keyframe", f31_local0 )
						end
					end
					
					if f20_arg1.interrupted then
						f20_local0( f20_arg0, f20_arg1 )
						return 
					else
						f20_arg0:beginAnimation( "keyframe", 349, false, false, CoD.TweenType.Linear )
						f20_arg0:registerEventHandler( "transition_complete_keyframe", f20_local0 )
					end
				end
				
				fxGlitch1800:completeAnimation()
				self.fxGlitch1800:setLeftRight( true, true, 0, 0 )
				self.fxGlitch1800:setTopBottom( true, true, 95, -127 )
				self.fxGlitch1800:setAlpha( 0 )
				f21_local1( fxGlitch1800, {} )
				local f21_local2 = function ( f21_arg0, f21_arg1 )
					local f21_local0 = function ( f46_arg0, f46_arg1 )
						local f46_local0 = function ( f48_arg0, f48_arg1 )
							local f48_local0 = function ( f49_arg0, f49_arg1 )
								if not f49_arg1.interrupted then
									f49_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								end
								f49_arg0:setLeftRight( true, true, 0, 0 )
								f49_arg0:setTopBottom( true, true, 113, -109 )
								f49_arg0:setAlpha( 0 )
								if f49_arg1.interrupted then
									self.clipFinished( f49_arg0, f49_arg1 )
								else
									f49_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if f48_arg1.interrupted then
								f48_local0( f48_arg0, f48_arg1 )
								return 
							else
								f48_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f48_arg0:setAlpha( 0.16 )
								f48_arg0:registerEventHandler( "transition_complete_keyframe", f48_local0 )
							end
						end
						
						if f46_arg1.interrupted then
							f46_local0( f46_arg0, f46_arg1 )
							return 
						else
							f46_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							f46_arg0:setAlpha( 0.19 )
							f46_arg0:registerEventHandler( "transition_complete_keyframe", f46_local0 )
						end
					end
					
					if f21_arg1.interrupted then
						f21_local0( f21_arg0, f21_arg1 )
						return 
					else
						f21_arg0:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Linear )
						f21_arg0:registerEventHandler( "transition_complete_keyframe", f21_local0 )
					end
				end
				
				fxGlitch1700:completeAnimation()
				self.fxGlitch1700:setLeftRight( true, true, 0, 0 )
				self.fxGlitch1700:setTopBottom( true, true, 113, -109 )
				self.fxGlitch1700:setAlpha( 0 )
				f21_local2( fxGlitch1700, {} )
				local f21_local3 = function ( f22_arg0, f22_arg1 )
					local f22_local0 = function ( f50_arg0, f50_arg1 )
						local f50_local0 = function ( f51_arg0, f51_arg1 )
							if not f51_arg1.interrupted then
								f51_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							end
							f51_arg0:setLeftRight( true, true, 0, 0 )
							f51_arg0:setTopBottom( true, true, 54.5, -73 )
							f51_arg0:setAlpha( 0 )
							if f51_arg1.interrupted then
								self.clipFinished( f51_arg0, f51_arg1 )
							else
								f51_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f50_arg1.interrupted then
							f50_local0( f50_arg0, f50_arg1 )
							return 
						else
							f50_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							f50_arg0:setAlpha( 0.28 )
							f50_arg0:registerEventHandler( "transition_complete_keyframe", f50_local0 )
						end
					end
					
					if f22_arg1.interrupted then
						f22_local0( f22_arg0, f22_arg1 )
						return 
					else
						f22_arg0:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
						f22_arg0:registerEventHandler( "transition_complete_keyframe", f22_local0 )
					end
				end
				
				fxGlitch1600:completeAnimation()
				self.fxGlitch1600:setLeftRight( true, true, 0, 0 )
				self.fxGlitch1600:setTopBottom( true, true, 54.5, -73 )
				self.fxGlitch1600:setAlpha( 0 )
				f21_local3( fxGlitch1600, {} )
				fxGlitch1500:completeAnimation()
				self.fxGlitch1500:setLeftRight( true, true, 139, -157 )
				self.fxGlitch1500:setTopBottom( true, true, 54.5, -82.5 )
				self.clipFinished( fxGlitch1500, {} )
				local f21_local4 = function ( f23_arg0, f23_arg1 )
					local f23_local0 = function ( f52_arg0, f52_arg1 )
						local f52_local0 = function ( f65_arg0, f65_arg1 )
							if not f65_arg1.interrupted then
								f65_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							end
							f65_arg0:setLeftRight( true, true, 0, 0 )
							f65_arg0:setTopBottom( true, true, 54.5, -49.5 )
							f65_arg0:setAlpha( 0 )
							if f65_arg1.interrupted then
								self.clipFinished( f65_arg0, f65_arg1 )
							else
								f65_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f52_arg1.interrupted then
							f52_local0( f52_arg0, f52_arg1 )
							return 
						else
							f52_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							f52_arg0:setAlpha( 0.33 )
							f52_arg0:registerEventHandler( "transition_complete_keyframe", f52_local0 )
						end
					end
					
					if f23_arg1.interrupted then
						f23_local0( f23_arg0, f23_arg1 )
						return 
					else
						f23_arg0:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Linear )
						f23_arg0:registerEventHandler( "transition_complete_keyframe", f23_local0 )
					end
				end
				
				fxGlitch1400:completeAnimation()
				self.fxGlitch1400:setLeftRight( true, true, 0, 0 )
				self.fxGlitch1400:setTopBottom( true, true, 54.5, -49.5 )
				self.fxGlitch1400:setAlpha( 0 )
				f21_local4( fxGlitch1400, {} )
				fxGlitch1300:completeAnimation()
				self.fxGlitch1300:setLeftRight( true, true, 4, -4 )
				self.fxGlitch1300:setTopBottom( true, true, 0, 0 )
				self.clipFinished( fxGlitch1300, {} )
				fxGlitch1200:completeAnimation()
				self.fxGlitch1200:setLeftRight( true, true, 0, 0 )
				self.fxGlitch1200:setTopBottom( true, true, 31, -9 )
				self.clipFinished( fxGlitch1200, {} )
				fxGlitch1100:completeAnimation()
				self.fxGlitch1100:setLeftRight( true, true, 0, 0 )
				self.fxGlitch1100:setTopBottom( true, true, 46, -34 )
				self.clipFinished( fxGlitch1100, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.fxGlitch1900:close()
		element.fxGlitch1800:close()
		element.fxGlitch1700:close()
		element.fxGlitch1600:close()
		element.fxGlitch1500:close()
		element.fxGlitch1400:close()
		element.fxGlitch1300:close()
		element.fxGlitch1200:close()
		element.fxGlitch1100:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

