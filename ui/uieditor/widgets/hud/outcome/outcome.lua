-- d41d8cd98f00b204e9800998ecf8427e
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.EndGameFlow.KillcamWidgetPnlRT" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_VignetteBack" )
require( "ui.uieditor.widgets.EndGameFlow.KillcamWidgetNumbers" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponNameWidget" )
require( "ui.uieditor.widgets.EndGameFlow.OutcomeFactionIcon" )
require( "ui.uieditor.widgets.EndGameFlow.KillcamWidgetTeamNameR" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ListHeaderGlow" )
require( "ui.uieditor.widgets.HUD.Outcome.WinnerFactionInfo" )
require( "ui.uieditor.widgets.EndGameFlow.KillcamWidgetTitle" )
require( "ui.uieditor.widgets.HUD.Outcome.MatchBonusWidget" )
require( "ui.LUI.LUITightText" )

local f0_local0 = function ( f1_arg0, f1_arg1 )
	if Engine.IsVisibilityBitSet( f1_arg1.controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) or Engine.IsVisibilityBitSet( f1_arg1.controller, Enum.UIVisibilityBit.BIT_FINAL_KILLCAM ) then
		f1_arg0:setAlpha( 0 )
	end
end

local f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2, f2_arg3, f2_arg4, f2_arg5, f2_arg6 )
	local f2_local0 = {}
	local f2_local1 = {}
	local f2_local2, f2_local3 = nil
	local f2_local4 = Engine.GetTeamID( f2_arg1, Engine.GetClientNum( f2_arg1 ) )
	if IsCodCaster( f2_arg1 ) then
		f2_local4 = Engine.GetTeamID( f2_arg1, Engine.GetPredictedClientNum( f2_arg1 ) )
	end
	local f2_local5 = Engine.GetModel( Engine.GetModelForController( f2_arg1 ), "gameScore" )
	local f2_local6 = f2_arg2 == Enum.team_t.TEAM_BAD
	local f2_local7 = Engine.GetModel( Engine.GetGlobalModel(), "factions" )
	Engine.SetModelValue( Engine.CreateModel( f2_local5, "draw" ), f2_local6 )
	local f2_local8 = Engine.GetModel( f2_local5, "alliesScore" )
	f2_local0.score = Engine.GetModelValue( f2_local8 )
	local f2_local9 = Engine.CreateModel( f2_local7, "winningTeamScore" )
	local f2_local10 = Engine.CreateModel( f2_local7, "losingTeamScore" )
	f2_local0.displayName = CoD.GetTeamNameCaps( Enum.team_t.TEAM_ALLIES )
	f2_local0.factionIcon = CoD.GetTeamFactionIcon( Enum.team_t.TEAM_ALLIES )
	local f2_local11 = Engine.GetModel( f2_local5, "axisScore" )
	f2_local1.score = Engine.GetModelValue( f2_local11 )
	f2_local1.displayName = CoD.GetTeamNameCaps( Enum.team_t.TEAM_AXIS )
	f2_local1.factionIcon = CoD.GetTeamFactionIcon( Enum.team_t.TEAM_AXIS )
	if not f2_local6 and not f2_arg3 then
		if f2_arg4 then
			Engine.SetModelValue( Engine.CreateModel( f2_local5, "victory" ), true )
		elseif f2_arg5 then
			Engine.SetModelValue( Engine.CreateModel( f2_local5, "defeat" ), true )
		elseif f2_arg2 == f2_local4 then
			Engine.SetModelValue( Engine.CreateModel( f2_local5, "victory" ), true )
		else
			Engine.SetModelValue( Engine.CreateModel( f2_local5, "defeat" ), true )
		end
	end
	if f2_arg2 ~= f2_local4 or not "playerScoreOrTime" then
		local f2_local12 = "enemyScoreOrTime"
	end
	if f2_arg2 == f2_local4 or not "playerScoreOrTime" then
		local f2_local13 = "enemyScoreOrTime"
	end
	local f2_local14 = #f2_arg6.data >= 7
	local f2_local15 = #f2_arg6.data == 6
	Engine.CreateModel( f2_local5, "enemyScoreOrTime" )
	Engine.CreateModel( f2_local5, "playerScoreOrTime" )
	local f2_local16, f2_local17 = nil
	local f2_local12
	local f2_local13
	if f2_arg2 == Enum.team_t.TEAM_ALLIES or f2_local6 then
		f2_local2 = f2_local0
		f2_local3 = f2_local1
		f2_local16 = f2_local8
		f2_local17 = f2_local11
		if IsCodCaster( f2_arg1 ) then
			f2_local12 = "playerScoreOrTime"
			f2_local13 = "enemyScoreOrTime"
		end
	else
		f2_local2 = f2_local1
		f2_local3 = f2_local0
		f2_local16 = f2_local11
		f2_local17 = f2_local8
		if IsCodCaster( f2_arg1 ) then
			f2_local12 = "enemyScoreOrTime"
			f2_local13 = "playerScoreOrTime"
		end
	end
	if f2_arg0.hasWinningAndLosingSubscriptions then
		f2_arg0:removeSubscription( f2_arg0.winningScoreSubscription )
		f2_arg0:removeSubscription( f2_arg0.losingScoreSubscription )
		f2_arg0.hasWinningAndLosingSubscriptions = false
	end
	if not f2_local14 and not f2_local15 then
		f2_arg0.hasWinningAndLosingSubscriptions = true
		f2_arg0.winningScoreSubscription = f2_arg0:subscribeToModel( f2_local16, function ( modelRef )
			local modelValue = Engine.GetModelValue( modelRef )
			Engine.SetModelValue( f2_local9, modelValue )
			Engine.SetModelValue( Engine.GetModel( f2_local5, f2_local12 ), "" .. modelValue )
		end )
		f2_arg0.losingScoreSubscription = f2_arg0:subscribeToModel( f2_local17, function ( modelRef )
			local modelValue = Engine.GetModelValue( modelRef )
			Engine.SetModelValue( f2_local10, Engine.GetModelValue( modelRef ) )
			Engine.SetModelValue( Engine.GetModel( f2_local5, f2_local13 ), "" .. modelValue )
		end )
	end
	local f2_local18 = function ( f10_arg0 )
		if f10_arg0 == nil or f10_arg0 == 0 then
			return "-:--"
		else
			local f10_local0 = math.floor( f10_arg0 / 60 )
			return f10_local0 .. ":" .. string.format( "%02d", f10_arg0 - 60 * f10_local0 )
		end
	end
	
	Engine.SetModelValue( Engine.GetModel( f2_local5, "showTimeResults" ), f2_local14 )
	Engine.SetModelValue( Engine.GetModel( f2_local5, "playerScoreIsTimeToBeat" ), false )
	Engine.SetModelValue( Engine.GetModel( f2_local5, "enemyScoreIsTimeToBeat" ), false )
	if f2_local14 then
		if IsCodCaster( f2_arg1 ) then
			local f2_local19 = Engine.SetModelValue
			local f2_local20 = Engine.GetModel( f2_local5, "playerScoreIsTimeToBeat" )
			local f2_local21
			if not f2_local6 then
				local f2_local22 = f2_arg3
				if f2_arg2 ~= Enum.team_t.TEAM_ALLIES then
					f2_local21 = false
				end
				f2_local21 = f2_local22 and true
			end
			f2_local21 = false
		else
			local f2_local19 = Engine.SetModelValue
			local f2_local20 = Engine.GetModel( f2_local5, "playerScoreIsTimeToBeat" )
			local f2_local21
			if not f2_local6 then
				local f2_local24 = f2_arg3
				if f2_arg2 ~= f2_local4 then
					f2_local21 = false
				end
				f2_local21 = f2_local24 and true
			end
			f2_local21 = false
		end
		Engine.SetModelValue( Engine.GetModel( f2_local5, f2_local12 ), f2_local18( f2_arg6.data[6] ) )
		Engine.SetModelValue( Engine.GetModel( f2_local5, f2_local13 ), f2_local18( f2_arg6.data[7] ) )
	end
	if f2_local15 then
		local f2_local19 = f2_arg6.data[6]
		local f2_local20 = 0
		local f2_local21 = 0
		if f2_local19 >= 65536 then
			DebugPrint( "WARNING: score override sent from show_outcome event has a score > 255" )
		else
			f2_local20 = f2_local19
			f2_local21 = f2_local19
		end
		Engine.SetModelValue( Engine.GetModel( f2_local5, f2_local12 ), f2_local21 )
		Engine.SetModelValue( Engine.GetModel( f2_local5, f2_local13 ), f2_local20 )
	end
	Engine.SetModelValue( f2_local9, f2_local2.score )
	Engine.SetModelValue( f2_local10, f2_local3.score )
	Engine.SetModelValue( Engine.CreateModel( f2_local7, "winnersFactionDisplayName" ), f2_local2.displayName )
	Engine.SetModelValue( Engine.CreateModel( f2_local7, "winnersFactionIcon" ), f2_local2.factionIcon )
	Engine.SetModelValue( Engine.CreateModel( f2_local7, "losersFactionDisplayName" ), f2_local3.displayName )
	Engine.SetModelValue( Engine.CreateModel( f2_local7, "losersFactionIcon" ), f2_local3.factionIcon )
end

local f0_local2 = function ( f3_arg0, f3_arg1, f3_arg2 )
	local f3_local0 = f3_arg1.controller
	Engine.UpdateTopPlayerUIModels( f3_local0 )
	f3_arg0:setAlpha( 1 )
	local f3_local1 = f3_arg1.data[1]
	local f3_local2 = f3_arg1.data[2]
	local f3_local3 = f3_arg1.data[3]
	local f3_local4 = f3_arg1.data[4]
	local f3_local5
	if f3_arg1.data[5] ~= 1 and f3_arg1.data[5] ~= true then
		f3_local5 = false
	else
		f3_local5 = true
	end
	local f3_local6 = Engine.GetModel( Engine.GetModelForController( f3_local0 ), "gameScore" )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f3_local0 ), "aarStats.performanceTabStats.outcome", true ), Engine.Localize( Engine.GetIString( f3_local1, "CS_LOCALIZED_STRINGS" ) ) )
	Engine.SetModelValue( Engine.CreateModel( f3_local6, "isRoundEnd" ), f3_local5 )
	Engine.SetModelValue( Engine.CreateModel( f3_local6, "matchBonus" ), f3_local3 )
	f3_arg0.TitleNew:setAlpha( 0 )
	local f3_local7 = Engine.GetIString( f3_local1, "CS_LOCALIZED_STRINGS" )
	if CoD.IsShoutcaster( f3_local0 ) then
		f3_local7 = Engine.Localize( f3_local7, CoD.GetTeamName( f3_local4 ) )
	end
	local f3_local8, f3_local9 = nil
	if Dvar.ui_gametype:get() == "infect" then
		f3_local8 = f3_local7 == "MP_VICTORY_CAPS"
		f3_local9 = f3_local7 == "MP_DEFEAT_CAPS"
	end
	f3_arg0.TitleNew.isOvertime = f3_local7 == "MP_OVERTIME_CAPS"
	f3_arg0.TitleNew.KillcamText0:setText( Engine.Localize( f3_local7 ) )
	local f3_local10 = Engine.GetIString( f3_local2, "CS_LOCALIZED_STRINGS" )
	if CoD.IsShoutcaster( f3_local0 ) and f3_local10 == "MP_TEAM_ELIMINATED" then
		local f3_local11 = Enum.team_t.TEAM_AXIS
		if f3_local4 == Enum.team_t.TEAM_AXIS then
			f3_local11 = Enum.team_t.TEAM_ALLIES
		end
		f3_local10 = Engine.Localize( f3_local10, CoD.GetTeamName( f3_local11 ) )
	end
	f3_arg0:playClip( "Show_Two_Team" )
end

local PostLoadFunc = function ( self, controller, menu )
	local f4_local0 = function ( f28_arg0 )
		f0_local0( self, {
			controller = controller
		} )
	end
	
	local f4_local1 = Engine.GetModelForController( controller )
	self:subscribeToModel( Engine.GetModel( f4_local1, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), f4_local0 )
	self:subscribeToModel( Engine.GetModel( f4_local1, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_FINAL_KILLCAM ), f4_local0 )
	self:subscribeToGlobalModel( controller, "PerController", "scriptNotify", function ( modelRef )
		local modelValue = Engine.GetModelValue( modelRef )
		if modelValue == "show_outcome" then
			f0_local2( self, {
				controller = controller,
				name = modelValue,
				data = CoD.GetScriptNotifyData( modelRef )
			}, menu )
		elseif modelValue == "pre_killcam_transition" then
			local f29_local1 = Engine.GetGametypeSetting( "teamCount" ) < 2
			local f29_local2 = self
			local f29_local3 = f29_local2
			f29_local2 = f29_local2.playClip
			local f29_local4 = "End_Transition"
			local f29_local5
			if f29_local1 then
				f29_local5 = "_FFA"
				if not f29_local5 then
				
				else
					f29_local2( f29_local3, f29_local4 .. f29_local5 )
				end
			end
			f29_local5 = ""
		end
	end )
	self:subscribeToModel( Engine.CreateModel( Engine.GetModelForController( controller ), "hudItems.hideOutcomeUI" ), function ( modelRef )
		if Engine.GetModelValue( modelRef ) == 1 then
			self:setAlpha( 0 )
		end
	end )
	self:setState( "DefaultState" )
end

local f0_local4 = function ( f5_arg0 )
	local f5_local0 = Engine.CreateModel( Engine.GetModelForController( f5_arg0 ), "gameScore" )
	Engine.SetModelValue( Engine.CreateModel( f5_local0, "draw" ), false )
	Engine.SetModelValue( Engine.CreateModel( f5_local0, "isRoundEnd" ), false )
	Engine.SetModelValue( Engine.CreateModel( f5_local0, "matchBonus" ), 0 )
	Engine.SetModelValue( Engine.CreateModel( f5_local0, "alliesScore" ), 0 )
	Engine.SetModelValue( Engine.CreateModel( f5_local0, "axisScore" ), 0 )
	Engine.SetModelValue( Engine.CreateModel( f5_local0, "victory" ), false )
	Engine.SetModelValue( Engine.CreateModel( f5_local0, "defeat" ), false )
	Engine.SetModelValue( Engine.CreateModel( f5_local0, "enemyScoreOrTime" ), "" )
	Engine.SetModelValue( Engine.CreateModel( f5_local0, "playerScoreOrTime" ), "" )
	local f5_local1 = Engine.CreateModel( Engine.GetGlobalModel(), "factions" )
	Engine.SetModelValue( Engine.CreateModel( f5_local1, "winningTeamScore" ), 0 )
	Engine.SetModelValue( Engine.CreateModel( f5_local1, "losingTeamScore" ), 0 )
	Engine.SetModelValue( Engine.CreateModel( f5_local1, "winnersFactionDisplayName" ), "" )
	Engine.SetModelValue( Engine.CreateModel( f5_local1, "winnersFactionIcon" ), "" )
	Engine.SetModelValue( Engine.CreateModel( f5_local1, "losersFactionDisplayName" ), "" )
	Engine.SetModelValue( Engine.CreateModel( f5_local1, "losersFactionIcon" ), "" )
end

local PreLoadFunc = function ( self, controller )
	Engine.UpdateTopPlayerUIModels( controller )
	local f6_local0 = Engine.CreateModel( Engine.GetModelForController( controller ), "gameScore" )
	Engine.SetModelValue( Engine.CreateModel( f6_local0, "showTimeResults" ), false )
	Engine.SetModelValue( Engine.CreateModel( f6_local0, "playerScoreIsTimeToBeat" ), false )
	Engine.SetModelValue( Engine.CreateModel( f6_local0, "enemyScoreIsTimeToBeat" ), false )
	self:subscribeToModel( Engine.CreateModel( Engine.GetModelForController( controller ), "displayTop3Players" ), function ( modelRef )
		if Engine.GetModelValue( modelRef ) == 1 then
			self:close()
		end
	end )
	f0_local4( controller )
end

CoD.Outcome = InheritFrom( LUI.UIElement )
CoD.Outcome.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Outcome )
	self.id = "Outcome"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local LeftPanelR = CoD.KillcamWidgetPnlRT.new( menu, controller )
	LeftPanelR:setLeftRight( false, false, 0, 675 )
	LeftPanelR:setTopBottom( false, false, -37, 43 )
	LeftPanelR:setRGB( 0.5, 0.5, 0.5 )
	LeftPanelR:setAlpha( 1 )
	LeftPanelR:setYRot( 180 )
	LeftPanelR.KillcamWidgetPnlRTInt0:setShaderVector( 0, 0, 3, 0, 0 )
	LeftPanelR.FactionColorBar:setRGB( CoD.GetTeamFactionColor( Enum.team_t.TEAM_AXIS ) )
	self:addElement( LeftPanelR )
	self.LeftPanelR = LeftPanelR
	
	local LeftPanelL = CoD.KillcamWidgetPnlRT.new( menu, controller )
	LeftPanelL:setLeftRight( false, false, -675, 0 )
	LeftPanelL:setTopBottom( false, false, -37, 43 )
	LeftPanelL:setRGB( 0.5, 0.5, 0.5 )
	LeftPanelL:setAlpha( 1 )
	LeftPanelL.KillcamWidgetPnlRTInt0:setShaderVector( 0, 0, 3, 0, 0 )
	LeftPanelL.FactionColorBar:setRGB( CoD.GetTeamFactionColor( Enum.team_t.TEAM_ALLIES ) )
	self:addElement( LeftPanelL )
	self.LeftPanelL = LeftPanelL
	
	local VignetteBack = CoD.VehicleGround_VignetteBack.new( menu, controller )
	VignetteBack:setLeftRight( true, true, 0, 0 )
	VignetteBack:setTopBottom( true, true, 0, 0 )
	VignetteBack:setRGB( 0, 0, 0 )
	self:addElement( VignetteBack )
	self.VignetteBack = VignetteBack
	
    local WinningTeamScoreNew = CoD.KillcamWidgetNumbers.new( menu, controller )
    WinningTeamScoreNew:setLeftRight( false, false, -153.78, -33.78 )
    WinningTeamScoreNew:setTopBottom( false, false, -21, 33 )
    WinningTeamScoreNew:setAlpha( 1 )
    WinningTeamScoreNew:setScale( 1.2 )
    WinningTeamScoreNew:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
    WinningTeamScoreNew:setShaderVector( 0, 0.1, 0, 0, 0 )
    WinningTeamScoreNew:setShaderVector( 1, 0, 0, 0, 0 )
    WinningTeamScoreNew:setShaderVector( 2, 0, 0, 0, 0 )
    WinningTeamScoreNew:setShaderVector( 3, 0, 0, 0, 0 )
    WinningTeamScoreNew:setShaderVector( 4, 0.24, 0.02, 0, 0 )
    WinningTeamScoreNew.Numbers:setRGB( 1, 1, 1 )
    WinningTeamScoreNew:subscribeToModel(Engine.GetModel(Engine.GetModelForController(controller), "killcam.rounds"), function(modelRef) 
        local round = Engine.GetModelValue(modelRef)
        if round then
            WinningTeamScoreNew.Numbers:setText( round )
        end
    end)
    self:addElement( WinningTeamScoreNew )
    self.WinningTeamScoreNew = WinningTeamScoreNew
	
	local LosingTeamScoreNew = CoD.KillcamWidgetNumbers.new( menu, controller )
	LosingTeamScoreNew:setLeftRight( false, false, 34.22, 154.22 )
	LosingTeamScoreNew:setTopBottom( false, false, -21, 33 )
	LosingTeamScoreNew:setAlpha( 1 )
	LosingTeamScoreNew:setScale( 1.2 )
	LosingTeamScoreNew:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	LosingTeamScoreNew:setShaderVector( 0, 0.1, 0, 0, 0 )
	LosingTeamScoreNew:setShaderVector( 1, 0, 0, 0, 0 )
	LosingTeamScoreNew:setShaderVector( 2, 0, 0, 0, 0 )
	LosingTeamScoreNew:setShaderVector( 3, 0, 0, 0, 0 )
	LosingTeamScoreNew:setShaderVector( 4, 0.24, 0.02, 0, 0 )
	LosingTeamScoreNew.Numbers:setRGB( 1, 1, 1 )
	LosingTeamScoreNew.Numbers:setText( Engine.Localize( "0" ) )
	self:addElement( LosingTeamScoreNew )
	self.LosingTeamScoreNew = LosingTeamScoreNew
	
	local WinningTeamFactionNameNew = CoD.WeaponNameWidget.new( menu, controller )
	WinningTeamFactionNameNew:setLeftRight( false, false, -352, -134 )
	WinningTeamFactionNameNew:setTopBottom( false, false, -15, 19 )
	WinningTeamFactionNameNew:setAlpha( 1 )
	WinningTeamFactionNameNew.weaponNameLabel:setText( Engine.Localize( "SURVIVORS" ) )
	self:addElement( WinningTeamFactionNameNew )
	self.WinningTeamFactionNameNew = WinningTeamFactionNameNew
	
	local WinningTeamFactionIconNew = CoD.OutcomeFactionIcon.new( menu, controller )
	WinningTeamFactionIconNew:setLeftRight( false, false, -506, -116 )
	WinningTeamFactionIconNew:setTopBottom( false, false, -76, 104 )
	WinningTeamFactionIconNew:setAlpha( 1 )
	WinningTeamFactionIconNew.OutcomeFactionIconItem.WinningTeamFactionIcon:setImage( RegisterImage( "faction_allies" ) )
	WinningTeamFactionIconNew.OutcomeFactionIconItem.WinningTeamFactionIcon0:setImage( RegisterImage( "faction_allies" ) )
	self:addElement( WinningTeamFactionIconNew )
	self.WinningTeamFactionIconNew = WinningTeamFactionIconNew
	
	local LosingTeamFactionNameNew = CoD.KillcamWidgetTeamNameR.new( menu, controller )
	LosingTeamFactionNameNew:setLeftRight( false, false, 135.5, 353.5 )
	LosingTeamFactionNameNew:setTopBottom( false, false, -15, 19 )
	LosingTeamFactionNameNew:setAlpha( 1 )
	LosingTeamFactionNameNew.weaponNameLabel:setText( "ZOMBIES" )
	self:addElement( LosingTeamFactionNameNew )
	self.LosingTeamFactionNameNew = LosingTeamFactionNameNew
	
	local LosingTeamFactionIconNew = CoD.OutcomeFactionIcon.new( menu, controller )
	LosingTeamFactionIconNew:setLeftRight( false, false, 117.5, 507.5 )
	LosingTeamFactionIconNew:setTopBottom( false, false, -76, 104 )
	LosingTeamFactionIconNew:setAlpha( 1 )
	LosingTeamFactionIconNew:setYRot( 180 )
	LosingTeamFactionIconNew.OutcomeFactionIconItem.WinningTeamFactionIcon:setImage( RegisterImage( "faction_axis" ) )
	LosingTeamFactionIconNew.OutcomeFactionIconItem.WinningTeamFactionIcon0:setImage( RegisterImage( "faction_axis" ) )
	self:addElement( LosingTeamFactionIconNew )
	self.LosingTeamFactionIconNew = LosingTeamFactionIconNew
	
	local VSBanner = CoD.FE_ListHeaderGlow.new( menu, controller )
	VSBanner:setLeftRight( false, false, -20.5, 20.5 )
	VSBanner:setTopBottom( false, false, -10, 18 )
	VSBanner:setAlpha( 1 )
	self:addElement( VSBanner )
	self.VSBanner = VSBanner
	
	local VSLabel = LUI.UITightText.new()
	VSLabel:setLeftRight( false, false, -13, 17 )
	VSLabel:setTopBottom( false, false, -9, 16 )
	VSLabel:setRGB( 0, 0, 0 )
	VSLabel:setAlpha( 1 )
	VSLabel:setText( Engine.Localize( "MP_VERSUS" ) )
	VSLabel:setTTF( "fonts/escom.ttf" )
	VSLabel:setLetterSpacing( 2 )
	self:addElement( VSLabel )
	self.VSLabel = VSLabel
	
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
	--[[
	local WinnerFactionInfo = CoD.WinnerFactionInfo.new( menu, controller )
	WinnerFactionInfo:setLeftRight( true, false, 24, 414 )
	WinnerFactionInfo:setTopBottom( true, false, 2.5, 182.5 )
	WinnerFactionInfo:setAlpha( 1 )
	WinnerFactionInfo.WeaponNameWidget0.weaponNameLabel:setText( Engine.Localize( "SURVIVORS" ) )
	WinnerFactionInfo.OutcomeFactionIcon:setImage( RegisterImage( "faction_axis" ) )
	self:addElement( WinnerFactionInfo )
	self.WinnerFactionInfo = WinnerFactionInfo]]
	
	local TitleNew = CoD.KillcamWidgetTitle.new( menu, controller )
	TitleNew:setLeftRight( false, false, -250, 250 )
	TitleNew:setTopBottom( true, false, 37.5, 92.5 )
	TitleNew:setAlpha( 1 )
	TitleNew.KillcamText0:setText( Engine.Localize( "ROUND SURVIVED" ) )
	self:addElement( TitleNew )
	self.TitleNew = TitleNew
	
	local MatchBonusWidget0 = CoD.MatchBonusWidget.new( menu, controller )
	MatchBonusWidget0:setLeftRight( false, false, -142, 142 )
	MatchBonusWidget0:setTopBottom( false, true, -164.5, -36 )
	self:addElement( MatchBonusWidget0 )
	self.MatchBonusWidget0 = MatchBonusWidget0

	local SubTitleNew = CoD.PrematchCountdown_BeginsIn.new( menu, controller )
	SubTitleNew:setLeftRight( false, false, -142, 142 )
	SubTitleNew:setTopBottom( true, false, 99.29, 131.5 )
	SubTitleNew:setAlpha( 0 )
	SubTitleNew.FEButtonPanel0:setAlpha( 0.3 )
	SubTitleNew.MatchText:setText( Engine.Localize( "Zombies Eliminated" ) )
	SubTitleNew.MatchText:setTTF( "fonts/escom.ttf" )
	self:addElement( SubTitleNew )
	self.SubTitleNew = SubTitleNew
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 18 )
				LeftPanelR:completeAnimation()
				self.LeftPanelR:setAlpha( 0 )
				self.clipFinished( LeftPanelR, {} )
				LeftPanelL:completeAnimation()
				self.LeftPanelL:setAlpha( 0 )
				self.clipFinished( LeftPanelL, {} )
				VignetteBack:completeAnimation()
				self.VignetteBack:setRGB( 0, 0, 0 )
				self.clipFinished( VignetteBack, {} )
				WinningTeamScoreNew:completeAnimation()
				self.WinningTeamScoreNew:setAlpha( 0 )
				self.clipFinished( WinningTeamScoreNew, {} )
				LosingTeamScoreNew:completeAnimation()
				self.LosingTeamScoreNew:setAlpha( 0 )
				self.clipFinished( LosingTeamScoreNew, {} )
				WinningTeamFactionNameNew:completeAnimation()
				self.WinningTeamFactionNameNew:setAlpha( 0 )
				self.clipFinished( WinningTeamFactionNameNew, {} )
				WinningTeamFactionIconNew:completeAnimation()
				self.WinningTeamFactionIconNew:setAlpha( 0 )
				self.clipFinished( WinningTeamFactionIconNew, {} )
				SubTitleNew:completeAnimation()
				self.SubTitleNew:setAlpha( 0 )
				self.clipFinished( SubTitleNew, {} )
				LosingTeamFactionNameNew:completeAnimation()
				self.LosingTeamFactionNameNew:setAlpha( 0 )
				self.clipFinished( LosingTeamFactionNameNew, {} )
				LosingTeamFactionIconNew:completeAnimation()
				self.LosingTeamFactionIconNew:setAlpha( 0 )
				self.clipFinished( LosingTeamFactionIconNew, {} )
				VSBanner:completeAnimation()
				self.VSBanner:setAlpha( 0 )
				self.clipFinished( VSBanner, {} )
				VSLabel:completeAnimation()
				self.VSLabel:setLeftRight( false, false, -15, 15 )
				self.VSLabel:setTopBottom( false, false, -6, 19 )
				self.VSLabel:setAlpha( 0 )
				self.clipFinished( VSLabel, {} )
				--[[WinnerFactionInfo:completeAnimation()
				self.WinnerFactionInfo:setAlpha( 0 )
				self.clipFinished( WinnerFactionInfo, {} )]]
				TitleNew:completeAnimation()
				self.TitleNew:setAlpha( 0 )
				self.clipFinished( TitleNew, {} )
				MatchBonusWidget0:completeAnimation()
				self.MatchBonusWidget0:setAlpha( 0 )
				self.clipFinished( MatchBonusWidget0, {} )
			end,
			Show_Two_Team = function ()
				self:setupElementClipCounter( 19 )
				local f99_local0 = function ( f137_arg0, f137_arg1 )
					if not f137_arg1.interrupted then
						f137_arg0:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Linear )
					end
					f137_arg0:setLeftRight( false, false, 0, 675 )
					f137_arg0:setTopBottom( false, false, -37, 43 )
					f137_arg0:setAlpha( 1 )
					if f137_arg1.interrupted then
						self.clipFinished( f137_arg0, f137_arg1 )
					else
						f137_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftPanelR:completeAnimation()
				self.LeftPanelR:setLeftRight( false, false, 170, 845 )
				self.LeftPanelR:setTopBottom( false, false, -37, 43 )
				self.LeftPanelR:setAlpha( 0 )
				f99_local0( LeftPanelR, {} )
				local f99_local1 = function ( f138_arg0, f138_arg1 )
					if not f138_arg1.interrupted then
						f138_arg0:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Linear )
					end
					f138_arg0:setLeftRight( false, false, -675, 0 )
					f138_arg0:setTopBottom( false, false, -37, 43 )
					f138_arg0:setAlpha( 1 )
					if f138_arg1.interrupted then
						self.clipFinished( f138_arg0, f138_arg1 )
					else
						f138_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftPanelL:completeAnimation()
				self.LeftPanelL:setLeftRight( false, false, -885, -210 )
				self.LeftPanelL:setTopBottom( false, false, -37, 43 )
				self.LeftPanelL:setAlpha( 0 )
				f99_local1( LeftPanelL, {} )
				local f99_local2 = function ( f139_arg0, f139_arg1 )
					if not f139_arg1.interrupted then
						f139_arg0:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Linear )
					end
					f139_arg0:setRGB( 1, 1, 1 )
					if f139_arg1.interrupted then
						self.clipFinished( f139_arg0, f139_arg1 )
					else
						f139_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				VignetteBack:completeAnimation()
				self.VignetteBack:setRGB( 0, 0, 0 )
				f99_local2( VignetteBack, {} )
				local f99_local3 = function ( f140_arg0, f140_arg1 )
					local f140_local0 = function ( f3_arg0, f3_arg1 )
						if not f3_arg1.interrupted then
							f3_arg0:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Bounce )
						end
						f3_arg0:setAlpha( 1 )
						f3_arg0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
						f3_arg0:setShaderVector( 0, 0.1, 0, 0, 0 )
						f3_arg0:setShaderVector( 1, 0, 0, 0, 0 )
						f3_arg0:setShaderVector( 2, 0, 0, 0, 0 )
						f3_arg0:setShaderVector( 3, 0, 0, 0, 0 )
						f3_arg0:setShaderVector( 4, 0, 0, 0, 0 )
						if f3_arg1.interrupted then
							self.clipFinished( f3_arg0, f3_arg1 )
						else
							f3_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f140_arg1.interrupted then
						f140_local0( f140_arg0, f140_arg1 )
						return 
					else
						f140_arg0:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
						f140_arg0:registerEventHandler( "transition_complete_keyframe", f140_local0 )
					end
				end
				
				WinningTeamScoreNew:completeAnimation()
				self.WinningTeamScoreNew:setAlpha( 0 )
				self.WinningTeamScoreNew:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
				self.WinningTeamScoreNew:setShaderVector( 0, 0.1, 0, 0, 0 )
				self.WinningTeamScoreNew:setShaderVector( 1, 0, 0, 0, 0 )
				self.WinningTeamScoreNew:setShaderVector( 2, 0, 0, 0, 0 )
				self.WinningTeamScoreNew:setShaderVector( 3, 0, 0, 0, 0 )
				self.WinningTeamScoreNew:setShaderVector( 4, 0, 0, 0, 0 )
				f99_local3( WinningTeamScoreNew, {} )
				local f99_local4 = function ( f141_arg0, f141_arg1 )
					local f141_local0 = function ( f62_arg0, f62_arg1 )
						if not f62_arg1.interrupted then
							f62_arg0:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Bounce )
						end
						f62_arg0:setAlpha( 1 )
						f62_arg0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
						f62_arg0:setShaderVector( 0, 0.1, 0, 0, 0 )
						f62_arg0:setShaderVector( 1, 0, 0, 0, 0 )
						f62_arg0:setShaderVector( 2, 0, 0, 0, 0 )
						f62_arg0:setShaderVector( 3, 0, 0, 0, 0 )
						f62_arg0:setShaderVector( 4, 0, 0, 0, 0 )
						if f62_arg1.interrupted then
							self.clipFinished( f62_arg0, f62_arg1 )
						else
							f62_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f141_arg1.interrupted then
						f141_local0( f141_arg0, f141_arg1 )
						return 
					else
						f141_arg0:beginAnimation( "keyframe", 649, false, false, CoD.TweenType.Linear )
						f141_arg0:registerEventHandler( "transition_complete_keyframe", f141_local0 )
					end
				end
				
				LosingTeamScoreNew:completeAnimation()
				self.LosingTeamScoreNew:setAlpha( 0 )
				self.LosingTeamScoreNew:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
				self.LosingTeamScoreNew:setShaderVector( 0, 0.1, 0, 0, 0 )
				self.LosingTeamScoreNew:setShaderVector( 1, 0, 0, 0, 0 )
				self.LosingTeamScoreNew:setShaderVector( 2, 0, 0, 0, 0 )
				self.LosingTeamScoreNew:setShaderVector( 3, 0, 0, 0, 0 )
				self.LosingTeamScoreNew:setShaderVector( 4, 0, 0, 0, 0 )
				f99_local4( LosingTeamScoreNew, {} )
				local f99_local5 = function ( f142_arg0, f142_arg1 )
					local f142_local0 = function ( f65_arg0, f65_arg1 )
						if not f65_arg1.interrupted then
							f65_arg0:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Bounce )
						end
						f65_arg0:setAlpha( 1 )
						if f65_arg1.interrupted then
							self.clipFinished( f65_arg0, f65_arg1 )
						else
							f65_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f142_arg1.interrupted then
						f142_local0( f142_arg0, f142_arg1 )
						return 
					else
						f142_arg0:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
						f142_arg0:registerEventHandler( "transition_complete_keyframe", f142_local0 )
					end
				end
				
				WinningTeamFactionNameNew:completeAnimation()
				self.WinningTeamFactionNameNew:setAlpha( 0 )
				f99_local5( WinningTeamFactionNameNew, {} )
				local f99_local6 = function ( f143_arg0, f143_arg1 )
					local f143_local0 = function ( f67_arg0, f67_arg1 )
						if not f67_arg1.interrupted then
							f67_arg0:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Bounce )
						end
						f67_arg0:setAlpha( 1 )
						if f67_arg1.interrupted then
							self.clipFinished( f67_arg0, f67_arg1 )
						else
							f67_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f143_arg1.interrupted then
						f143_local0( f143_arg0, f143_arg1 )
						return 
					else
						f143_arg0:beginAnimation( "keyframe", 469, false, false, CoD.TweenType.Linear )
						f143_arg0:registerEventHandler( "transition_complete_keyframe", f143_local0 )
					end
				end
				
				WinningTeamFactionIconNew:completeAnimation()
				self.WinningTeamFactionIconNew:setAlpha( 0 )
				f99_local6( WinningTeamFactionIconNew, {} )
				local f99_local11 = function ( f148_arg0, f148_arg1 )
					local f148_local0 = function ( f80_arg0, f80_arg1 )
						if not f80_arg1.interrupted then
							f80_arg0:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Bounce )
						end
						f80_arg0:setAlpha( 1 )
						if f80_arg1.interrupted then
							self.clipFinished( f80_arg0, f80_arg1 )
						else
							f80_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f148_arg1.interrupted then
						f148_local0( f148_arg0, f148_arg1 )
						return 
					else
						f148_arg0:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
						f148_arg0:registerEventHandler( "transition_complete_keyframe", f148_local0 )
					end
				end
				
				SubTitleNew:completeAnimation()
				self.SubTitleNew:setAlpha( 0 )
				f99_local11( SubTitleNew, {} )
				local f99_local8 = function ( f145_arg0, f145_arg1 )
					local f145_local0 = function ( f70_arg0, f70_arg1 )
						if not f70_arg1.interrupted then
							f70_arg0:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Bounce )
						end
						f70_arg0:setAlpha( 1 )
						if f70_arg1.interrupted then
							self.clipFinished( f70_arg0, f70_arg1 )
						else
							f70_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f145_arg1.interrupted then
						f145_local0( f145_arg0, f145_arg1 )
						return 
					else
						f145_arg0:beginAnimation( "keyframe", 720, false, false, CoD.TweenType.Linear )
						f145_arg0:registerEventHandler( "transition_complete_keyframe", f145_local0 )
					end
				end
				
				LosingTeamFactionNameNew:completeAnimation()
				self.LosingTeamFactionNameNew:setAlpha( 0 )
				f99_local8( LosingTeamFactionNameNew, {} )
				local f99_local9 = function ( f146_arg0, f146_arg1 )
					local f146_local0 = function ( f72_arg0, f72_arg1 )
						if not f72_arg1.interrupted then
							f72_arg0:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Bounce )
						end
						f72_arg0:setAlpha( 1 )
						if f72_arg1.interrupted then
							self.clipFinished( f72_arg0, f72_arg1 )
						else
							f72_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f146_arg1.interrupted then
						f146_local0( f146_arg0, f146_arg1 )
						return 
					else
						f146_arg0:beginAnimation( "keyframe", 819, false, false, CoD.TweenType.Linear )
						f146_arg0:registerEventHandler( "transition_complete_keyframe", f146_local0 )
					end
				end
				
				LosingTeamFactionIconNew:completeAnimation()
				self.LosingTeamFactionIconNew:setAlpha( 0 )
				f99_local9( LosingTeamFactionIconNew, {} )
				local f99_local10 = function ( f147_arg0, f147_arg1 )
					if not f147_arg1.interrupted then
						f147_arg0:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
					end
					f147_arg0:setAlpha( 1 )
					if f147_arg1.interrupted then
						self.clipFinished( f147_arg0, f147_arg1 )
					else
						f147_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				local f99_local12 = function ( f149_arg0, f149_arg1 )
					local f149_local0 = function ( f82_arg0, f82_arg1 )
						if not f82_arg1.interrupted then
							f82_arg0:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Bounce )
						end
						f82_arg0:setAlpha( 1 )
						if f82_arg1.interrupted then
							self.clipFinished( f82_arg0, f82_arg1 )
						else
							f82_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f149_arg1.interrupted then
						f149_local0( f149_arg0, f149_arg1 )
						return 
					else
						f149_arg0:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						f149_arg0:registerEventHandler( "transition_complete_keyframe", f149_local0 )
					end
				end
				
				VSBanner:completeAnimation()
				self.VSBanner:setAlpha( 0 )
				f99_local12( VSBanner, {} )
				local f99_local13 = function ( f150_arg0, f150_arg1 )
					local f150_local0 = function ( f10_arg0, f10_arg1 )
						if not f10_arg1.interrupted then
							f10_arg0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Bounce )
						end
						f10_arg0:setAlpha( 1 )
						if f10_arg1.interrupted then
							self.clipFinished( f10_arg0, f10_arg1 )
						else
							f10_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f150_arg1.interrupted then
						f150_local0( f150_arg0, f150_arg1 )
						return 
					else
						f150_arg0:beginAnimation( "keyframe", 560, false, false, CoD.TweenType.Linear )
						f150_arg0:registerEventHandler( "transition_complete_keyframe", f150_local0 )
					end
				end
				
				VSLabel:completeAnimation()
				self.VSLabel:setAlpha( 0 )
				f99_local13( VSLabel, {} )
				--[[WinnerFactionInfo:completeAnimation()
				self.WinnerFactionInfo:setAlpha( 0 )
				self.clipFinished( WinnerFactionInfo, {} )]]
				local f99_local14 = function ( f151_arg0, f151_arg1 )
					local f151_local0 = function ( f12_arg0, f12_arg1 )
						if not f12_arg1.interrupted then
							f12_arg0:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Bounce )
						end
						f12_arg0:setAlpha( 1 )
						if f12_arg1.interrupted then
							self.clipFinished( f12_arg0, f12_arg1 )
						else
							f12_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f151_arg1.interrupted then
						f151_local0( f151_arg0, f151_arg1 )
						return 
					else
						f151_arg0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						f151_arg0:registerEventHandler( "transition_complete_keyframe", f151_local0 )
					end
				end
				
				TitleNew:completeAnimation()
				self.TitleNew:setAlpha( 0 )
				f99_local14( TitleNew, {} )
				local f99_local15 = function ( f152_arg0, f152_arg1 )
					local f152_local0 = function ( f14_arg0, f14_arg1 )
						if not f14_arg1.interrupted then
							f14_arg0:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Bounce )
						end
						f14_arg0:setAlpha( 1 )
						if f14_arg1.interrupted then
							self.clipFinished( f14_arg0, f14_arg1 )
						else
							f14_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f152_arg1.interrupted then
						f152_local0( f152_arg0, f152_arg1 )
						return 
					else
						f152_arg0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						f152_arg0:registerEventHandler( "transition_complete_keyframe", f152_local0 )
					end
				end
				
				MatchBonusWidget0:completeAnimation()
				self.MatchBonusWidget0:setAlpha( 0 )
				f99_local15( MatchBonusWidget0, {} )
			end,
			End_Transition = function ()
				self:setupElementClipCounter( 22 )
				local f100_local0 = function ( f18_arg0, f18_arg1 )
					if not f18_arg1.interrupted then
						f18_arg0:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					f18_arg0:setAlpha( 0 )
					if f18_arg1.interrupted then
						self.clipFinished( f18_arg0, f18_arg1 )
					else
						f18_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftPanelR:completeAnimation()
				self.LeftPanelR:setAlpha( 1 )
				f100_local0( LeftPanelR, {} )
				local f100_local1 = function ( f19_arg0, f19_arg1 )
					if not f19_arg1.interrupted then
						f19_arg0:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					f19_arg0:setAlpha( 0 )
					if f19_arg1.interrupted then
						self.clipFinished( f19_arg0, f19_arg1 )
					else
						f19_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftPanelL:completeAnimation()
				self.LeftPanelL:setAlpha( 1 )
				f100_local1( LeftPanelL, {} )
				local f100_local2 = function ( f20_arg0, f20_arg1 )
					local f20_local0 = function ( f55_arg0, f55_arg1 )
						if not f55_arg1.interrupted then
							f55_arg0:beginAnimation( "keyframe", 339, false, false, CoD.TweenType.Linear )
						end
						f55_arg0:setRGB( 0, 0, 0 )
						if f55_arg1.interrupted then
							self.clipFinished( f55_arg0, f55_arg1 )
						else
							f55_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f20_arg1.interrupted then
						f20_local0( f20_arg0, f20_arg1 )
						return 
					else
						f20_arg0:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
						f20_arg0:registerEventHandler( "transition_complete_keyframe", f20_local0 )
					end
				end
				
				VignetteBack:completeAnimation()
				self.VignetteBack:setRGB( 1, 1, 1 )
				f100_local2( VignetteBack, {} )
				local f100_local3 = function ( f21_arg0, f21_arg1 )
					if not f21_arg1.interrupted then
						f21_arg0:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					f21_arg0:setAlpha( 0 )
					f21_arg0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
					f21_arg0:setShaderVector( 0, 0.1, 0, 0, 0 )
					f21_arg0:setShaderVector( 1, 0, 0, 0, 0 )
					f21_arg0:setShaderVector( 2, 0, 0, 0, 0 )
					f21_arg0:setShaderVector( 3, 0, 0, 0, 0 )
					f21_arg0:setShaderVector( 4, 0, 0.02, 0, 0 )
					if f21_arg1.interrupted then
						self.clipFinished( f21_arg0, f21_arg1 )
					else
						f21_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				WinningTeamScoreNew:completeAnimation()
				self.WinningTeamScoreNew:setAlpha( 1 )
				self.WinningTeamScoreNew:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
				self.WinningTeamScoreNew:setShaderVector( 0, 0.1, 0, 0, 0 )
				self.WinningTeamScoreNew:setShaderVector( 1, 0, 0, 0, 0 )
				self.WinningTeamScoreNew:setShaderVector( 2, 0, 0, 0, 0 )
				self.WinningTeamScoreNew:setShaderVector( 3, 0, 0, 0, 0 )
				self.WinningTeamScoreNew:setShaderVector( 4, 0, 0.02, 0, 0 )
				f100_local3( WinningTeamScoreNew, {} )
				local f100_local4 = function ( f22_arg0, f22_arg1 )
					if not f22_arg1.interrupted then
						f22_arg0:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					f22_arg0:setAlpha( 0 )
					f22_arg0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
					f22_arg0:setShaderVector( 0, 0.1, 0, 0, 0 )
					f22_arg0:setShaderVector( 1, 0, 0, 0, 0 )
					f22_arg0:setShaderVector( 2, 0, 0, 0, 0 )
					f22_arg0:setShaderVector( 3, 0, 0, 0, 0 )
					f22_arg0:setShaderVector( 4, 0, 0.02, 0, 0 )
					if f22_arg1.interrupted then
						self.clipFinished( f22_arg0, f22_arg1 )
					else
						f22_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LosingTeamScoreNew:completeAnimation()
				self.LosingTeamScoreNew:setAlpha( 1 )
				self.LosingTeamScoreNew:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
				self.LosingTeamScoreNew:setShaderVector( 0, 0.1, 0, 0, 0 )
				self.LosingTeamScoreNew:setShaderVector( 1, 0, 0, 0, 0 )
				self.LosingTeamScoreNew:setShaderVector( 2, 0, 0, 0, 0 )
				self.LosingTeamScoreNew:setShaderVector( 3, 0, 0, 0, 0 )
				self.LosingTeamScoreNew:setShaderVector( 4, 0, 0.02, 0, 0 )
				f100_local4( LosingTeamScoreNew, {} )
				local f100_local5 = function ( f23_arg0, f23_arg1 )
					if not f23_arg1.interrupted then
						f23_arg0:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					f23_arg0:setAlpha( 0 )
					if f23_arg1.interrupted then
						self.clipFinished( f23_arg0, f23_arg1 )
					else
						f23_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				WinningTeamFactionNameNew:completeAnimation()
				self.WinningTeamFactionNameNew:setAlpha( 1 )
				f100_local5( WinningTeamFactionNameNew, {} )
				local f100_local6 = function ( f24_arg0, f24_arg1 )
					if not f24_arg1.interrupted then
						f24_arg0:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					f24_arg0:setAlpha( 0 )
					if f24_arg1.interrupted then
						self.clipFinished( f24_arg0, f24_arg1 )
					else
						f24_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				WinningTeamFactionIconNew:completeAnimation()
				self.WinningTeamFactionIconNew:setAlpha( 1 )
				f100_local6( WinningTeamFactionIconNew, {} )
				local f100_local7 = function ( f25_arg0, f25_arg1 )
					if not f25_arg1.interrupted then
						f25_arg0:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					f25_arg0:setAlpha( 0 )
					if f25_arg1.interrupted then
						self.clipFinished( f25_arg0, f25_arg1 )
					else
						f25_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LosingTeamFactionNameNew:completeAnimation()
				self.LosingTeamFactionNameNew:setAlpha( 1 )
				f100_local7( LosingTeamFactionNameNew, {} )
				local f100_local8 = function ( f26_arg0, f26_arg1 )
					if not f26_arg1.interrupted then
						f26_arg0:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					f26_arg0:setAlpha( 0 )
					if f26_arg1.interrupted then
						self.clipFinished( f26_arg0, f26_arg1 )
					else
						f26_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LosingTeamFactionIconNew:completeAnimation()
				self.LosingTeamFactionIconNew:setAlpha( 1 )
				f100_local8( LosingTeamFactionIconNew, {} )
				local f100_local10 = function ( f28_arg0, f28_arg1 )
					if not f28_arg1.interrupted then
						f28_arg0:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					f28_arg0:setAlpha( 0 )
					if f28_arg1.interrupted then
						self.clipFinished( f28_arg0, f28_arg1 )
					else
						f28_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				local f100_local9 = function ( f27_arg0, f27_arg1 )
					if not f27_arg1.interrupted then
						f27_arg0:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					f27_arg0:setAlpha( 0 )
					if f27_arg1.interrupted then
						self.clipFinished( f27_arg0, f27_arg1 )
					else
						f27_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				SubTitleNew:completeAnimation()
				self.SubTitleNew:setAlpha( 1 )
				f100_local9( SubTitleNew, {} )

				VSBanner:completeAnimation()
				self.VSBanner:setAlpha( 1 )
				f100_local10( VSBanner, {} )
				local f100_local11 = function ( f29_arg0, f29_arg1 )
					if not f29_arg1.interrupted then
						f29_arg0:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					f29_arg0:setAlpha( 0 )
					if f29_arg1.interrupted then
						self.clipFinished( f29_arg0, f29_arg1 )
					else
						f29_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				VSLabel:completeAnimation()
				self.VSLabel:setAlpha( 1 )
				f100_local11( VSLabel, {} )
				local f100_local12 = function ( f30_arg0, f30_arg1 )
					local f30_local0 = function ( f75_arg0, f75_arg1 )
						local f75_local0 = function ( f76_arg0, f76_arg1 )
							if not f76_arg1.interrupted then
								f76_arg0:beginAnimation( "keyframe", 250, true, false, CoD.TweenType.Linear )
							end
							f76_arg0:setLeftRight( true, true, 0, 0 )
							f76_arg0:setTopBottom( false, true, 0, 360 )
							f76_arg0:setAlpha( 0 )
							if f76_arg1.interrupted then
								self.clipFinished( f76_arg0, f76_arg1 )
							else
								f76_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f75_arg1.interrupted then
							f75_local0( f75_arg0, f75_arg1 )
							return 
						else
							f75_arg0:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
							f75_arg0:registerEventHandler( "transition_complete_keyframe", f75_local0 )
						end
					end
					
					if f30_arg1.interrupted then
						f30_local0( f30_arg0, f30_arg1 )
						return 
					else
						f30_arg0:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Linear )
						f30_arg0:setTopBottom( false, true, -360, 0 )
						f30_arg0:setAlpha( 1 )
						f30_arg0:registerEventHandler( "transition_complete_keyframe", f30_local0 )
					end
				end
				
				TransitionImageBottom:completeAnimation()
				self.TransitionImageBottom:setLeftRight( true, true, 0, 0 )
				self.TransitionImageBottom:setTopBottom( false, true, 0, 360 )
				self.TransitionImageBottom:setAlpha( 0 )
				f100_local12( TransitionImageBottom, {} )
				local f100_local13 = function ( f31_arg0, f31_arg1 )
					local f31_local0 = function ( f78_arg0, f78_arg1 )
						local f78_local0 = function ( f80_arg0, f80_arg1 )
							if not f80_arg1.interrupted then
								f80_arg0:beginAnimation( "keyframe", 250, true, false, CoD.TweenType.Linear )
							end
							f80_arg0:setLeftRight( true, true, 0, 0 )
							f80_arg0:setTopBottom( true, false, -360, 0 )
							f80_arg0:setAlpha( 0 )
							if f80_arg1.interrupted then
								self.clipFinished( f80_arg0, f80_arg1 )
							else
								f80_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f78_arg1.interrupted then
							f78_local0( f78_arg0, f78_arg1 )
							return 
						else
							f78_arg0:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
							f78_arg0:registerEventHandler( "transition_complete_keyframe", f78_local0 )
						end
					end
					
					if f31_arg1.interrupted then
						f31_local0( f31_arg0, f31_arg1 )
						return 
					else
						f31_arg0:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Linear )
						f31_arg0:setTopBottom( true, false, 0, 360 )
						f31_arg0:setAlpha( 1 )
						f31_arg0:registerEventHandler( "transition_complete_keyframe", f31_local0 )
					end
				end
				
				TransitionImageTop:completeAnimation()
				self.TransitionImageTop:setLeftRight( true, true, 0, 0 )
				self.TransitionImageTop:setTopBottom( true, false, -360, 0 )
				self.TransitionImageTop:setAlpha( 0 )
				f100_local13( TransitionImageTop, {} )
				--[[WinnerFactionInfo:completeAnimation()
				self.WinnerFactionInfo:setLeftRight( true, false, 64, 454 )
				self.WinnerFactionInfo:setTopBottom( true, false, 37.5, 217.5 )
				self.WinnerFactionInfo:setAlpha( 0 )
				self.clipFinished( WinnerFactionInfo, {} )]]
				local f100_local14 = function ( f32_arg0, f32_arg1 )
					local f32_local0 = function ( f82_arg0, f82_arg1 )
						local f82_local0 = function ( f83_arg0, f83_arg1 )
							if not f83_arg1.interrupted then
								f83_arg0:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
							end
							f83_arg0:setAlpha( 0 )
							if f83_arg1.interrupted then
								self.clipFinished( f83_arg0, f83_arg1 )
							else
								f83_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f82_arg1.interrupted then
							f82_local0( f82_arg0, f82_arg1 )
							return 
						else
							f82_arg0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							f82_arg0:setAlpha( 0.82 )
							f82_arg0:registerEventHandler( "transition_complete_keyframe", f82_local0 )
						end
					end
					
					if f32_arg1.interrupted then
						f32_local0( f32_arg0, f32_arg1 )
						return 
					else
						f32_arg0:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						f32_arg0:setAlpha( 0 )
						f32_arg0:registerEventHandler( "transition_complete_keyframe", f32_local0 )
					end
				end
				
				TitleNew:completeAnimation()
				self.TitleNew:setAlpha( 1 )
				f100_local14( TitleNew, {} )
				local f100_local15 = function ( f33_arg0, f33_arg1 )
					if not f33_arg1.interrupted then
						f33_arg0:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Bounce )
					end
					f33_arg0:setAlpha( 0 )
					if f33_arg1.interrupted then
						self.clipFinished( f33_arg0, f33_arg1 )
					else
						f33_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MatchBonusWidget0:completeAnimation()
				self.MatchBonusWidget0:setAlpha( 1 )
				f100_local15( MatchBonusWidget0, {} )
			end,
			ShowFFAOutcome = function ()
				self:setupElementClipCounter( 7 )
				local f101_local0 = function ( f84_arg0, f84_arg1 )
					if not f84_arg1.interrupted then
						f84_arg0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					f84_arg0:setRGB( 1, 1, 1 )
					if f84_arg1.interrupted then
						self.clipFinished( f84_arg0, f84_arg1 )
					else
						f84_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				VignetteBack:completeAnimation()
				self.VignetteBack:setRGB( 0, 0, 0 )
				f101_local0( VignetteBack, {} )
				local f101_local5 = function ( f89_arg0, f89_arg1 )
					local f89_local0 = function ( f108_arg0, f108_arg1 )
						if not f108_arg1.interrupted then
							f108_arg0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Bounce )
						end
						f108_arg0:setAlpha( 1 )
						if f108_arg1.interrupted then
							self.clipFinished( f108_arg0, f108_arg1 )
						else
							f108_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f89_arg1.interrupted then
						f89_local0( f89_arg0, f89_arg1 )
						return 
					else
						f89_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						f89_arg0:registerEventHandler( "transition_complete_keyframe", f89_local0 )
					end
				end
				
				TitleNew:completeAnimation()
				self.TitleNew:setAlpha( 0 )
				f101_local5( TitleNew, {} )
				local f101_local6 = function ( f90_arg0, f90_arg1 )
					if not f90_arg1.interrupted then
						f90_arg0:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Bounce )
					end
					f90_arg0:setAlpha( 1 )
					if f90_arg1.interrupted then
						self.clipFinished( f90_arg0, f90_arg1 )
					else
						f90_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MatchBonusWidget0:completeAnimation()
				self.MatchBonusWidget0:setAlpha( 0 )
				f101_local6( MatchBonusWidget0, {} )
			end,
			ShowFFATie = function ()
				self:setupElementClipCounter( 4 )
				local f102_local0 = function ( f110_arg0, f110_arg1 )
					if not f110_arg1.interrupted then
						f110_arg0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					f110_arg0:setRGB( 1, 1, 1 )
					if f110_arg1.interrupted then
						self.clipFinished( f110_arg0, f110_arg1 )
					else
						f110_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				VignetteBack:completeAnimation()
				self.VignetteBack:setRGB( 0, 0, 0 )
				f102_local0( VignetteBack, {} )
				local f102_local2 = function ( f112_arg0, f112_arg1 )
					local f112_local0 = function ( f123_arg0, f123_arg1 )
						if not f123_arg1.interrupted then
							f123_arg0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Bounce )
						end
						f123_arg0:setAlpha( 1 )
						if f123_arg1.interrupted then
							self.clipFinished( f123_arg0, f123_arg1 )
						else
							f123_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f112_arg1.interrupted then
						f112_local0( f112_arg0, f112_arg1 )
						return 
					else
						f112_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						f112_arg0:registerEventHandler( "transition_complete_keyframe", f112_local0 )
					end
				end
				
				TitleNew:completeAnimation()
				self.TitleNew:setAlpha( 0 )
				f102_local2( TitleNew, {} )
				local f102_local3 = function ( f113_arg0, f113_arg1 )
					if not f113_arg1.interrupted then
						f113_arg0:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Bounce )
					end
					f113_arg0:setAlpha( 1 )
					if f113_arg1.interrupted then
						self.clipFinished( f113_arg0, f113_arg1 )
					else
						f113_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MatchBonusWidget0:completeAnimation()
				self.MatchBonusWidget0:setAlpha( 0 )
				f102_local3( MatchBonusWidget0, {} )
			end,
			End_Transition_FFA = function ()
				self:setupElementClipCounter( 12 )
				local f103_local0 = function ( f124_arg0, f124_arg1 )
					local f124_local0 = function ( f10_arg0, f10_arg1 )
						if not f10_arg1.interrupted then
							f10_arg0:beginAnimation( "keyframe", 339, false, false, CoD.TweenType.Linear )
						end
						f10_arg0:setRGB( 0, 0, 0 )
						if f10_arg1.interrupted then
							self.clipFinished( f10_arg0, f10_arg1 )
						else
							f10_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f124_arg1.interrupted then
						f124_local0( f124_arg0, f124_arg1 )
						return 
					else
						f124_arg0:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
						f124_arg0:registerEventHandler( "transition_complete_keyframe", f124_local0 )
					end
				end
				
				VignetteBack:completeAnimation()
				self.VignetteBack:setRGB( 1, 1, 1 )
				f103_local0( VignetteBack, {} )
				local f103_local5 = function ( f129_arg0, f129_arg1 )
					local f129_local0 = function ( f13_arg0, f13_arg1 )
						local f13_local0 = function ( f14_arg0, f14_arg1 )
							if not f14_arg1.interrupted then
								f14_arg0:beginAnimation( "keyframe", 250, true, false, CoD.TweenType.Linear )
							end
							f14_arg0:setLeftRight( true, true, 0, 0 )
							f14_arg0:setTopBottom( false, true, 0, 360 )
							f14_arg0:setAlpha( 0 )
							if f14_arg1.interrupted then
								self.clipFinished( f14_arg0, f14_arg1 )
							else
								f14_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f13_arg1.interrupted then
							f13_local0( f13_arg0, f13_arg1 )
							return 
						else
							f13_arg0:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
							f13_arg0:registerEventHandler( "transition_complete_keyframe", f13_local0 )
						end
					end
					
					if f129_arg1.interrupted then
						f129_local0( f129_arg0, f129_arg1 )
						return 
					else
						f129_arg0:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Linear )
						f129_arg0:setTopBottom( false, true, -360, 0 )
						f129_arg0:setAlpha( 1 )
						f129_arg0:registerEventHandler( "transition_complete_keyframe", f129_local0 )
					end
				end
				
				TransitionImageBottom:completeAnimation()
				self.TransitionImageBottom:setLeftRight( true, true, 0, 0 )
				self.TransitionImageBottom:setTopBottom( false, true, 0, 360 )
				self.TransitionImageBottom:setAlpha( 0 )
				f103_local5( TransitionImageBottom, {} )
				local f103_local6 = function ( f130_arg0, f130_arg1 )
					local f130_local0 = function ( f15_arg0, f15_arg1 )
						local f15_local0 = function ( f16_arg0, f16_arg1 )
							if not f16_arg1.interrupted then
								f16_arg0:beginAnimation( "keyframe", 250, true, false, CoD.TweenType.Linear )
							end
							f16_arg0:setLeftRight( true, true, 0, 0 )
							f16_arg0:setTopBottom( true, false, -360, 0 )
							f16_arg0:setAlpha( 0 )
							if f16_arg1.interrupted then
								self.clipFinished( f16_arg0, f16_arg1 )
							else
								f16_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f15_arg1.interrupted then
							f15_local0( f15_arg0, f15_arg1 )
							return 
						else
							f15_arg0:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
							f15_arg0:registerEventHandler( "transition_complete_keyframe", f15_local0 )
						end
					end
					
					if f130_arg1.interrupted then
						f130_local0( f130_arg0, f130_arg1 )
						return 
					else
						f130_arg0:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Linear )
						f130_arg0:setTopBottom( true, false, 0, 360 )
						f130_arg0:setAlpha( 1 )
						f130_arg0:registerEventHandler( "transition_complete_keyframe", f130_local0 )
					end
				end
				
				TransitionImageTop:completeAnimation()
				self.TransitionImageTop:setLeftRight( true, true, 0, 0 )
				self.TransitionImageTop:setTopBottom( true, false, -360, 0 )
				self.TransitionImageTop:setAlpha( 0 )
				f103_local6( TransitionImageTop, {} )
				--[[WinnerFactionInfo:completeAnimation()
				self.WinnerFactionInfo:setLeftRight( true, false, 64, 454 )
				self.WinnerFactionInfo:setTopBottom( true, false, 37.5, 217.5 )
				self.WinnerFactionInfo:setAlpha( 0 )
				self.clipFinished( WinnerFactionInfo, {} )]]
				local f103_local7 = function ( f131_arg0, f131_arg1 )
					local f131_local0 = function ( f17_arg0, f17_arg1 )
						local f17_local0 = function ( f14_arg0, f14_arg1 )
							if not f14_arg1.interrupted then
								f14_arg0:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
							end
							f14_arg0:setAlpha( 0 )
							if f14_arg1.interrupted then
								self.clipFinished( f14_arg0, f14_arg1 )
							else
								f14_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f17_arg1.interrupted then
							f17_local0( f17_arg0, f17_arg1 )
							return 
						else
							f17_arg0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							f17_arg0:setAlpha( 0.82 )
							f17_arg0:registerEventHandler( "transition_complete_keyframe", f17_local0 )
						end
					end
					
					if f131_arg1.interrupted then
						f131_local0( f131_arg0, f131_arg1 )
						return 
					else
						f131_arg0:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						f131_arg0:setAlpha( 0 )
						f131_arg0:registerEventHandler( "transition_complete_keyframe", f131_local0 )
					end
				end
				
				TitleNew:completeAnimation()
				self.TitleNew:setAlpha( 1 )
				f103_local7( TitleNew, {} )
				local f103_local8 = function ( f132_arg0, f132_arg1 )
					if not f132_arg1.interrupted then
						f132_arg0:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Bounce )
					end
					f132_arg0:setAlpha( 0 )
					if f132_arg1.interrupted then
						self.clipFinished( f132_arg0, f132_arg1 )
					else
						f132_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MatchBonusWidget0:completeAnimation()
				self.MatchBonusWidget0:setAlpha( 1 )
				f103_local8( MatchBonusWidget0, {} )
				local f101_local4 = function ( f88_arg0, f88_arg1 )
					local f88_local0 = function ( f105_arg0, f105_arg1 )
						if not f105_arg1.interrupted then
							f105_arg0:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Bounce )
						end
						f105_arg0:setAlpha( 1 )
						if f105_arg1.interrupted then
							self.clipFinished( f105_arg0, f105_arg1 )
						else
							f105_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f88_arg1.interrupted then
						f88_local0( f88_arg0, f88_arg1 )
						return 
					else
						f88_arg0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						f88_arg0:registerEventHandler( "transition_complete_keyframe", f88_local0 )
					end
				end
				
				SubTitleNew:completeAnimation()
				self.SubTitleNew:setAlpha( 0 )
				f101_local4( SubTitleNew, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LeftPanelR:close()
		element.LeftPanelL:close()
		element.VignetteBack:close()
		element.WinningTeamScoreNew:close()
		element.LosingTeamScoreNew:close()
		element.WinningTeamFactionNameNew:close()
		element.WinningTeamFactionIconNew:close()
		element.LosingTeamFactionNameNew:close()
		element.LosingTeamFactionIconNew:close()
		element.VSBanner:close()
		element.SubTitleNew:close()
		--element.WinnerFactionInfo:close()
		element.TitleNew:close()
		element.MatchBonusWidget0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

