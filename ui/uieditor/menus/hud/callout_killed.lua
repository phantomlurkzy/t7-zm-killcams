
require( "ui.uieditor.widgets.CallingCards.CallingCards_FrameWidget" )
require( "ui.uieditor.widgets.Notifications.PlayerCard.PlayerCard_Label" )

CoD.ZM_Callout_Killed = InheritFrom( LUI.UIElement )
CoD.ZM_Callout_Killed.new = function ( menu, controller )
    local self = LUI.UIElement.new()
    if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ZM_Callout_Killed )
	self.id = "ZM_Callout_Killed"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 0 )
	self:setTopBottom( true, false, 0, 0 )
        
    local CallingCardsFrameWidget = CoD.CallingCards_FrameWidget.new( menu, controller )
	CallingCardsFrameWidget:setLeftRight( true, false, 92, 304 )
	CallingCardsFrameWidget:setTopBottom( true, false, 2, 57 )
	CallingCardsFrameWidget.CardIconFrame:setScale( 0.44 )
	CallingCardsFrameWidget:linkToElementModel( self, nil, false, function ( modelRef )
		CallingCardsFrameWidget:setModel( modelRef, controller )
	end )
	self:addElement( CallingCardsFrameWidget )
	self.CallingCardsFrameWidget = CallingCardsFrameWidget

    local PlayerEmblem = LUI.UIImage.new()
	PlayerEmblem:setLeftRight( true, false, 0, 91 )
	PlayerEmblem:setTopBottom( true, false, 2, 57 )
	self:addElement( PlayerEmblem )
	self.PlayerEmblem = PlayerEmblem

	local CalloutHeading = LUI.UIText.new()
	CalloutHeading:setLeftRight( true, false, 94.41, 322 )
	CalloutHeading:setTopBottom( true, false, -16, 2 )
	CalloutHeading:setTTF( "fonts/escom.ttf" )
	CalloutHeading:setLetterSpacing( 0.5 )
	CalloutHeading:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	CalloutHeading:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
    CalloutHeading:setText( Engine.Localize( "Killed" ) )
	self:addElement( CalloutHeading )
	self.CalloutHeading = CalloutHeading

    local GamerTag = CoD.PlayerCard_Label.new( menu, controller )
	GamerTag:setLeftRight( true, false, 92.41, 300.41 )
	GamerTag:setTopBottom( true, false, 5, 25 )
	GamerTag.Panel:setAlpha( 0.6 )
    GamerTag:setAlpha( HideIfEmptyString( "Zombie" ) )
    GamerTag.itemName:setText( "Zombie" )
	self:addElement( GamerTag )
	self.GamerTag = GamerTag

    local ClanTag = CoD.PlayerCard_Label.new( menu, controller )
	ClanTag:setLeftRight( true, false, 92.41, 139.41 )
	ClanTag:setTopBottom( true, false, 26, 46 )
	ClanTag.Panel:setAlpha( 0.6 )
    ClanTag:setAlpha( HideIfEmptyString( "0" ) )
    ClanTag.itemName:setText( StringAsClanTag( "0" ) )
	self:addElement( ClanTag )
	self.ClanTag = ClanTag

    LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CallingCardsFrameWidget:close()
		element.PlayerEmblem:close()
		element.CalloutHeading:close()
		element.GamerTag:close()
		element.ClanTag:close()
	end )

    return self

end