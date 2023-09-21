-- d41d8cd98f00b204e9800998ecf8427e
-- This hash is used for caching, delete to decompile the file again

CoD.CallingCards_BasicImage = InheritFrom( LUI.UIElement )
CoD.CallingCards_BasicImage.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CallingCards_BasicImage )
	self.id = "CallingCards_BasicImage"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	
	local CardIcon = LUI.UIImage.new()
	CardIcon:setLeftRight( true, true, 0, 0 )
	CardIcon:setTopBottom( true, true, 0, 0 )
	CardIcon:setImage( RegisterImage( "uie_t7_icon_callingcard_temp2_lrg" ) )
	--CardIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook" ) )
    --CardIcon:setShaderVector( 0, 2, 0, 0, 0 )
    --CardIcon:setShaderVector( 1, 22.59, 0, 0, 0 )
	self:addElement( CardIcon )
	self.CardIcon = CardIcon
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

