-- d41d8cd98f00b204e9800998ecf8427e
-- This hash is used for caching, delete to decompile the file again

CoD.OutcomeFactionIconItemForCodCaster = InheritFrom( LUI.UIElement )
CoD.OutcomeFactionIconItemForCodCaster.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.OutcomeFactionIconItemForCodCaster )
	self.id = "OutcomeFactionIconItemForCodCaster"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 222 )
	self:setTopBottom( true, false, 0, 140 )
	
	local WinningTeamFactionIcon0 = LUI.UIImage.new()
	WinningTeamFactionIcon0:setLeftRight( true, false, 0, 222 )
	WinningTeamFactionIcon0:setTopBottom( true, false, 0, 140 )
	WinningTeamFactionIcon0:setRGB( 0, 0, 0 )
	WinningTeamFactionIcon0:setAlpha( 0.5 )
	WinningTeamFactionIcon0:setImage( RegisterImage( "uie_t7_icon_team_winslow" ) )
	self:addElement( WinningTeamFactionIcon0 )
	self.WinningTeamFactionIcon0 = WinningTeamFactionIcon0
	
	local WinningTeamFactionIcon = LUI.UIImage.new()
	WinningTeamFactionIcon:setLeftRight( true, false, 0, 222 )
	WinningTeamFactionIcon:setTopBottom( true, false, 0, 140 )
	WinningTeamFactionIcon:setImage( RegisterImage( "uie_t7_icon_team_winslow" ) )
	WinningTeamFactionIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( WinningTeamFactionIcon )
	self.WinningTeamFactionIcon = WinningTeamFactionIcon
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, 37, 193 )
	Image1:setTopBottom( true, false, 2.34, 139.56 )
	Image1:setAlpha( 0.15 )
	Image1:setImage( RegisterImage( "uie_t7_mp_menu_startflow_hexlarge" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Pixel20100 = LUI.UIImage.new()
	Pixel20100:setLeftRight( true, false, 47.5, 83.5 )
	Pixel20100:setTopBottom( false, false, 60.22, 64.22 )
	Pixel20100:setAlpha( 0.73 )
	Pixel20100:setYRot( -180 )
	Pixel20100:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel20100:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel20100 )
	self.Pixel20100 = Pixel20100
	
	local Pixel201000 = LUI.UIImage.new()
	Pixel201000:setLeftRight( true, false, 47.5, 83.5 )
	Pixel201000:setTopBottom( false, false, -61.78, -57.78 )
	Pixel201000:setAlpha( 0.73 )
	Pixel201000:setYRot( -180 )
	Pixel201000:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel201000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel201000 )
	self.Pixel201000 = Pixel201000
	
	local Pixel201001 = LUI.UIImage.new()
	Pixel201001:setLeftRight( true, false, 142.5, 178.5 )
	Pixel201001:setTopBottom( false, false, 60.22, 64.22 )
	Pixel201001:setAlpha( 0.73 )
	Pixel201001:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel201001:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel201001 )
	self.Pixel201001 = Pixel201001
	
	local Pixel2010000 = LUI.UIImage.new()
	Pixel2010000:setLeftRight( true, false, 142.5, 178.5 )
	Pixel2010000:setTopBottom( false, false, -61.78, -57.78 )
	Pixel2010000:setAlpha( 0.73 )
	Pixel2010000:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel2010000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2010000 )
	self.Pixel2010000 = Pixel2010000
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				local f2_local0 = function ( f4_arg0, f4_arg1 )
					local f4_local0 = function ( f11_arg0, f11_arg1 )
						if not f11_arg1.interrupted then
							f11_arg0:beginAnimation( "keyframe", 130, false, false, CoD.TweenType.Bounce )
						end
						f11_arg0:setAlpha( 0.5 )
						if f11_arg1.interrupted then
							self.clipFinished( f11_arg0, f11_arg1 )
						else
							f11_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f4_arg1.interrupted then
						f4_local0( f4_arg0, f4_arg1 )
						return 
					else
						f4_arg0:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
						f4_arg0:registerEventHandler( "transition_complete_keyframe", f4_local0 )
					end
				end
				
				WinningTeamFactionIcon0:completeAnimation()
				self.WinningTeamFactionIcon0:setAlpha( 0 )
				f2_local0( WinningTeamFactionIcon0, {} )
				local f2_local1 = function ( f5_arg0, f5_arg1 )
					local f5_local0 = function ( f13_arg0, f13_arg1 )
						if not f13_arg1.interrupted then
							f13_arg0:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Bounce )
						end
						f13_arg0:setAlpha( 1 )
						if f13_arg1.interrupted then
							self.clipFinished( f13_arg0, f13_arg1 )
						else
							f13_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f5_arg1.interrupted then
						f5_local0( f5_arg0, f5_arg1 )
						return 
					else
						f5_arg0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						f5_arg0:registerEventHandler( "transition_complete_keyframe", f5_local0 )
					end
				end
				
				WinningTeamFactionIcon:completeAnimation()
				self.WinningTeamFactionIcon:setAlpha( 0 )
				f2_local1( WinningTeamFactionIcon, {} )
				local f2_local2 = function ( f6_arg0, f6_arg1 )
					local f6_local0 = function ( f2_arg0, f2_arg1 )
						if not f2_arg1.interrupted then
							f2_arg0:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Bounce )
						end
						f2_arg0:setAlpha( 0.15 )
						if f2_arg1.interrupted then
							self.clipFinished( f2_arg0, f2_arg1 )
						else
							f2_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f6_arg1.interrupted then
						f6_local0( f6_arg0, f6_arg1 )
						return 
					else
						f6_arg0:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
						f6_arg0:registerEventHandler( "transition_complete_keyframe", f6_local0 )
					end
				end
				
				Image1:completeAnimation()
				self.Image1:setAlpha( 0 )
				f2_local2( Image1, {} )
				local f2_local3 = function ( f7_arg0, f7_arg1 )
					local f7_local0 = function ( f12_arg0, f12_arg1 )
						if not f12_arg1.interrupted then
							f12_arg0:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Bounce )
						end
						f12_arg0:setAlpha( 0.73 )
						if f12_arg1.interrupted then
							self.clipFinished( f12_arg0, f12_arg1 )
						else
							f12_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f7_arg1.interrupted then
						f7_local0( f7_arg0, f7_arg1 )
						return 
					else
						f7_arg0:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
						f7_arg0:registerEventHandler( "transition_complete_keyframe", f7_local0 )
					end
				end
				
				Pixel20100:completeAnimation()
				self.Pixel20100:setAlpha( 0 )
				f2_local3( Pixel20100, {} )
				local f2_local4 = function ( f8_arg0, f8_arg1 )
					local f8_local0 = function ( f14_arg0, f14_arg1 )
						if not f14_arg1.interrupted then
							f14_arg0:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Bounce )
						end
						f14_arg0:setAlpha( 0.73 )
						if f14_arg1.interrupted then
							self.clipFinished( f14_arg0, f14_arg1 )
						else
							f14_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f8_arg1.interrupted then
						f8_local0( f8_arg0, f8_arg1 )
						return 
					else
						f8_arg0:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Linear )
						f8_arg0:registerEventHandler( "transition_complete_keyframe", f8_local0 )
					end
				end
				
				Pixel201000:completeAnimation()
				self.Pixel201000:setAlpha( 0 )
				f2_local4( Pixel201000, {} )
				local f2_local5 = function ( f9_arg0, f9_arg1 )
					local f9_local0 = function ( f16_arg0, f16_arg1 )
						if not f16_arg1.interrupted then
							f16_arg0:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Bounce )
						end
						f16_arg0:setAlpha( 0.73 )
						if f16_arg1.interrupted then
							self.clipFinished( f16_arg0, f16_arg1 )
						else
							f16_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f9_arg1.interrupted then
						f9_local0( f9_arg0, f9_arg1 )
						return 
					else
						f9_arg0:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Linear )
						f9_arg0:registerEventHandler( "transition_complete_keyframe", f9_local0 )
					end
				end
				
				Pixel201001:completeAnimation()
				self.Pixel201001:setAlpha( 0 )
				f2_local5( Pixel201001, {} )
				local f2_local6 = function ( f10_arg0, f10_arg1 )
					local f10_local0 = function ( f19_arg0, f19_arg1 )
						if not f19_arg1.interrupted then
							f19_arg0:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Bounce )
						end
						f19_arg0:setAlpha( 0.73 )
						if f19_arg1.interrupted then
							self.clipFinished( f19_arg0, f19_arg1 )
						else
							f19_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f10_arg1.interrupted then
						f10_local0( f10_arg0, f10_arg1 )
						return 
					else
						f10_arg0:beginAnimation( "keyframe", 479, false, false, CoD.TweenType.Linear )
						f10_arg0:registerEventHandler( "transition_complete_keyframe", f10_local0 )
					end
				end
				
				Pixel2010000:completeAnimation()
				self.Pixel2010000:setAlpha( 0 )
				f2_local6( Pixel2010000, {} )
			end
		},
		Killcam = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				WinningTeamFactionIcon0:completeAnimation()
				self.WinningTeamFactionIcon0:setAlpha( 0 )
				self.clipFinished( WinningTeamFactionIcon0, {} )
				WinningTeamFactionIcon:completeAnimation()
				self.WinningTeamFactionIcon:setAlpha( 0 )
				self.clipFinished( WinningTeamFactionIcon, {} )
				Image1:completeAnimation()
				self.Image1:setAlpha( 0 )
				self.clipFinished( Image1, {} )
				Pixel20100:completeAnimation()
				self.Pixel20100:setAlpha( 0 )
				self.clipFinished( Pixel20100, {} )
				Pixel201000:completeAnimation()
				self.Pixel201000:setAlpha( 0 )
				self.clipFinished( Pixel201000, {} )
				Pixel201001:completeAnimation()
				self.Pixel201001:setAlpha( 0 )
				self.clipFinished( Pixel201001, {} )
				Pixel2010000:completeAnimation()
				self.Pixel2010000:setAlpha( 0 )
				self.clipFinished( Pixel2010000, {} )
			end
		},
		FinalKillcam = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				local f4_local0 = function ( f6_arg0, f6_arg1 )
					local f6_local0 = function ( f29_arg0, f29_arg1 )
						if not f29_arg1.interrupted then
							f29_arg0:beginAnimation( "keyframe", 130, false, false, CoD.TweenType.Bounce )
						end
						f29_arg0:setAlpha( 0.5 )
						if f29_arg1.interrupted then
							self.clipFinished( f29_arg0, f29_arg1 )
						else
							f29_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f6_arg1.interrupted then
						f6_local0( f6_arg0, f6_arg1 )
						return 
					else
						f6_arg0:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
						f6_arg0:registerEventHandler( "transition_complete_keyframe", f6_local0 )
					end
				end
				
				WinningTeamFactionIcon0:completeAnimation()
				self.WinningTeamFactionIcon0:setAlpha( 0 )
				f4_local0( WinningTeamFactionIcon0, {} )
				local f4_local1 = function ( f7_arg0, f7_arg1 )
					local f7_local0 = function ( f40_arg0, f40_arg1 )
						if not f40_arg1.interrupted then
							f40_arg0:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Bounce )
						end
						f40_arg0:setAlpha( 1 )
						if f40_arg1.interrupted then
							self.clipFinished( f40_arg0, f40_arg1 )
						else
							f40_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f7_arg1.interrupted then
						f7_local0( f7_arg0, f7_arg1 )
						return 
					else
						f7_arg0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						f7_arg0:registerEventHandler( "transition_complete_keyframe", f7_local0 )
					end
				end
				
				WinningTeamFactionIcon:completeAnimation()
				self.WinningTeamFactionIcon:setAlpha( 0 )
				f4_local1( WinningTeamFactionIcon, {} )
				local f4_local2 = function ( f8_arg0, f8_arg1 )
					local f8_local0 = function ( f43_arg0, f43_arg1 )
						if not f43_arg1.interrupted then
							f43_arg0:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Bounce )
						end
						f43_arg0:setAlpha( 0.15 )
						if f43_arg1.interrupted then
							self.clipFinished( f43_arg0, f43_arg1 )
						else
							f43_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f8_arg1.interrupted then
						f8_local0( f8_arg0, f8_arg1 )
						return 
					else
						f8_arg0:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
						f8_arg0:registerEventHandler( "transition_complete_keyframe", f8_local0 )
					end
				end
				
				Image1:completeAnimation()
				self.Image1:setAlpha( 0 )
				f4_local2( Image1, {} )
				local f4_local3 = function ( f9_arg0, f9_arg1 )
					local f9_local0 = function ( f45_arg0, f45_arg1 )
						if not f45_arg1.interrupted then
							f45_arg0:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Bounce )
						end
						f45_arg0:setAlpha( 0.73 )
						if f45_arg1.interrupted then
							self.clipFinished( f45_arg0, f45_arg1 )
						else
							f45_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f9_arg1.interrupted then
						f9_local0( f9_arg0, f9_arg1 )
						return 
					else
						f9_arg0:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
						f9_arg0:registerEventHandler( "transition_complete_keyframe", f9_local0 )
					end
				end
				
				Pixel20100:completeAnimation()
				self.Pixel20100:setAlpha( 0 )
				f4_local3( Pixel20100, {} )
				local f4_local4 = function ( f10_arg0, f10_arg1 )
					local f10_local0 = function ( f51_arg0, f51_arg1 )
						if not f51_arg1.interrupted then
							f51_arg0:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Bounce )
						end
						f51_arg0:setAlpha( 0.73 )
						if f51_arg1.interrupted then
							self.clipFinished( f51_arg0, f51_arg1 )
						else
							f51_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f10_arg1.interrupted then
						f10_local0( f10_arg0, f10_arg1 )
						return 
					else
						f10_arg0:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Linear )
						f10_arg0:registerEventHandler( "transition_complete_keyframe", f10_local0 )
					end
				end
				
				Pixel201000:completeAnimation()
				self.Pixel201000:setAlpha( 0 )
				f4_local4( Pixel201000, {} )
				local f4_local5 = function ( f11_arg0, f11_arg1 )
					local f11_local0 = function ( f7_arg0, f7_arg1 )
						if not f7_arg1.interrupted then
							f7_arg0:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Bounce )
						end
						f7_arg0:setAlpha( 0.73 )
						if f7_arg1.interrupted then
							self.clipFinished( f7_arg0, f7_arg1 )
						else
							f7_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f11_arg1.interrupted then
						f11_local0( f11_arg0, f11_arg1 )
						return 
					else
						f11_arg0:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Linear )
						f11_arg0:registerEventHandler( "transition_complete_keyframe", f11_local0 )
					end
				end
				
				Pixel201001:completeAnimation()
				self.Pixel201001:setAlpha( 0 )
				f4_local5( Pixel201001, {} )
				local f4_local6 = function ( f12_arg0, f12_arg1 )
					local f12_local0 = function ( f10_arg0, f10_arg1 )
						if not f10_arg1.interrupted then
							f10_arg0:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Bounce )
						end
						f10_arg0:setAlpha( 0.73 )
						if f10_arg1.interrupted then
							self.clipFinished( f10_arg0, f10_arg1 )
						else
							f10_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f12_arg1.interrupted then
						f12_local0( f12_arg0, f12_arg1 )
						return 
					else
						f12_arg0:beginAnimation( "keyframe", 479, false, false, CoD.TweenType.Linear )
						f12_arg0:registerEventHandler( "transition_complete_keyframe", f12_local0 )
					end
				end
				
				Pixel2010000:completeAnimation()
				self.Pixel2010000:setAlpha( 0 )
				f4_local6( Pixel2010000, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

