local FSM = {}
FSM.__index = FSM

function FSM.new(States, StartingState)
	local self = setmetatable({}, FSM)
	
	self.States = States
	self.State = StartingState or "_Initial"
	
	return self
end

function FSM:AddState(StateName, State)
	self.States[StateName] = State
end

function FSM:SetState(State)
	if not self.States[State] then return end
	
	self.States[self.State].Exit()
	local LastState = self.State
	
	self.State = State
	
	self.States[self.State].Enter(LastState)
end

function FSM:Update(DT)
	DT = DT or nil
	
	self.States[self.State].Update(DT)
end

return FSM