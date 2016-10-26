component 
{
	public string function getBasePath(required string script_name){
		var path = arguments.script_name & '/';
		for(var i =listlen(path,'/'); 2 < i; i--){
			path = ListDeleteAt(path,i,'/');
		}
		return path;	
	}
}

