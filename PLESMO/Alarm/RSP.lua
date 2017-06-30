
RSP = {} -- Define table with same name as file

function RSP.init() 
end


function RSP.info()
	info = 'Functionality to send alarm to RSP via sendAlarm function'
	return info
end

function RSP.finalize()
	print( 'Script RSP removed' )
end

function RSP.sendAlarm(arg1, arg2, arg3)
	print( 'Alarm send to RSP with info:', arg1, arg2, arg3 )
	engine.alarm(arg1, arg2, arg3)		
end








