-- d41d8cd98f00b204e9800998ecf8427e
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponNameWidget" )
require( "ui.uieditor.widgets.EndGameFlow.KillcamWidgetTitleStatus" )
require( "ui.uieditor.widgets.EndGameFlow.OutcomeFactionIcon" )

CoD.WinnerFactionInfo = InheritFrom( LUI.UIElement )
CoD.WinnerFactionInfo.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.WinnerFactionInfo )
	self.id = "WinnerFactionInfo"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 390 )
	self:setTopBottom( true, false, 0, 180 )
	self.anyChildUsesUpdateState = true
	
	local WeaponNameWidget0 = CoD.WeaponNameWidget.new( menu, controller )
	WeaponNameWidget0:setLeftRight( true, false, 172, 390 )
	WeaponNameWidget0:setTopBottom( true, false, 63.29, 97.29 )
	WeaponNameWidget0.weaponNameLabel:setText( Engine.Localize( "MPUI_AXIS_SHORT_CAPS" ) )
	self:addElement( WeaponNameWidget0 )
	self.WeaponNameWidget0 = WeaponNameWidget0
	
	local KillcamWidgetTitleStatus0 = CoD.KillcamWidgetTitleStatus.new( menu, controller )
	KillcamWidgetTitleStatus0:setLeftRight( true, false, 172, 260 )
	KillcamWidgetTitleStatus0:setTopBottom( true, false, 36.85, 61.85 )
	KillcamWidgetTitleStatus0:setRGB( 0.95, 0.74, 0 )
	KillcamWidgetTitleStatus0.SubTitle:setText( Engine.Localize( "MENU_WINNERS_CAPS" ) )
	self:addElement( KillcamWidgetTitleStatus0 )
	self.KillcamWidgetTitleStatus0 = KillcamWidgetTitleStatus0
	
	local OutcomeFactionIcon = CoD.OutcomeFactionIcon.new( menu, controller )
	OutcomeFactionIcon:setLeftRight( true, false, 36.54, 426.54 )
	OutcomeFactionIcon:setTopBottom( true, false, 0, 180 )
	self:addElement( OutcomeFactionIcon )
	self.OutcomeFactionIcon = OutcomeFactionIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				local f2_local0 = function ( f22_arg0, f22_arg1 )
					local f22_local0 = function ( f24_arg0, f24_arg1 )
						if not f24_arg1.interrupted then
							f24_arg0:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Bounce )
						end
						f24_arg0:setAlpha( 1 )
						if f24_arg1.interrupted then
							self.clipFinished( f24_arg0, f24_arg1 )
						else
							f24_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f22_arg1.interrupted then
						f22_local0( f22_arg0, f22_arg1 )
						return 
					else
						f22_arg0:beginAnimation( "keyframe", 670, false, false, CoD.TweenType.Linear )
						f22_arg0:registerEventHandler( "transition_complete_keyframe", f22_local0 )
					end
				end
				
				WeaponNameWidget0:completeAnimation()
				self.WeaponNameWidget0:setAlpha( 0 )
				f2_local0( WeaponNameWidget0, {} )
				local f2_local1 = function ( f23_arg0, f23_arg1 )
					local f23_local0 = function ( f91_arg0, f91_arg1 )
						if not f91_arg1.interrupted then
							f91_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Bounce )
						end
						f91_arg0:setAlpha( 1 )
						if f91_arg1.interrupted then
							self.clipFinished( f91_arg0, f91_arg1 )
						else
							f91_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f23_arg1.interrupted then
						f23_local0( f23_arg0, f23_arg1 )
						return 
					else
						f23_arg0:beginAnimation( "keyframe", 550, false, false, CoD.TweenType.Linear )
						f23_arg0:registerEventHandler( "transition_complete_keyframe", f23_local0 )
					end
				end
				
				KillcamWidgetTitleStatus0:completeAnimation()
				self.KillcamWidgetTitleStatus0:setAlpha( 0 )
				f2_local1( KillcamWidgetTitleStatus0, {} )
				OutcomeFactionIcon:completeAnimation()
				self.OutcomeFactionIcon:setAlpha( 1 )
				self.clipFinished( OutcomeFactionIcon, {} )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				WeaponNameWidget0:completeAnimation()
				self.WeaponNameWidget0:setAlpha( 0 )
				self.clipFinished( WeaponNameWidget0, {} )
				KillcamWidgetTitleStatus0:completeAnimation()
				self.KillcamWidgetTitleStatus0:setAlpha( 0 )
				self.clipFinished( KillcamWidgetTitleStatus0, {} )
				OutcomeFactionIcon:completeAnimation()
				self.OutcomeFactionIcon:setAlpha( 0 )
				self.clipFinished( OutcomeFactionIcon, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return HideWinnersLabelsAndInfo( controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "gameScore.draw" ), function ( modelRef )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( modelRef ),
			modelName = "gameScore.draw"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.WeaponNameWidget0:close()
		element.KillcamWidgetTitleStatus0:close()
		element.OutcomeFactionIcon:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

