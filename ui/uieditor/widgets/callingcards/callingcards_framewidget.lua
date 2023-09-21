-- d41d8cd98f00b204e9800998ecf8427e
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CallingCards.CallingCards_BasicImage" )

local PostLoadFunc = function ( self, controller, menu )
	local f1_local0 = {
		"iconId",
		"emblemBacking",
		"backgroundId",
		"selectedBg",
		"identityBadge.xuid"
	}
	self.CardIconFrame.m_preventFromBeingActive = true
	self.CardIconFrame:linkToElementModel( self, nil, true, function ( modelRef )
		if self.backingSubscription ~= nil then
			self:removeSubscription( self.backingSubscription )
		end
		for f3_local0 = 1, #f1_local0, 1 do
			local f3_local3 = f1_local0[f3_local0]
			local f3_local4 = Engine.GetModel( modelRef, f3_local3 )
			if f3_local4 then
				self.backingSubscription = self:subscribeToModel( f3_local4, function ( modelRef )
					local modelValue = Engine.GetModelValue( modelRef )
					if f3_local3 == "identityBadge.xuid" then
						modelValue = GetPlayerBackground( controller, modelValue )
					end
					if modelValue then
						CoD.ChallengesUtility.SetCallingCardForWidget( self.CardIconFrame, GetBackgroundByID( modelValue ), menu.id )
					end
				end )
				break
			end
		end
	end )
end

CoD.CallingCards_FrameWidget = InheritFrom( LUI.UIElement )
CoD.CallingCards_FrameWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CallingCards_FrameWidget )
	self.id = "CallingCards_FrameWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	self.anyChildUsesUpdateState = true
	
	local CardIconFrame = LUI.UIFrame.new( menu, controller, 0, 0, false )
	CardIconFrame:setLeftRight( false, false, -240, 240 )
	CardIconFrame:setTopBottom( false, false, -60, 60 )
	CardIconFrame:changeFrameWidget( CoD.CallingCards_BasicImage )
	CardIconFrame:linkToElementModel( self, nil, false, function ( modelRef )
		CardIconFrame:setModel( modelRef, controller )
	end )
	self:addElement( CardIconFrame )
	self.CardIconFrame = CardIconFrame
	
	CardIconFrame.id = "CardIconFrame"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CardIconFrame:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

