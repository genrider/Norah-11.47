local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setParameter(COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

function onGetFormulaValues(player, level, maglevel)
	--local min = (level / 5) + (maglevel * 3.2) + 20 =$A3*3+C$2*(12,9/2,5)
	--local max = (level / 5) + (maglevel * 5.4) + 40
	local min = (maglevel*3) + level*(4.2/2.5)
	local max = (maglevel*3) + level*(5.8/2.5)
	return min, max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant)
	return combat:execute(creature, variant)
end