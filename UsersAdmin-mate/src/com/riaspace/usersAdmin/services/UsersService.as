package com.riaspace.usersAdmin.services
{
	import com.riaspace.usersAdmin.models.domain.User;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.remoting.RemoteObject;

	public class UsersService
	{
		// Injected
		public var remoteObject:RemoteObject;
		
		public function findAllUsers():AsyncToken
		{
			return remoteObject.findAllUsers();
		}
		
		public function create(user:User):AsyncToken
		{
			return remoteObject.create(user);
		}
	}
}