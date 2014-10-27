if myHero.charName ~= "Garen" then
return
end

function OnLoad()

Vars()
Menu()

end

function Vars()

ts = TargetSelector(TARGET_LESS_CAST_PRIORITY,400) -- don't know if targetselector is needed when it's not a combo, just KS

end

function Menu()
Menu = scriptConfig("Garen Ult Helper Menu", "garen")

Menu:addSubMenu("Garen Ult Helper", "kssettings")
Menu.kssettings:addParam("user", "Use Ult", SCRIPT_PARAM_ONOFF, true)


PrintChat ("<font color='#4169E1'>Garen Ult Helper loaded!</font>")

end

function OnTick()

Checks()
Autokill()

end

function Checks()
	ts:update()
	target = ts.target

	Rready = (myHero:CanUseSpell(_R) == READY)
end


function Autokill()
  local rLvl = myHero:GetSpellData(_R).level
  local bonus = rLvl == 0 and 0 or rLvl == 1 and 0.2875 or rLvl == 2 and 0.3333 or rLvl == 3 and 0.4
  for i, enemy in pairs(GetEnemyHeroes()) do
  local Rdmg = 175*rLvl+(enemy.maxHealth-enemy.health)*bonus
  local finalDmg = (100/(100+enemy.magicArmor))*Rdmg
  
  if Rready and ValidTarget(enemy, 400) and enemy.health < finalDmg then
   CastSpell(_R, enemy)
 end 
end
end