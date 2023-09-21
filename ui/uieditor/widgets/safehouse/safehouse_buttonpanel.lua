-- d41d8cd98f00b204e9800998ecf8427e
-- This hash is used for caching, delete to decompile the file again

CoD.SafeHouse_ButtonPanel = InheritFrom( LUI.UIElement )
CoD.SafeHouse_ButtonPanel.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SafeHouse_ButtonPanel )
	self.id = "SafeHouse_ButtonPanel"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 280 )
	self:setTopBottom( true, false, 0, 28 )
	
	local SafeHousePanel = LUI.UIImage.new()
	SafeHousePanel:setLeftRight( true, true, 0, 0 )
	SafeHousePanel:setTopBottom( true, true, 0, 0 )
	SafeHousePanel:setRGB( 0, 0, 0 )
	SafeHousePanel:setAlpha( 0.75 )
	self:addElement( SafeHousePanel )
	self.SafeHousePanel = SafeHousePanel
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Transparent = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Safehouse = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Transparent",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "hideWorldForStreamer", 1 )
			end
		},
		{
			stateName = "Safehouse",
			condition = function ( menu, element, event )
				return IsCPAndInSafehouse()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "hideWorldForStreamer" ), function ( modelRef )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( modelRef ),
			modelName = "hideWorldForStreamer"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

