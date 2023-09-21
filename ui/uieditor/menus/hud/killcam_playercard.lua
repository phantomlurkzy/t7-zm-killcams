
require( "ui.uieditor.widgets.CallingCards.CallingCards_FrameWidget" )
require( "ui.uieditor.widgets.Notifications.PlayerCard.PlayerCard_Label" )

CoD.killcam_playercard = InheritFrom( LUI.UIElement )
CoD.killcam_playercard.new = function ( menu, controller )
    local self = LUI.UIElement.new()
    if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.killcam_playercard )
	self.id = "killcam_playercard"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 0 )
	self:setTopBottom( true, false, 0, 0 )
        
    local CallingCardsFrameWidget = CoD.CallingCards_FrameWidget.new( menu, controller )
	CallingCardsFrameWidget:setLeftRight( true, false, 92, 304 )
	CallingCardsFrameWidget:setTopBottom( true, false, 2, 57 )
	CallingCardsFrameWidget.CardIconFrame:setScale( 0.44 )
	CoD.ChallengesUtility.SetCallingCardForWidget( CallingCardsFrameWidget.CardIconFrame, Engine.TableLookupGetColumnValueForRow( CoD.backgroundsTable, Engine.GetEmblemBackgroundId(), 3 ), menu.id )
	CallingCardsFrameWidget:linkToElementModel( self, nil, false, function ( modelRef )
		CallingCardsFrameWidget:setModel( modelRef, controller )
	end )
	self:addElement( CallingCardsFrameWidget )
	self.CallingCardsFrameWidget = CallingCardsFrameWidget

    local PlayerEmblem = LUI.UIImage.new()
	PlayerEmblem:setLeftRight( true, false, 0, 91 )
	PlayerEmblem:setTopBottom( true, false, 2, 57 )
	PlayerEmblem:setupPlayerEmblemByXUID( Engine.GetXUID64( controller ) )
	self:addElement( PlayerEmblem )
	self.PlayerEmblem = PlayerEmblem

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

    LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CallingCardsFrameWidget:close()
		element.PlayerEmblem:close()
		element.CalloutHeading:close()
		element.GamerTag:close()
		element.ClanTag:close()
	end )

    return self

end