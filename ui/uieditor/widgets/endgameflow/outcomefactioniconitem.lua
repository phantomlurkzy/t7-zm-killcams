-- d41d8cd98f00b204e9800998ecf8427e
-- This hash is used for caching, delete to decompile the file again

CoD.OutcomeFactionIconItem = InheritFrom( LUI.UIElement )
CoD.OutcomeFactionIconItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.OutcomeFactionIconItem )
	self.id = "OutcomeFactionIconItem"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 152 )
	self:setTopBottom( true, false, 0, 140 )
	
	local WinningTeamFactionIcon0 = LUI.UIImage.new()
	WinningTeamFactionIcon0:setLeftRight( true, true, 6, -7.46 )
	WinningTeamFactionIcon0:setTopBottom( true, true, 0, -0.56 )
	WinningTeamFactionIcon0:setRGB( 0, 0, 0 )
	WinningTeamFactionIcon0:setAlpha( 0.5 )
	WinningTeamFactionIcon0:setImage( RegisterImage( "uie_t7_mp_hud_faction_icon_faction1" ) )
	self:addElement( WinningTeamFactionIcon0 )
	self.WinningTeamFactionIcon0 = WinningTeamFactionIcon0
	
	local WinningTeamFactionIcon = LUI.UIImage.new()
	WinningTeamFactionIcon:setLeftRight( true, true, 6, -7.46 )
	WinningTeamFactionIcon:setTopBottom( true, true, 0, -0.56 )
	WinningTeamFactionIcon:setImage( RegisterImage( "uie_t7_mp_hud_faction_icon_faction1" ) )
	WinningTeamFactionIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( WinningTeamFactionIcon )
	self.WinningTeamFactionIcon = WinningTeamFactionIcon
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, 0, 152.46 )
	Image1:setTopBottom( true, false, 2.34, 139.56 )
	Image1:setAlpha( 0.15 )
	Image1:setImage( RegisterImage( "uie_t7_mp_menu_startflow_hexlarge" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Pixel20100 = LUI.UIImage.new()
	Pixel20100:setLeftRight( true, false, 10.5, 46.5 )
	Pixel20100:setTopBottom( false, false, 60.22, 64.22 )
	Pixel20100:setAlpha( 0.73 )
	Pixel20100:setYRot( -180 )
	Pixel20100:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel20100:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel20100 )
	self.Pixel20100 = Pixel20100
	
	local Pixel201000 = LUI.UIImage.new()
	Pixel201000:setLeftRight( true, false, 10.5, 46.5 )
	Pixel201000:setTopBottom( false, false, -61.78, -57.78 )
	Pixel201000:setAlpha( 0.73 )
	Pixel201000:setYRot( -180 )
	Pixel201000:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel201000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel201000 )
	self.Pixel201000 = Pixel201000
	
	local Pixel201001 = LUI.UIImage.new()
	Pixel201001:setLeftRight( true, false, 105.5, 141.5 )
	Pixel201001:setTopBottom( false, false, 60.22, 64.22 )
	Pixel201001:setAlpha( 0.73 )
	Pixel201001:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel201001:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel201001 )
	self.Pixel201001 = Pixel201001
	
	local Pixel2010000 = LUI.UIImage.new()
	Pixel2010000:setLeftRight( true, false, 105.5, 141.5 )
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
				local f2_local0 = function ( f42_arg0, f42_arg1 )
					local f42_local0 = function ( f53_arg0, f53_arg1 )
						if not f53_arg1.interrupted then
							f53_arg0:beginAnimation( "keyframe", 130, false, false, CoD.TweenType.Bounce )
						end
						f53_arg0:setAlpha( 0.5 )
						if f53_arg1.interrupted then
							self.clipFinished( f53_arg0, f53_arg1 )
						else
							f53_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f42_arg1.interrupted then
						f42_local0( f42_arg0, f42_arg1 )
						return 
					else
						f42_arg0:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
						f42_arg0:registerEventHandler( "transition_complete_keyframe", f42_local0 )
					end
				end
				
				WinningTeamFactionIcon0:completeAnimation()
				self.WinningTeamFactionIcon0:setAlpha( 0 )
				f2_local0( WinningTeamFactionIcon0, {} )
				local f2_local1 = function ( f43_arg0, f43_arg1 )
					local f43_local0 = function ( f55_arg0, f55_arg1 )
						if not f55_arg1.interrupted then
							f55_arg0:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Bounce )
						end
						f55_arg0:setAlpha( 1 )
						if f55_arg1.interrupted then
							self.clipFinished( f55_arg0, f55_arg1 )
						else
							f55_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f43_arg1.interrupted then
						f43_local0( f43_arg0, f43_arg1 )
						return 
					else
						f43_arg0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						f43_arg0:registerEventHandler( "transition_complete_keyframe", f43_local0 )
					end
				end
				
				WinningTeamFactionIcon:completeAnimation()
				self.WinningTeamFactionIcon:setAlpha( 0 )
				f2_local1( WinningTeamFactionIcon, {} )
				local f2_local2 = function ( f44_arg0, f44_arg1 )
					local f44_local0 = function ( f58_arg0, f58_arg1 )
						if not f58_arg1.interrupted then
							f58_arg0:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Bounce )
						end
						f58_arg0:setAlpha( 0.15 )
						if f58_arg1.interrupted then
							self.clipFinished( f58_arg0, f58_arg1 )
						else
							f58_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f44_arg1.interrupted then
						f44_local0( f44_arg0, f44_arg1 )
						return 
					else
						f44_arg0:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
						f44_arg0:registerEventHandler( "transition_complete_keyframe", f44_local0 )
					end
				end
				
				Image1:completeAnimation()
				self.Image1:setAlpha( 0 )
				f2_local2( Image1, {} )
				local f2_local3 = function ( f45_arg0, f45_arg1 )
					local f45_local0 = function ( f4_arg0, f4_arg1 )
						if not f4_arg1.interrupted then
							f4_arg0:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Bounce )
						end
						f4_arg0:setAlpha( 0.73 )
						if f4_arg1.interrupted then
							self.clipFinished( f4_arg0, f4_arg1 )
						else
							f4_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f45_arg1.interrupted then
						f45_local0( f45_arg0, f45_arg1 )
						return 
					else
						f45_arg0:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
						f45_arg0:registerEventHandler( "transition_complete_keyframe", f45_local0 )
					end
				end
				
				Pixel20100:completeAnimation()
				self.Pixel20100:setAlpha( 0 )
				f2_local3( Pixel20100, {} )
				local f2_local4 = function ( f46_arg0, f46_arg1 )
					local f46_local0 = function ( f5_arg0, f5_arg1 )
						if not f5_arg1.interrupted then
							f5_arg0:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Bounce )
						end
						f5_arg0:setAlpha( 0.73 )
						if f5_arg1.interrupted then
							self.clipFinished( f5_arg0, f5_arg1 )
						else
							f5_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f46_arg1.interrupted then
						f46_local0( f46_arg0, f46_arg1 )
						return 
					else
						f46_arg0:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Linear )
						f46_arg0:registerEventHandler( "transition_complete_keyframe", f46_local0 )
					end
				end
				
				Pixel201000:completeAnimation()
				self.Pixel201000:setAlpha( 0 )
				f2_local4( Pixel201000, {} )
				local f2_local5 = function ( f47_arg0, f47_arg1 )
					local f47_local0 = function ( f12_arg0, f12_arg1 )
						if not f12_arg1.interrupted then
							f12_arg0:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Bounce )
						end
						f12_arg0:setAlpha( 0.73 )
						if f12_arg1.interrupted then
							self.clipFinished( f12_arg0, f12_arg1 )
						else
							f12_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f47_arg1.interrupted then
						f47_local0( f47_arg0, f47_arg1 )
						return 
					else
						f47_arg0:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Linear )
						f47_arg0:registerEventHandler( "transition_complete_keyframe", f47_local0 )
					end
				end
				
				Pixel201001:completeAnimation()
				self.Pixel201001:setAlpha( 0 )
				f2_local5( Pixel201001, {} )
				local f2_local6 = function ( f48_arg0, f48_arg1 )
					local f48_local0 = function ( f14_arg0, f14_arg1 )
						if not f14_arg1.interrupted then
							f14_arg0:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Bounce )
						end
						f14_arg0:setAlpha( 0.73 )
						if f14_arg1.interrupted then
							self.clipFinished( f14_arg0, f14_arg1 )
						else
							f14_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f48_arg1.interrupted then
						f48_local0( f48_arg0, f48_arg1 )
						return 
					else
						f48_arg0:beginAnimation( "keyframe", 479, false, false, CoD.TweenType.Linear )
						f48_arg0:registerEventHandler( "transition_complete_keyframe", f48_local0 )
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
				local f4_local0 = function ( f20_arg0, f20_arg1 )
					local f20_local0 = function ( f28_arg0, f28_arg1 )
						if not f28_arg1.interrupted then
							f28_arg0:beginAnimation( "keyframe", 130, false, false, CoD.TweenType.Bounce )
						end
						f28_arg0:setAlpha( 0.5 )
						if f28_arg1.interrupted then
							self.clipFinished( f28_arg0, f28_arg1 )
						else
							f28_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f20_arg1.interrupted then
						f20_local0( f20_arg0, f20_arg1 )
						return 
					else
						f20_arg0:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
						f20_arg0:registerEventHandler( "transition_complete_keyframe", f20_local0 )
					end
				end
				
				WinningTeamFactionIcon0:completeAnimation()
				self.WinningTeamFactionIcon0:setAlpha( 0 )
				f4_local0( WinningTeamFactionIcon0, {} )
				local f4_local1 = function ( f21_arg0, f21_arg1 )
					local f21_local0 = function ( f30_arg0, f30_arg1 )
						if not f30_arg1.interrupted then
							f30_arg0:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Bounce )
						end
						f30_arg0:setAlpha( 1 )
						if f30_arg1.interrupted then
							self.clipFinished( f30_arg0, f30_arg1 )
						else
							f30_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f21_arg1.interrupted then
						f21_local0( f21_arg0, f21_arg1 )
						return 
					else
						f21_arg0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						f21_arg0:registerEventHandler( "transition_complete_keyframe", f21_local0 )
					end
				end
				
				WinningTeamFactionIcon:completeAnimation()
				self.WinningTeamFactionIcon:setAlpha( 0 )
				f4_local1( WinningTeamFactionIcon, {} )
				local f4_local2 = function ( f22_arg0, f22_arg1 )
					local f22_local0 = function ( f32_arg0, f32_arg1 )
						if not f32_arg1.interrupted then
							f32_arg0:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Bounce )
						end
						f32_arg0:setAlpha( 0.15 )
						if f32_arg1.interrupted then
							self.clipFinished( f32_arg0, f32_arg1 )
						else
							f32_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f22_arg1.interrupted then
						f22_local0( f22_arg0, f22_arg1 )
						return 
					else
						f22_arg0:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
						f22_arg0:registerEventHandler( "transition_complete_keyframe", f22_local0 )
					end
				end
				
				Image1:completeAnimation()
				self.Image1:setAlpha( 0 )
				f4_local2( Image1, {} )
				local f4_local3 = function ( f23_arg0, f23_arg1 )
					local f23_local0 = function ( f34_arg0, f34_arg1 )
						if not f34_arg1.interrupted then
							f34_arg0:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Bounce )
						end
						f34_arg0:setAlpha( 0.73 )
						if f34_arg1.interrupted then
							self.clipFinished( f34_arg0, f34_arg1 )
						else
							f34_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f23_arg1.interrupted then
						f23_local0( f23_arg0, f23_arg1 )
						return 
					else
						f23_arg0:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
						f23_arg0:registerEventHandler( "transition_complete_keyframe", f23_local0 )
					end
				end
				
				Pixel20100:completeAnimation()
				self.Pixel20100:setAlpha( 0 )
				f4_local3( Pixel20100, {} )
				local f4_local4 = function ( f24_arg0, f24_arg1 )
					local f24_local0 = function ( f37_arg0, f37_arg1 )
						if not f37_arg1.interrupted then
							f37_arg0:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Bounce )
						end
						f37_arg0:setAlpha( 0.73 )
						if f37_arg1.interrupted then
							self.clipFinished( f37_arg0, f37_arg1 )
						else
							f37_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f24_arg1.interrupted then
						f24_local0( f24_arg0, f24_arg1 )
						return 
					else
						f24_arg0:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Linear )
						f24_arg0:registerEventHandler( "transition_complete_keyframe", f24_local0 )
					end
				end
				
				Pixel201000:completeAnimation()
				self.Pixel201000:setAlpha( 0 )
				f4_local4( Pixel201000, {} )
				local f4_local5 = function ( f25_arg0, f25_arg1 )
					local f25_local0 = function ( f41_arg0, f41_arg1 )
						if not f41_arg1.interrupted then
							f41_arg0:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Bounce )
						end
						f41_arg0:setAlpha( 0.73 )
						if f41_arg1.interrupted then
							self.clipFinished( f41_arg0, f41_arg1 )
						else
							f41_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f25_arg1.interrupted then
						f25_local0( f25_arg0, f25_arg1 )
						return 
					else
						f25_arg0:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Linear )
						f25_arg0:registerEventHandler( "transition_complete_keyframe", f25_local0 )
					end
				end
				
				Pixel201001:completeAnimation()
				self.Pixel201001:setAlpha( 0 )
				f4_local5( Pixel201001, {} )
				local f4_local6 = function ( f26_arg0, f26_arg1 )
					local f26_local0 = function ( f44_arg0, f44_arg1 )
						if not f44_arg1.interrupted then
							f44_arg0:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Bounce )
						end
						f44_arg0:setAlpha( 0.73 )
						if f44_arg1.interrupted then
							self.clipFinished( f44_arg0, f44_arg1 )
						else
							f44_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f26_arg1.interrupted then
						f26_local0( f26_arg0, f26_arg1 )
						return 
					else
						f26_arg0:beginAnimation( "keyframe", 479, false, false, CoD.TweenType.Linear )
						f26_arg0:registerEventHandler( "transition_complete_keyframe", f26_local0 )
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

