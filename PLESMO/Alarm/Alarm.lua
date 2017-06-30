
Test_RSP = {} -- Define table with same name as file

function Test_RSP.init()

engine.alarm('ID', 'Cause', 'Hello From The Gateway !!') 

end

function Test_RSP.info()
	info = 'Checks if connection with RSP is working'
	return info
end

function Test_RSP.finalize()
	print( 'Script Test_RSP removed' )
end

function Test_RSP.validuntil()
validDate = '2015-08-01T12:00:00'
	return validDate
end

function Test_RSP.buildversion()
versionBuild = '2015-06-01T12:00:00'
	return versionBuild
end





