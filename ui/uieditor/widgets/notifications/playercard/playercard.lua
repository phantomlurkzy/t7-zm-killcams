-- d41d8cd98f00b204e9800998ecf8427e
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CallingCards.CallingCards_FrameWidget" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.EndGameFlow.Top3PlayerScoreBlurBox" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
require( "ui.uieditor.widgets.Lobby.Common.FE_PanelNoBlur" )
require( "ui.uieditor.widgets.Notifications.PlayerCard.PlayerCard_Label" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )

CoD.PlayerCard = InheritFrom( LUI.UIElement )
CoD.PlayerCard.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PlayerCard )
	self.id = "PlayerCard"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 308 )
	self:setTopBottom( true, false, 0, 60 )
	self.anyChildUsesUpdateState = true
	
--[[	local CallingCardsFrameWidget = CoD.CallingCards_FrameWidget.new( menu, controller )
    CallingCardsFrameWidget:setLeftRight( true, false, 92, 304 )
    CallingCardsFrameWidget:setTopBottom( true, false, 2, 57 )
    CallingCardsFrameWidget.CardIconFrame:setScale( 0.44 )
    CoD.ChallengesUtility.SetCallingCardForWidget( CallingCardsFrameWidget.CardIconFrame, Engine.TableLookupGetColumnValueForRow( CoD.backgroundsTable, Engine.GetEmblemBackgroundId(), 3 ), menu.id )
    self:addElement( CallingCardsFrameWidget )
    self.CallingCardsFrameWidget = CallingCardsFrameWidget
	
	local GamerTag = CoD.PlayerCard_Label.new( menu, controller )
	GamerTag:setLeftRight( true, false, 92.41, 300.41 )
	GamerTag:setTopBottom( true, false, 5, 25 )
	GamerTag:setRGB(0.92, 0.8, 0.31)
	GamerTag.Panel:setAlpha( 0.6 )
	GamerTag:setAlpha( HideIfEmptyString( Engine.GetPlayerNameForClientNum( controller, Engine.GetClientNum( controller ) ) ) )
	GamerTag.itemName:setText( Engine.GetPlayerNameForClientNum( controller, Engine.GetClientNum( controller ) ) )
	LUI.OverrideFunction_CallOriginalFirst( GamerTag, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, 1 )
	end )
	self:addElement( GamerTag )
	self.GamerTag = GamerTag
	
	local ClanTag = CoD.PlayerCard_Label.new( menu, controller )
	ClanTag:setLeftRight( true, false, 92.41, 139.41 )
	ClanTag:setTopBottom( true, false, 26, 46 )
	ClanTag.Panel:setAlpha( 0.6 )
	ClanTag:setAlpha( HideIfEmptyString( Engine.GetClanTagForClientNum( controller, Engine.GetClientNum( controller ) ) ) )
	ClanTag.itemName:setText( Engine.GetClanTagForClientNum( controller, Engine.GetClientNum( controller ) ) )
	LUI.OverrideFunction_CallOriginalFirst( ClanTag, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, 1 )
	end )
	self:addElement( ClanTag )
	self.ClanTag = ClanTag
	
	local PlayerEmblem = LUI.UIImage.new()
	PlayerEmblem:setLeftRight( true, false, 0, 91 )
	PlayerEmblem:setTopBottom( true, false, 2, 57 )
	PlayerEmblem:setupPlayerEmblemByXUID( Engine.GetXUID64( controller ) )
	self:addElement( PlayerEmblem )
	self.PlayerEmblem = PlayerEmblem
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( true, false, -2.59, 93.41 )
	StartMenuframenoBG0:setTopBottom( true, false, 0, 59 )
	StartMenuframenoBG0:setAlpha( 0.6 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local StartMenuframenoBG1 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG1:setLeftRight( true, false, 88.41, 306.41 )
	StartMenuframenoBG1:setTopBottom( true, false, 0, 59 )
	StartMenuframenoBG1:setAlpha( 0.6 )
	self:addElement( StartMenuframenoBG1 )
	self.StartMenuframenoBG1 = StartMenuframenoBG1
	
	local Image00001 = LUI.UIImage.new()
	Image00001:setLeftRight( true, false, -19, -3 )
	Image00001:setTopBottom( true, false, -3, 5 )
	Image00001:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image00001:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image00001 )
	self.Image00001 = Image00001
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( true, false, -19, -3 )
	Image2:setTopBottom( true, false, 53, 61 )
	Image2:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image000010 = LUI.UIImage.new()
	Image000010:setLeftRight( true, false, 306, 322 )
	Image000010:setTopBottom( true, false, -2, 6 )
	Image000010:setZRot( 180 )
	Image000010:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image000010:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image000010 )
	self.Image000010 = Image000010
	
	local Image20 = LUI.UIImage.new()
	Image20:setLeftRight( true, false, 306, 322 )
	Image20:setTopBottom( true, false, 53, 61 )
	Image20:setZRot( 180 )
	Image20:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image20:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image20 )
	self.Image20 = Image20
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				CallingCardsFrameWidget:completeAnimation()
				self.CallingCardsFrameWidget:setLeftRight( true, false, 92, 304 )
				self.CallingCardsFrameWidget:setTopBottom( true, false, 2, 57 )
				self.clipFinished( CallingCardsFrameWidget, {} )
				PlayerEmblem:completeAnimation()
				self.PlayerEmblem:setAlpha( 1 )
				self.clipFinished( PlayerEmblem, {} )
				StartMenuframenoBG1:completeAnimation()
				self.StartMenuframenoBG1:setLeftRight( true, false, 89.41, 305.41 )
				self.StartMenuframenoBG1:setTopBottom( true, false, 0, 59 )
				self.clipFinished( StartMenuframenoBG1, {} )
				Image000010:completeAnimation()
				self.Image000010:setLeftRight( true, false, 306, 322 )
				self.Image000010:setTopBottom( true, false, -2, 6 )
				self.clipFinished( Image000010, {} )
				Image20:completeAnimation()
				self.Image20:setLeftRight( true, false, 306, 322 )
				self.Image20:setTopBottom( true, false, 53, 61 )
				self.clipFinished( Image20, {} )
			end,
			Side = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Emblem = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )
				CallingCardsFrameWidget:completeAnimation()
				self.CallingCardsFrameWidget:setLeftRight( true, false, 92, 304 )
				self.CallingCardsFrameWidget:setTopBottom( true, false, 2, 57 )
				self.clipFinished( CallingCardsFrameWidget, {} )
				PlayerEmblem:completeAnimation()
				self.PlayerEmblem:setAlpha( 1 )
				self.clipFinished( PlayerEmblem, {} )
				StartMenuframenoBG1:completeAnimation()
				self.StartMenuframenoBG1:setLeftRight( true, false, 89.41, 306 )
				self.StartMenuframenoBG1:setTopBottom( true, false, 0, 59 )
				self.clipFinished( StartMenuframenoBG1, {} )
				Image000010:completeAnimation()
				self.Image000010:setLeftRight( true, false, 306, 322 )
				self.Image000010:setTopBottom( true, false, -2, 6 )
				self.clipFinished( Image000010, {} )
				Image20:completeAnimation()
				self.Image20:setLeftRight( true, false, 306, 322 )
				self.Image20:setTopBottom( true, false, 53, 61 )
				self.clipFinished( Image20, {} )
			end
		},
		Calingcard = {
			DefaultClip = function ()
				self:setupElementClipCounter( 20 )
				CallingCardsFrameWidget:completeAnimation()
				self.CallingCardsFrameWidget:setLeftRight( true, false, 1.59, 213.59 )
				self.CallingCardsFrameWidget:setTopBottom( true, false, 2, 57 )
				self.clipFinished( CallingCardsFrameWidget, {} )
				GamerTag:completeAnimation()
				self.GamerTag:setLeftRight( true, false, 2, 205 )
				self.GamerTag:setTopBottom( true, false, 5, 25 )
				self.clipFinished( GamerTag, {} )
				ClanTag:completeAnimation()
				self.ClanTag:setLeftRight( true, false, 2, 49 )
				self.ClanTag:setTopBottom( true, false, 26, 46 )
				self.clipFinished( ClanTag, {} )
				PlayerEmblem:completeAnimation()
				self.PlayerEmblem:setAlpha( 0 )
				self.clipFinished( PlayerEmblem, {} )
				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setLeftRight( true, false, -4, 92 )
				self.StartMenuframenoBG0:setTopBottom( true, false, 0, 59 )
				self.StartMenuframenoBG0:setAlpha( 0 )
				self.clipFinished( StartMenuframenoBG0, {} )
				StartMenuframenoBG1:completeAnimation()
				self.StartMenuframenoBG1:setLeftRight( true, false, -1, 215.59 )
				self.StartMenuframenoBG1:setTopBottom( true, false, 0, 59 )
				self.clipFinished( StartMenuframenoBG1, {} )
				Image00001:completeAnimation()
				self.Image00001:setLeftRight( true, false, -15.41, 0.59 )
				self.Image00001:setTopBottom( true, false, -3, 5 )
				self.clipFinished( Image00001, {} )
				Image2:completeAnimation()
				self.Image2:setLeftRight( true, false, -15.41, 0.59 )
				self.Image2:setTopBottom( true, false, 53, 61 )
				self.clipFinished( Image2, {} )
				Image000010:completeAnimation()
				self.Image000010:setLeftRight( true, false, 215.59, 231.59 )
				self.Image000010:setTopBottom( true, false, -2, 6 )
				self.clipFinished( Image000010, {} )
				Image20:completeAnimation()
				self.Image20:setLeftRight( true, false, 215.59, 231.59 )
				self.Image20:setTopBottom( true, false, 53, 61 )
				self.clipFinished( Image20, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Emblem",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		},
		{
			stateName = "Calingcard",
			condition = function ( menu, element, event )
				return true
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CallingCardsFrameWidget:close()
		element.GamerTag:close()
		element.ClanTag:close()
		element.StartMenuframenoBG0:close()
		element.StartMenuframenoBG1:close()
		element.PlayerEmblem:close()
	end )]]
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

