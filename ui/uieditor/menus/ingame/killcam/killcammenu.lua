-- d41d8cd98f00b204e9800998ecf8427e
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.EndGameFlow.FinalKillcamWidget" )

local PreLoadFunc = function ( self, controller )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "hudItems.killcamAllowRespawn" ), 0 )
end

LUI.createMenu.KillcamMenu = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "KillcamMenu" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "KillcamMenu.buttonPrompts" )
	local f2_local1 = self
	self.anyChildUsesUpdateState = true
	
	local FinalKillcamWidget = CoD.FinalKillcamWidget.new( f2_local1, controller )
	FinalKillcamWidget:setLeftRight( true, true, 0, 0 )
	FinalKillcamWidget:setTopBottom( true, true, 0, 0 )
	FinalKillcamWidget:setAlpha( 0 )
	self:addElement( FinalKillcamWidget )
	self.FinalKillcamWidget = FinalKillcamWidget
	
	local Foreground = LUI.UIImage.new()
	Foreground:setLeftRight( true, true, 0, 0 )
	Foreground:setTopBottom( true, true, 0, 0 )
	Foreground:setRGB( 0, 0, 0 )
	self:addElement( Foreground )
	self.Foreground = Foreground
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				FinalKillcamWidget:completeAnimation()
				self.FinalKillcamWidget:setAlpha( 1 )
				self.clipFinished( FinalKillcamWidget, {} )
				Foreground:completeAnimation()
				self.Foreground:setAlpha( 0 )
				self.clipFinished( Foreground, {} )
			end,
			EndTransition = function ()
				self:setupElementClipCounter( 4 )
				local f8_local0 = function ( f2_arg0, f2_arg1 )
					if not f2_arg1.interrupted then
						f2_arg0:beginAnimation( "keyframe", 899, false, false, CoD.TweenType.Linear )
					end
					f2_arg0:setAlpha( 0 )
					if f2_arg1.interrupted then
						self.clipFinished( f2_arg0, f2_arg1 )
					else
						f2_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FinalKillcamWidget:completeAnimation()
				self.FinalKillcamWidget:setAlpha( 1 )
				f8_local0( FinalKillcamWidget, {} )
				local f8_local1 = function ( f3_arg0, f3_arg1 )
					if not f3_arg1.interrupted then
						f3_arg0:beginAnimation( "keyframe", 899, false, false, CoD.TweenType.Linear )
					end
					f3_arg0:setAlpha( 0 )
					if f3_arg1.interrupted then
						self.clipFinished( f3_arg0, f3_arg1 )
					else
						f3_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				local f8_local2 = function ( f4_arg0, f4_arg1 )
					local f4_local0 = function ( f5_arg0, f5_arg1 )
						if not f5_arg1.interrupted then
							f5_arg0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						end
						f5_arg0:setAlpha( 1 )
						if f5_arg1.interrupted then
							self.clipFinished( f5_arg0, f5_arg1 )
						else
							f5_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f4_arg1.interrupted then
						f4_local0( f4_arg0, f4_arg1 )
						return 
					else
						f4_arg0:beginAnimation( "keyframe", 899, false, false, CoD.TweenType.Linear )
						f4_arg0:setAlpha( 1 )
						f4_arg0:registerEventHandler( "transition_complete_keyframe", f4_local0 )
					end
				end
				
				Foreground:completeAnimation()
				self.Foreground:setAlpha( 0 )
				f8_local2( Foreground, {} )
				local f8_local3 = function ( f5_arg0, f5_arg1 )
					if not f5_arg1.interrupted then
						f5_arg0:beginAnimation( "keyframe", 899, false, false, CoD.TweenType.Linear )
					end
					f5_arg0:setAlpha( 0 )
					if f5_arg1.interrupted then
						self.clipFinished( f5_arg0, f5_arg1 )
					else
						f5_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
			end
		}
	}
	self:subscribeToGlobalModel( controller, "PerController", "scriptNotify", function ( modelRef )
		local f9_local0 = self
		if IsParamModelEqualToString( modelRef, "post_killcam_transition" ) then
			PlayClip( self, "EndTransition", controller )
		end
	end )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f2_local1
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FinalKillcamWidget:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "KillcamMenu.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

