require( "ui.uieditor.menus.ingame.killcam.killcammenu" )
require( "ui.uieditor.widgets.hud.outcome.outcome" )
require( "ui.uieditor.menus.hud.callout_killed" )

Update_Killcam_Visibility = function ( self, event )
	if Engine.IsVisibilityBitSet( event.controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) then
		self:setAlpha( 1 )
	else
		self:setAlpha( 0 )
	end
end

local function zm_killed_popup(sender, event)
	local function zm_killed_popup_buffer(sender, event)
		local function zm_killed_popup_turnoff(sender, event)
			local function zm_killed_popup_turnon(sender, event)
				local function zm_killed_popup_turnoff2(sender, event)
					local function zm_killed_popup_reset(sender, event)
						sender:beginAnimation("keyframe", 10, false, false, CoD.TweenType.Linear)
						sender:setTopBottom(true, true, 650, 0)
						sender:registerEventHandler("transition_complete_keyframe", nil)
					end

					if (event.interrupted) then
						return
					end

					sender:beginAnimation("keyframe", 30, false, false, CoD.TweenType.Linear)
					sender:setAlpha(0)
					sender.CallingCardsFrameWidget:setAlpha(0)
					sender.CalloutHeading:setAlpha(0)
					sender.PlayerEmblem:setAlpha(0)
					sender.GamerTag:setAlpha(0)
					sender.ClanTag:setAlpha(0)
					sender:registerEventHandler("transition_complete_keyframe", zm_killed_popup_reset)
				end


				if (event.interrupted) then
					return
				end
	
				sender:beginAnimation("keyframe", 40, false, false, CoD.TweenType.Linear)
				sender:setAlpha(1)
				sender.CallingCardsFrameWidget:setAlpha(1)
				sender.CalloutHeading:setAlpha(1)
				sender.PlayerEmblem:setAlpha(1)
				sender.GamerTag:setAlpha(1)
				sender.ClanTag:setAlpha(1)
				sender:registerEventHandler("transition_complete_keyframe", zm_killed_popup_turnoff2)
			end

			if (event.interrupted) then
				return
			end

			sender:beginAnimation("keyframe", 20, false, false, CoD.TweenType.Linear)
			sender:setAlpha(0)
			sender.CallingCardsFrameWidget:setAlpha(0)
			sender.CalloutHeading:setAlpha(0)
			sender.PlayerEmblem:setAlpha(0)
			sender.GamerTag:setAlpha(0)
			sender.ClanTag:setAlpha(0)
			sender:registerEventHandler("transition_complete_keyframe", zm_killed_popup_turnon)
		end

		if (event.interrupted) then
			return
		end

		sender:beginAnimation("keyframe", 1880, false, false, CoD.TweenType.Linear)
		sender:registerEventHandler("transition_complete_keyframe", zm_killed_popup_turnoff)
	end

	sender:beginAnimation("keyframe", 300, false, false, CoD.TweenType.Linear)
	sender:setTopBottom(true, true, 620, 0)
	sender:setAlpha(1)
	sender.CallingCardsFrameWidget:setAlpha(1)
	sender.CalloutHeading:setAlpha(1)
	sender.PlayerEmblem:setAlpha(1)
	sender.GamerTag:setAlpha(1)
	sender.ClanTag:setAlpha(1)
	sender:registerEventHandler("transition_complete_keyframe", zm_killed_popup_buffer)
end

local emblemtable = {}
local function addEmblemToTable( emblem )
	table.insert(emblemtable, emblem)
end

local event = nil
local CallOriginal = LUI.createMenu.T7Hud_ZM
LUI.createMenu.T7Hud_ZM = function(InstanceRef)
    local self = CallOriginal(InstanceRef)
	Engine.CreateModel(Engine.GetModelForController(InstanceRef), "killcam.rounds")
	Engine.CreateModel(Engine.GetModelForController(InstanceRef), "zombieArchtype")
	Engine.CreateModel(Engine.GetModelForController(InstanceRef), "zombieClantag")
	Engine.CreateModel(Engine.GetModelForController(InstanceRef), "hideFactionInfo")
	Engine.CreateModel(Engine.GetModelForController(InstanceRef), "hideKilledBy")

	addEmblemToTable("emblem_brain")
	addEmblemToTable("emblem_burger")
	addEmblemToTable("emblem_demon")
	addEmblemToTable("emblem_duck")
	addEmblemToTable("emblem_donut")
	addEmblemToTable("emblem_handeye")
	addEmblemToTable("emblem_headeye")
	addEmblemToTable("emblem_headshot")
	addEmblemToTable("emblem_medusa")
	addEmblemToTable("emblem_spider")
	addEmblemToTable("emblem_teddy")
	addEmblemToTable("emblem_viking")
	addEmblemToTable("emblem_zombie")

	local callout_killed = CoD.ZM_Callout_Killed.new( self, InstanceRef )
    callout_killed:setLeftRight( true, true, 475, 0 )
    callout_killed:setTopBottom( true, true, 650, 0 )
    callout_killed:setAlpha( 0 )
	
	self:subscribeToGlobalModel(InstanceRef, "PerController", "scriptNotify", function(ModelRef)
        if IsParamModelEqualToString(ModelRef, "show_outcome") then
			event,interrupted = true
			callout_killed:setAlpha(0)
			callout_killed.CallingCardsFrameWidget:setAlpha(0)
			callout_killed.CalloutHeading:setAlpha(0)
			callout_killed.PlayerEmblem:setAlpha(0)
			callout_killed.GamerTag:setAlpha(0)
			callout_killed.ClanTag:setAlpha(0)
			event,interrupted = false
		end

        if IsParamModelEqualToString(ModelRef, "killed_actor") then
			self:addElement( callout_killed )
			self.callout_killed = callout_killed

			local index = math.random(1, 750)
			CoD.ChallengesUtility.SetCallingCardForWidget( callout_killed.CallingCardsFrameWidget.CardIconFrame, GetBackgroundByID( index ), "HUD" )

			local emblemIndex = math.random(1, #emblemtable)
			callout_killed.PlayerEmblem:setImage( RegisterImage( emblemtable[emblemIndex] ) )
			
			callout_killed:subscribeToModel(Engine.GetModel(Engine.GetModelForController(controller), "zombieArchtype"), function(modelRef) 
				local name = Engine.GetModelValue(modelRef)
				if name then
					callout_killed.GamerTag.itemName:setText( name )
				end
			end)

			callout_killed:subscribeToModel(Engine.GetModel(Engine.GetModelForController(controller), "zombieClantag"), function(modelRef) 
				local tag = Engine.GetModelValue(modelRef)
				if tag then
					callout_killed.ClanTag.itemName:setText( StringAsClanTag( tag ) )
				end
			end)

			zm_killed_popup(callout_killed, event)

        end
    end)

    self:addElement( callout_killed )
	self.callout_killed = callout_killed

	local killcammenu = LUI.createMenu.KillcamMenu( InstanceRef )
	self:addElement( killcammenu )
	self.killcammenu = killcammenu

    local Outcome = CoD.Outcome.new( self, InstanceRef )
    Outcome:setLeftRight( true, true, 0, 0 )
    Outcome:setTopBottom( true, true, 0, 0 )
    Outcome:setAlpha( 1 )
    self:addElement( Outcome )
	self.Outcome = Outcome

	local UpdateVisibility_Killcam_Internal = function ( model )
		Update_Killcam_Visibility( killcammenu, {
			controller = InstanceRef
		} )
	end

	local perControllerModel = Engine.GetModelForController( InstanceRef )
	killcammenu:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), UpdateVisibility_Killcam_Internal )
	killcammenu:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_FINAL_KILLCAM ), UpdateVisibility_Killcam_Internal )
	killcammenu:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM ), UpdateVisibility_Killcam_Internal )

	self.clipPerState = {
		DefaultState = {
			DefaultClip = function()
				self:setupElementClipCounter(1)
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.killcammenu:close()
		self.Outcome:close()
		self.callout_killed:close()
	end )

    return self
end

local CallOriginal = LUI.createMenu.T7Hud_zm_factory
LUI.createMenu.T7Hud_zm_factory = function(InstanceRef)
    local self = CallOriginal(InstanceRef)
	Engine.CreateModel(Engine.GetModelForController(InstanceRef), "killcam.rounds")
	Engine.CreateModel(Engine.GetModelForController(InstanceRef), "zombieArchtype")
	Engine.CreateModel(Engine.GetModelForController(InstanceRef), "zombieClantag")
	Engine.CreateModel(Engine.GetModelForController(InstanceRef), "hideFactionInfo")
	Engine.CreateModel(Engine.GetModelForController(InstanceRef), "hideKilledBy")

	addEmblemToTable("emblem_brain")
	addEmblemToTable("emblem_burger")
	addEmblemToTable("emblem_demon")
	addEmblemToTable("emblem_duck")
	addEmblemToTable("emblem_donut")
	addEmblemToTable("emblem_handeye")
	addEmblemToTable("emblem_headeye")
	addEmblemToTable("emblem_headshot")
	addEmblemToTable("emblem_medusa")
	addEmblemToTable("emblem_spider")
	addEmblemToTable("emblem_teddy")
	addEmblemToTable("emblem_viking")
	addEmblemToTable("emblem_zombie")

	local callout_killed = CoD.ZM_Callout_Killed.new( self, InstanceRef )
    callout_killed:setLeftRight( true, true, 475, 0 )
    callout_killed:setTopBottom( true, true, 650, 0 )
    callout_killed:setAlpha( 0 )
	
	self:subscribeToGlobalModel(InstanceRef, "PerController", "scriptNotify", function(ModelRef)
        if IsParamModelEqualToString(ModelRef, "show_outcome") then
			event,interrupted = true
			callout_killed:setAlpha(0)
			callout_killed.CallingCardsFrameWidget:setAlpha(0)
			callout_killed.CalloutHeading:setAlpha(0)
			callout_killed.PlayerEmblem:setAlpha(0)
			callout_killed.GamerTag:setAlpha(0)
			callout_killed.ClanTag:setAlpha(0)
			event,interrupted = false
		end

        if IsParamModelEqualToString(ModelRef, "killed_actor") then
			self:addElement( callout_killed )
			self.callout_killed = callout_killed

			local index = math.random(1, 750)
			CoD.ChallengesUtility.SetCallingCardForWidget( callout_killed.CallingCardsFrameWidget.CardIconFrame, GetBackgroundByID( index ), "HUD" )

			local emblemIndex = math.random(1, #emblemtable)
			callout_killed.PlayerEmblem:setImage( RegisterImage( emblemtable[emblemIndex] ) )
			
			callout_killed:subscribeToModel(Engine.GetModel(Engine.GetModelForController(controller), "zombieArchtype"), function(modelRef) 
				local name = Engine.GetModelValue(modelRef)
				if name then
					callout_killed.GamerTag.itemName:setText( name )
				end
			end)

			callout_killed:subscribeToModel(Engine.GetModel(Engine.GetModelForController(controller), "zombieClantag"), function(modelRef) 
				local tag = Engine.GetModelValue(modelRef)
				if tag then
					callout_killed.ClanTag.itemName:setText( StringAsClanTag( tag ) )
				end
			end)

			zm_killed_popup(callout_killed, event)

        end
    end)

    self:addElement( callout_killed )
	self.callout_killed = callout_killed

	local killcammenu = LUI.createMenu.KillcamMenu( InstanceRef )
	self:addElement( killcammenu )
	self.killcammenu = killcammenu

    Outcome = CoD.Outcome.new( self, InstanceRef )
    Outcome:setLeftRight( true, true, 0, 0 )
    Outcome:setTopBottom( true, true, 0, 0 )
    Outcome:setAlpha( 1 )
    self:addElement( Outcome )
	self.Outcome = Outcome

	local UpdateVisibility_Killcam_Internal = function ( model )
		Update_Killcam_Visibility( killcammenu, {
			controller = InstanceRef
		} )
	end

	local perControllerModel = Engine.GetModelForController( InstanceRef )
	killcammenu:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), UpdateVisibility_Killcam_Internal )
	killcammenu:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_FINAL_KILLCAM ), UpdateVisibility_Killcam_Internal )
	killcammenu:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM ), UpdateVisibility_Killcam_Internal )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.killcammenu:close()
		self.Outcome:close()
	end )

    return self
end

local CallOriginal = LUI.createMenu.T7Hud_zm_castle
LUI.createMenu.T7Hud_zm_castle = function(InstanceRef)
    local self = CallOriginal(InstanceRef)
	Engine.CreateModel(Engine.GetModelForController(InstanceRef), "killcam.rounds")
	Engine.CreateModel(Engine.GetModelForController(InstanceRef), "zombieArchtype")
	Engine.CreateModel(Engine.GetModelForController(InstanceRef), "zombieClantag")
	Engine.CreateModel(Engine.GetModelForController(InstanceRef), "hideFactionInfo")
	Engine.CreateModel(Engine.GetModelForController(InstanceRef), "hideKilledBy")

	addEmblemToTable("emblem_brain")
	addEmblemToTable("emblem_burger")
	addEmblemToTable("emblem_demon")
	addEmblemToTable("emblem_duck")
	addEmblemToTable("emblem_donut")
	addEmblemToTable("emblem_handeye")
	addEmblemToTable("emblem_headeye")
	addEmblemToTable("emblem_headshot")
	addEmblemToTable("emblem_medusa")
	addEmblemToTable("emblem_spider")
	addEmblemToTable("emblem_teddy")
	addEmblemToTable("emblem_viking")
	addEmblemToTable("emblem_zombie")

	local callout_killed = CoD.ZM_Callout_Killed.new( self, InstanceRef )
    callout_killed:setLeftRight( true, true, 475, 0 )
    callout_killed:setTopBottom( true, true, 650, 0 )
    callout_killed:setAlpha( 0 )
	
	self:subscribeToGlobalModel(InstanceRef, "PerController", "scriptNotify", function(ModelRef)
        if IsParamModelEqualToString(ModelRef, "show_outcome") then
			event,interrupted = true
			callout_killed:setAlpha(0)
			callout_killed.CallingCardsFrameWidget:setAlpha(0)
			callout_killed.CalloutHeading:setAlpha(0)
			callout_killed.PlayerEmblem:setAlpha(0)
			callout_killed.GamerTag:setAlpha(0)
			callout_killed.ClanTag:setAlpha(0)
			event,interrupted = false
		end

        if IsParamModelEqualToString(ModelRef, "killed_actor") then
			self:addElement( callout_killed )
			self.callout_killed = callout_killed

			local index = math.random(1, 750)
			CoD.ChallengesUtility.SetCallingCardForWidget( callout_killed.CallingCardsFrameWidget.CardIconFrame, GetBackgroundByID( index ), "HUD" )

			local emblemIndex = math.random(1, #emblemtable)
			callout_killed.PlayerEmblem:setImage( RegisterImage( emblemtable[emblemIndex] ) )
			
			callout_killed:subscribeToModel(Engine.GetModel(Engine.GetModelForController(controller), "zombieArchtype"), function(modelRef) 
				local name = Engine.GetModelValue(modelRef)
				if name then
					callout_killed.GamerTag.itemName:setText( name )
				end
			end)

			callout_killed:subscribeToModel(Engine.GetModel(Engine.GetModelForController(controller), "zombieClantag"), function(modelRef) 
				local tag = Engine.GetModelValue(modelRef)
				if tag then
					callout_killed.ClanTag.itemName:setText( StringAsClanTag( tag ) )
				end
			end)

			zm_killed_popup(callout_killed, event)

        end
    end)

    self:addElement( callout_killed )
	self.callout_killed = callout_killed

	local killcammenu = LUI.createMenu.KillcamMenu( InstanceRef )
	self:addElement( killcammenu )
	self.killcammenu = killcammenu

    Outcome = CoD.Outcome.new( self, InstanceRef )
    Outcome:setLeftRight( true, true, 0, 0 )
    Outcome:setTopBottom( true, true, 0, 0 )
    Outcome:setAlpha( 1 )
    self:addElement( Outcome )
	self.Outcome = Outcome

	local UpdateVisibility_Killcam_Internal = function ( model )
		Update_Killcam_Visibility( killcammenu, {
			controller = InstanceRef
		} )
	end

	local perControllerModel = Engine.GetModelForController( InstanceRef )
	killcammenu:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), UpdateVisibility_Killcam_Internal )
	killcammenu:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_FINAL_KILLCAM ), UpdateVisibility_Killcam_Internal )
	killcammenu:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM ), UpdateVisibility_Killcam_Internal )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.killcammenu:close()
		self.Outcome:close()
	end )

    return self
end

local CallOriginal = LUI.createMenu.T7Hud_zm_island 
LUI.createMenu.T7Hud_zm_island  = function(InstanceRef)
    local self = CallOriginal(InstanceRef)
	Engine.CreateModel(Engine.GetModelForController(InstanceRef), "killcam.rounds")
	Engine.CreateModel(Engine.GetModelForController(InstanceRef), "zombieArchtype")
	Engine.CreateModel(Engine.GetModelForController(InstanceRef), "zombieClantag")
	Engine.CreateModel(Engine.GetModelForController(InstanceRef), "hideFactionInfo")
	Engine.CreateModel(Engine.GetModelForController(InstanceRef), "hideKilledBy")

	addEmblemToTable("emblem_brain")
	addEmblemToTable("emblem_burger")
	addEmblemToTable("emblem_demon")
	addEmblemToTable("emblem_duck")
	addEmblemToTable("emblem_donut")
	addEmblemToTable("emblem_handeye")
	addEmblemToTable("emblem_headeye")
	addEmblemToTable("emblem_headshot")
	addEmblemToTable("emblem_medusa")
	addEmblemToTable("emblem_spider")
	addEmblemToTable("emblem_teddy")
	addEmblemToTable("emblem_viking")
	addEmblemToTable("emblem_zombie")

	local callout_killed = CoD.ZM_Callout_Killed.new( self, InstanceRef )
    callout_killed:setLeftRight( true, true, 475, 0 )
    callout_killed:setTopBottom( true, true, 650, 0 )
    callout_killed:setAlpha( 0 )
	
	self:subscribeToGlobalModel(InstanceRef, "PerController", "scriptNotify", function(ModelRef)
        if IsParamModelEqualToString(ModelRef, "show_outcome") then
			event,interrupted = true
			callout_killed:setAlpha(0)
			callout_killed.CallingCardsFrameWidget:setAlpha(0)
			callout_killed.CalloutHeading:setAlpha(0)
			callout_killed.PlayerEmblem:setAlpha(0)
			callout_killed.GamerTag:setAlpha(0)
			callout_killed.ClanTag:setAlpha(0)
			event,interrupted = false
		end

        if IsParamModelEqualToString(ModelRef, "killed_actor") then
			self:addElement( callout_killed )
			self.callout_killed = callout_killed

			local index = math.random(1, 750)
			CoD.ChallengesUtility.SetCallingCardForWidget( callout_killed.CallingCardsFrameWidget.CardIconFrame, GetBackgroundByID( index ), "HUD" )

			local emblemIndex = math.random(1, #emblemtable)
			callout_killed.PlayerEmblem:setImage( RegisterImage( emblemtable[emblemIndex] ) )
			
			callout_killed:subscribeToModel(Engine.GetModel(Engine.GetModelForController(controller), "zombieArchtype"), function(modelRef) 
				local name = Engine.GetModelValue(modelRef)
				if name then
					callout_killed.GamerTag.itemName:setText( name )
				end
			end)

			callout_killed:subscribeToModel(Engine.GetModel(Engine.GetModelForController(controller), "zombieClantag"), function(modelRef) 
				local tag = Engine.GetModelValue(modelRef)
				if tag then
					callout_killed.ClanTag.itemName:setText( StringAsClanTag( tag ) )
				end
			end)

			zm_killed_popup(callout_killed, event)

        end
    end)

    self:addElement( callout_killed )
	self.callout_killed = callout_killed


	local killcammenu = LUI.createMenu.KillcamMenu( InstanceRef )
	self:addElement( killcammenu )
	self.killcammenu = killcammenu

    Outcome = CoD.Outcome.new( self, InstanceRef )
    Outcome:setLeftRight( true, true, 0, 0 )
    Outcome:setTopBottom( true, true, 0, 0 )
    Outcome:setAlpha( 1 )
    self:addElement( Outcome )
	self.Outcome = Outcome

	local UpdateVisibility_Killcam_Internal = function ( model )
		Update_Killcam_Visibility( killcammenu, {
			controller = InstanceRef
		} )
	end

	local perControllerModel = Engine.GetModelForController( InstanceRef )
	killcammenu:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), UpdateVisibility_Killcam_Internal )
	killcammenu:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_FINAL_KILLCAM ), UpdateVisibility_Killcam_Internal )
	killcammenu:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM ), UpdateVisibility_Killcam_Internal )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.killcammenu:close()
		self.Outcome:close()
	end )

    return self
end

local CallOriginal = LUI.createMenu.T7Hud_zm_stalingrad 
LUI.createMenu.T7Hud_zm_stalingrad  = function(InstanceRef)
    local self = CallOriginal(InstanceRef)
	Engine.CreateModel(Engine.GetModelForController(InstanceRef), "killcam.rounds")
	Engine.CreateModel(Engine.GetModelForController(InstanceRef), "zombieArchtype")
	Engine.CreateModel(Engine.GetModelForController(InstanceRef), "zombieClantag")
	Engine.CreateModel(Engine.GetModelForController(InstanceRef), "hideFactionInfo")
	Engine.CreateModel(Engine.GetModelForController(InstanceRef), "hideKilledBy")

	addEmblemToTable("emblem_brain")
	addEmblemToTable("emblem_burger")
	addEmblemToTable("emblem_demon")
	addEmblemToTable("emblem_duck")
	addEmblemToTable("emblem_donut")
	addEmblemToTable("emblem_handeye")
	addEmblemToTable("emblem_headeye")
	addEmblemToTable("emblem_headshot")
	addEmblemToTable("emblem_medusa")
	addEmblemToTable("emblem_spider")
	addEmblemToTable("emblem_teddy")
	addEmblemToTable("emblem_viking")
	addEmblemToTable("emblem_zombie")

	local callout_killed = CoD.ZM_Callout_Killed.new( self, InstanceRef )
    callout_killed:setLeftRight( true, true, 475, 0 )
    callout_killed:setTopBottom( true, true, 650, 0 )
    callout_killed:setAlpha( 0 )
	
	self:subscribeToGlobalModel(InstanceRef, "PerController", "scriptNotify", function(ModelRef)
        if IsParamModelEqualToString(ModelRef, "show_outcome") then
			event,interrupted = true
			callout_killed:setAlpha(0)
			callout_killed.CallingCardsFrameWidget:setAlpha(0)
			callout_killed.CalloutHeading:setAlpha(0)
			callout_killed.PlayerEmblem:setAlpha(0)
			callout_killed.GamerTag:setAlpha(0)
			callout_killed.ClanTag:setAlpha(0)
			event,interrupted = false
		end

        if IsParamModelEqualToString(ModelRef, "killed_actor") then
			self:addElement( callout_killed )
			self.callout_killed = callout_killed

			local index = math.random(1, 750)
			CoD.ChallengesUtility.SetCallingCardForWidget( callout_killed.CallingCardsFrameWidget.CardIconFrame, GetBackgroundByID( index ), "HUD" )

			local emblemIndex = math.random(1, #emblemtable)
			callout_killed.PlayerEmblem:setImage( RegisterImage( emblemtable[emblemIndex] ) )
			
			callout_killed:subscribeToModel(Engine.GetModel(Engine.GetModelForController(controller), "zombieArchtype"), function(modelRef) 
				local name = Engine.GetModelValue(modelRef)
				if name then
					callout_killed.GamerTag.itemName:setText( name )
				end
			end)

			callout_killed:subscribeToModel(Engine.GetModel(Engine.GetModelForController(controller), "zombieClantag"), function(modelRef) 
				local tag = Engine.GetModelValue(modelRef)
				if tag then
					callout_killed.ClanTag.itemName:setText( StringAsClanTag( tag ) )
				end
			end)

			zm_killed_popup(callout_killed, event)

        end
    end)

    self:addElement( callout_killed )
	self.callout_killed = callout_killed

	local killcammenu = LUI.createMenu.KillcamMenu( InstanceRef )
	self:addElement( killcammenu )
	self.killcammenu = killcammenu

    Outcome = CoD.Outcome.new( self, InstanceRef )
    Outcome:setLeftRight( true, true, 0, 0 )
    Outcome:setTopBottom( true, true, 0, 0 )
    Outcome:setAlpha( 1 )
    self:addElement( Outcome )
	self.Outcome = Outcome

	local UpdateVisibility_Killcam_Internal = function ( model )
		Update_Killcam_Visibility( killcammenu, {
			controller = InstanceRef
		} )
	end

	local perControllerModel = Engine.GetModelForController( InstanceRef )
	killcammenu:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), UpdateVisibility_Killcam_Internal )
	killcammenu:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_FINAL_KILLCAM ), UpdateVisibility_Killcam_Internal )
	killcammenu:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM ), UpdateVisibility_Killcam_Internal )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.killcammenu:close()
		self.Outcome:close()
	end )

    return self
end

local CallOriginal = LUI.createMenu.T7Hud_zm_genesis 
LUI.createMenu.T7Hud_zm_genesis  = function(InstanceRef)
    local self = CallOriginal(InstanceRef)
	Engine.CreateModel(Engine.GetModelForController(InstanceRef), "killcam.rounds")
	Engine.CreateModel(Engine.GetModelForController(InstanceRef), "zombieArchtype")
	Engine.CreateModel(Engine.GetModelForController(InstanceRef), "zombieClantag")
	Engine.CreateModel(Engine.GetModelForController(InstanceRef), "hideFactionInfo")
	Engine.CreateModel(Engine.GetModelForController(InstanceRef), "hideKilledBy")

	addEmblemToTable("emblem_brain")
	addEmblemToTable("emblem_burger")
	addEmblemToTable("emblem_demon")
	addEmblemToTable("emblem_duck")
	addEmblemToTable("emblem_donut")
	addEmblemToTable("emblem_handeye")
	addEmblemToTable("emblem_headeye")
	addEmblemToTable("emblem_headshot")
	addEmblemToTable("emblem_medusa")
	addEmblemToTable("emblem_spider")
	addEmblemToTable("emblem_teddy")
	addEmblemToTable("emblem_viking")
	addEmblemToTable("emblem_zombie")

	local callout_killed = CoD.ZM_Callout_Killed.new( self, InstanceRef )
    callout_killed:setLeftRight( true, true, 475, 0 )
    callout_killed:setTopBottom( true, true, 650, 0 )
    callout_killed:setAlpha( 0 )
	
	self:subscribeToGlobalModel(InstanceRef, "PerController", "scriptNotify", function(ModelRef)
        if IsParamModelEqualToString(ModelRef, "show_outcome") then
			event,interrupted = true
			callout_killed:setAlpha(0)
			callout_killed.CallingCardsFrameWidget:setAlpha(0)
			callout_killed.CalloutHeading:setAlpha(0)
			callout_killed.PlayerEmblem:setAlpha(0)
			callout_killed.GamerTag:setAlpha(0)
			callout_killed.ClanTag:setAlpha(0)
			event,interrupted = false
		end

        if IsParamModelEqualToString(ModelRef, "killed_actor") then
			self:addElement( callout_killed )
			self.callout_killed = callout_killed

			local index = math.random(1, 750)
			CoD.ChallengesUtility.SetCallingCardForWidget( callout_killed.CallingCardsFrameWidget.CardIconFrame, GetBackgroundByID( index ), "HUD" )

			local emblemIndex = math.random(1, #emblemtable)
			callout_killed.PlayerEmblem:setImage( RegisterImage( emblemtable[emblemIndex] ) )
			
			callout_killed:subscribeToModel(Engine.GetModel(Engine.GetModelForController(controller), "zombieArchtype"), function(modelRef) 
				local name = Engine.GetModelValue(modelRef)
				if name then
					callout_killed.GamerTag.itemName:setText( name )
				end
			end)

			callout_killed:subscribeToModel(Engine.GetModel(Engine.GetModelForController(controller), "zombieClantag"), function(modelRef) 
				local tag = Engine.GetModelValue(modelRef)
				if tag then
					callout_killed.ClanTag.itemName:setText( StringAsClanTag( tag ) )
				end
			end)

			zm_killed_popup(callout_killed, event)

        end
    end)

    self:addElement( callout_killed )
	self.callout_killed = callout_killed

	local killcammenu = LUI.createMenu.KillcamMenu( InstanceRef )
	self:addElement( killcammenu )
	self.killcammenu = killcammenu

    Outcome = CoD.Outcome.new( self, InstanceRef )
    Outcome:setLeftRight( true, true, 0, 0 )
    Outcome:setTopBottom( true, true, 0, 0 )
    Outcome:setAlpha( 1 )
    self:addElement( Outcome )
	self.Outcome = Outcome

	local UpdateVisibility_Killcam_Internal = function ( model )
		Update_Killcam_Visibility( killcammenu, {
			controller = InstanceRef
		} )
	end

	local perControllerModel = Engine.GetModelForController( InstanceRef )
	killcammenu:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), UpdateVisibility_Killcam_Internal )
	killcammenu:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_FINAL_KILLCAM ), UpdateVisibility_Killcam_Internal )
	killcammenu:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM ), UpdateVisibility_Killcam_Internal )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.killcammenu:close()
		self.Outcome:close()
	end )

    return self
end

local CallOriginal = LUI.createMenu.T7Hud_zm_dlc5  
LUI.createMenu.T7Hud_zm_dlc5   = function(InstanceRef)
    local self = CallOriginal(InstanceRef)
	Engine.CreateModel(Engine.GetModelForController(InstanceRef), "killcam.rounds")
	Engine.CreateModel(Engine.GetModelForController(InstanceRef), "zombieArchtype")
	Engine.CreateModel(Engine.GetModelForController(InstanceRef), "zombieClantag")
	Engine.CreateModel(Engine.GetModelForController(InstanceRef), "hideFactionInfo")
	Engine.CreateModel(Engine.GetModelForController(InstanceRef), "hideKilledBy")

	addEmblemToTable("emblem_brain")
	addEmblemToTable("emblem_burger")
	addEmblemToTable("emblem_demon")
	addEmblemToTable("emblem_duck")
	addEmblemToTable("emblem_donut")
	addEmblemToTable("emblem_handeye")
	addEmblemToTable("emblem_headeye")
	addEmblemToTable("emblem_headshot")
	addEmblemToTable("emblem_medusa")
	addEmblemToTable("emblem_spider")
	addEmblemToTable("emblem_teddy")
	addEmblemToTable("emblem_viking")
	addEmblemToTable("emblem_zombie")

	local callout_killed = CoD.ZM_Callout_Killed.new( self, InstanceRef )
    callout_killed:setLeftRight( true, true, 475, 0 )
    callout_killed:setTopBottom( true, true, 650, 0 )
    callout_killed:setAlpha( 0 )
	
	self:subscribeToGlobalModel(InstanceRef, "PerController", "scriptNotify", function(ModelRef)
        if IsParamModelEqualToString(ModelRef, "show_outcome") then
			event,interrupted = true
			callout_killed:setAlpha(0)
			callout_killed.CallingCardsFrameWidget:setAlpha(0)
			callout_killed.CalloutHeading:setAlpha(0)
			callout_killed.PlayerEmblem:setAlpha(0)
			callout_killed.GamerTag:setAlpha(0)
			callout_killed.ClanTag:setAlpha(0)
			event,interrupted = false
		end

        if IsParamModelEqualToString(ModelRef, "killed_actor") then
			self:addElement( callout_killed )
			self.callout_killed = callout_killed

			local index = math.random(1, 750)
			CoD.ChallengesUtility.SetCallingCardForWidget( callout_killed.CallingCardsFrameWidget.CardIconFrame, GetBackgroundByID( index ), "HUD" )

			local emblemIndex = math.random(1, #emblemtable)
			callout_killed.PlayerEmblem:setImage( RegisterImage( emblemtable[emblemIndex] ) )
			
			callout_killed:subscribeToModel(Engine.GetModel(Engine.GetModelForController(controller), "zombieArchtype"), function(modelRef) 
				local name = Engine.GetModelValue(modelRef)
				if name then
					callout_killed.GamerTag.itemName:setText( name )
				end
			end)

			callout_killed:subscribeToModel(Engine.GetModel(Engine.GetModelForController(controller), "zombieClantag"), function(modelRef) 
				local tag = Engine.GetModelValue(modelRef)
				if tag then
					callout_killed.ClanTag.itemName:setText( StringAsClanTag( tag ) )
				end
			end)

			zm_killed_popup(callout_killed, event)

        end
    end)

    self:addElement( callout_killed )
	self.callout_killed = callout_killed

	local killcammenu = LUI.createMenu.KillcamMenu( InstanceRef )
	self:addElement( killcammenu )
	self.killcammenu = killcammenu

    Outcome = CoD.Outcome.new( self, InstanceRef )
    Outcome:setLeftRight( true, true, 0, 0 )
    Outcome:setTopBottom( true, true, 0, 0 )
    Outcome:setAlpha( 1 )
    self:addElement( Outcome )
	self.Outcome = Outcome

	local UpdateVisibility_Killcam_Internal = function ( model )
		Update_Killcam_Visibility( killcammenu, {
			controller = InstanceRef
		} )
	end

	local perControllerModel = Engine.GetModelForController( InstanceRef )
	killcammenu:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), UpdateVisibility_Killcam_Internal )
	killcammenu:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_FINAL_KILLCAM ), UpdateVisibility_Killcam_Internal )
	killcammenu:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM ), UpdateVisibility_Killcam_Internal )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.killcammenu:close()
		self.Outcome:close()
	end )

    return self
end

local CallOriginal = LUI.createMenu.T7Hud_zm_tomb 
LUI.createMenu.T7Hud_zm_tomb  = function(InstanceRef)
    local self = CallOriginal(InstanceRef)
	Engine.CreateModel(Engine.GetModelForController(InstanceRef), "killcam.rounds")
	Engine.CreateModel(Engine.GetModelForController(InstanceRef), "zombieArchtype")
	Engine.CreateModel(Engine.GetModelForController(InstanceRef), "zombieClantag")
	Engine.CreateModel(Engine.GetModelForController(InstanceRef), "hideFactionInfo")
	Engine.CreateModel(Engine.GetModelForController(InstanceRef), "hideKilledBy")

	addEmblemToTable("emblem_brain")
	addEmblemToTable("emblem_burger")
	addEmblemToTable("emblem_demon")
	addEmblemToTable("emblem_duck")
	addEmblemToTable("emblem_donut")
	addEmblemToTable("emblem_handeye")
	addEmblemToTable("emblem_headeye")
	addEmblemToTable("emblem_headshot")
	addEmblemToTable("emblem_medusa")
	addEmblemToTable("emblem_spider")
	addEmblemToTable("emblem_teddy")
	addEmblemToTable("emblem_viking")
	addEmblemToTable("emblem_zombie")

	local callout_killed = CoD.ZM_Callout_Killed.new( self, InstanceRef )
    callout_killed:setLeftRight( true, true, 475, 0 )
    callout_killed:setTopBottom( true, true, 650, 0 )
    callout_killed:setAlpha( 0 )
	
	self:subscribeToGlobalModel(InstanceRef, "PerController", "scriptNotify", function(ModelRef)
        if IsParamModelEqualToString(ModelRef, "show_outcome") then
			event,interrupted = true
			callout_killed:setAlpha(0)
			callout_killed.CallingCardsFrameWidget:setAlpha(0)
			callout_killed.CalloutHeading:setAlpha(0)
			callout_killed.PlayerEmblem:setAlpha(0)
			callout_killed.GamerTag:setAlpha(0)
			callout_killed.ClanTag:setAlpha(0)
			event,interrupted = false
		end

        if IsParamModelEqualToString(ModelRef, "killed_actor") then
			self:addElement( callout_killed )
			self.callout_killed = callout_killed

			local index = math.random(1, 750)
			CoD.ChallengesUtility.SetCallingCardForWidget( callout_killed.CallingCardsFrameWidget.CardIconFrame, GetBackgroundByID( index ), "HUD" )

			local emblemIndex = math.random(1, #emblemtable)
			callout_killed.PlayerEmblem:setImage( RegisterImage( emblemtable[emblemIndex] ) )
			
			callout_killed:subscribeToModel(Engine.GetModel(Engine.GetModelForController(controller), "zombieArchtype"), function(modelRef) 
				local name = Engine.GetModelValue(modelRef)
				if name then
					callout_killed.GamerTag.itemName:setText( name )
				end
			end)

			callout_killed:subscribeToModel(Engine.GetModel(Engine.GetModelForController(controller), "zombieClantag"), function(modelRef) 
				local tag = Engine.GetModelValue(modelRef)
				if tag then
					callout_killed.ClanTag.itemName:setText( StringAsClanTag( tag ) )
				end
			end)

			zm_killed_popup(callout_killed, event)

        end
    end)

    self:addElement( callout_killed )
	self.callout_killed = callout_killed

	local killcammenu = LUI.createMenu.KillcamMenu( InstanceRef )
	self:addElement( killcammenu )
	self.killcammenu = killcammenu

    Outcome = CoD.Outcome.new( self, InstanceRef )
    Outcome:setLeftRight( true, true, 0, 0 )
    Outcome:setTopBottom( true, true, 0, 0 )
    Outcome:setAlpha( 1 )
    self:addElement( Outcome )
	self.Outcome = Outcome

	local UpdateVisibility_Killcam_Internal = function ( model )
		Update_Killcam_Visibility( killcammenu, {
			controller = InstanceRef
		} )
	end

	local perControllerModel = Engine.GetModelForController( InstanceRef )
	killcammenu:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), UpdateVisibility_Killcam_Internal )
	killcammenu:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_FINAL_KILLCAM ), UpdateVisibility_Killcam_Internal )
	killcammenu:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM ), UpdateVisibility_Killcam_Internal )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.killcammenu:close()
		self.Outcome:close()
	end )

    return self
end