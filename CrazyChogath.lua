if myHero.charName ~= "Chogath" then
return
end

--[ScriptStatus.net Tracker]--
assert(load(Base64Decode("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"), nil, "bt", _ENV))() ScriptStatus("WJMKMQIILQP") 
--[ScriptStatus.net Tracker]--

local VP = nil

require 'SOW' 
require 'VPrediction' 



function OnLoad()

Vars()
Menu()

end

function Vars()

ts = TargetSelector(TARGET_LESS_CAST_PRIORITY,1000)
VP = VPrediction()
sow = SOW(VP)

end

function Menu()
Menu = scriptConfig("Chogath Combo", "chogath")

Menu:addSubMenu("Combo Settings", "combosettings")
Menu.combosettings:addParam("useq", "Use Q", SCRIPT_PARAM_ONOFF, true)
Menu.combosettings:addParam("usew", "Use W", SCRIPT_PARAM_ONOFF, true)
Menu.combosettings:addParam("combokey", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)

Menu:addSubMenu("KS Settings", "kssettings")
Menu.kssettings:addParam("useq", "Use Q", SCRIPT_PARAM_ONOFF, true)
Menu.kssettings:addParam("usew", "Use W", SCRIPT_PARAM_ONOFF, true)
Menu.kssettings:addParam("user", "Use R", SCRIPT_PARAM_ONOFF, true)

Menu:addSubMenu("Orbwalker Settings", "orbsettings")
Menu.orbsettings:addParam("usesow", "Use SOW", SCRIPT_PARAM_ONOFF, true)

Menu:addSubMenu("Chogath: Draw","Draw")
Menu.Draw:addParam("qDraw", "Draw Q", SCRIPT_PARAM_ONOFF, true)
Menu.Draw:addParam("wDraw", "Draw W", SCRIPT_PARAM_ONOFF, true)

Menu:addSubMenu("Simple Orbwalker", "sow")
sow:LoadToMenu(Menu.sow) 

PrintChat ("<font color='#4169E1'>Crazy Cho'Gath loaded!</font>")

end


function OnTick()

Checks()
Autokill()

if Menu.combosettings.combokey then
	Combo()

end

end

function Checks()
	ts:update()
	target = ts.target

	Qready = (myHero:CanUseSpell(_Q) == READY)
	Wready = (myHero:CanUseSpell(_W) == READY)
	Eready = (myHero:CanUseSpell(_E) == READY)
	Rready = (myHero:CanUseSpell(_R) == READY)
end

function OnDraw()
 if not myHero.dead then
  if Menu.Draw.qDraw then 
   DrawCircle(myHero.x, myHero.y, myHero.z, 1000, 0x191970)
  end
  if Menu.Draw.wDraw then 
   DrawCircle(myHero.x, myHero.y, myHero.z, 675, 0x191970)
  end
 end
end

function Combo()
	if ValidTarget(target, 1000) then
		if Qready and Menu.combosettings.combokey and Menu.combosettings.useq then
			local CastPosition,  HitChance,  Position = VP:GetCircularAOECastPosition(target, 1.2, 250, 950, math.huge, myHero, false)
			if HitChance >= 2 then
				CastSpell(_Q, CastPosition.x, CastPosition.z)
			end
		end
	end

	if ValidTarget(target, 675) then
		if Wready and Menu.combosettings.usew then
			local CastPosition,  HitChance,  Position = VP:GetLineCastPosition(target, 0.25, 210, 660, math.huge, myHero, false)
			if HitChance >= 2 then
				CastSpell(_W, CastPosition.x, CastPosition.z)
			end
		end
	end

	if ValidTarget(target, 235) then
		if Rready and Menu.kssettings.user then
			local Rdmg = getDmg('R', target, myHero)
			if target.health < Rdmg then
				CastSpell(_R, target)
			end
		end
	end
end
		
function Autokill()
	
	for i, enemy in pairs(GetEnemyHeroes()) do
		local Qdmg = getDmg('Q', enemy, myHero)
		local Wdmg = getDmg('W', enemy, myHero)
		local Rdmg = getDmg('R', enemy, myHero)

		if Qready and ValidTarget(enemy, 1000) and enemy.health < Qdmg then
			local CastPosition,  HitChance,  Position = VP:GetCircularAOECastPosition(enemy, 1.2, 250, 950, math.huge, myHero, false)
			if HitChance >= 2 then
				CastSpell(_Q, CastPosition.x, CastPosition.z)
			end
		elseif Wready and ValidTarget(enemy, 675) and enemy.health < Wdmg then
			local CastPosition,  HitChance,  Position = VP:GetLineCastPosition(enemy, 0.25, 210, 660, math.huge, myHero, false)
			if HitChance >= 2 then
				CastSpell(_W, CastPosition.x, CastPosition.z)
			end
		elseif Rready and ValidTarget(enemy, 235) and enemy.health < Rdmg then
			CastSpell(_R, enemy)
		end	
	end
end

function MoveToMouse()

	if Menu.combosettings.combokey and not Menu.orbsettings.usesow then
		myHero:MoveTo(mousePos.x, mousePos.z)
	end

end
