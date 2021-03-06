local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()					npcHandler:onThink()					end

function creatureSayCallback(cid, type, msg)
local player = Player(cid)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	
if msgcontains(msg, 'belongings of deceasead') or msgcontains(msg, 'medicine') then
	if player:getItemCount(13506) >= 1 then
		npcHandler:say('Did you bring me the medicine pouch?', cid)
		npcHandler.topic[cid] = 1
	else
		npcHandler:say('I need {medicine pouch and i\'ll exchange it {belongings of deceased}. Come back when you have it.', cid)
end

elseif msgcontains(msg, 'yes') and npcHandler.topic[cid] == 1 then
	if player:getItemCount(13506) >= 1 then
		player:removeItem(13506, 1)
		npcHandler:say('Here you are', cid)
		player:addItem(13670, 1)
		end
	else
		npcHandler:say('You do not have item i require from you.', cid)
end
return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())